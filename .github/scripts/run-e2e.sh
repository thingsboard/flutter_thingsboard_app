#!/usr/bin/env bash
# Runs the Patrol tests in $TARGETS, then once more the test files that
# failed, after the E2E server answers again. The connection from the CI
# runners to the E2E server drops in bursts, and a test that fails on a
# dropped connection usually passes on a second try; a test that fails twice
# fails the job. Tests that passed only on the second try are listed in the
# job summary and as a warning, so flaky tests stay visible.
#
# A run that stopped before any test on a known CI failure (a Maven download
# limit, Xcode not finding the simulator) is started again once, after 60 s.
#
# Usage: run-e2e.sh <patrol test arguments other than --target>
# Environment: TARGETS (comma-separated test folders or files) and
# E2E_SERVER_URL.
set -uo pipefail

results=build/e2e
mkdir -p "$results"
summary=${GITHUB_STEP_SUMMARY:-/dev/null}

run_patrol() { # <log file> <targets> <patrol arguments...>
  local log=$1 targets=$2
  shift 2
  patrol test --target "$targets" "$@" 2>&1 | tee "$log"
  return "${PIPESTATUS[0]}"
}

# The test files of the failed tests in a Patrol log, as patrol_test/...
# paths separated by commas. A result line looks like
# `❌ test name (/full/some_test.dart) (37s)`, with colour codes.
failed_files() { # <log file>
  perl -ne 's/\e\[[0-9;]*[A-Za-z]//g;
    print "patrol_test$1\n" if /❌ .*\((\/[^)]+_test\.dart)\)/' "$1" |
    sort -u | paste -sd, -
}

# Waits up to 3 minutes for any HTTP answer from the E2E server.
wait_for_server() {
  local attempt code
  for attempt in $(seq 1 18); do
    code=$(curl -s -o /dev/null -w '%{http_code}' --max-time 10 "$E2E_SERVER_URL" || true)
    if [ "$code" != "000" ]; then
      echo "The E2E server answers (HTTP $code, check $attempt)."
      return 0
    fi
    echo "No answer from the E2E server (check $attempt of 18), waiting 10 s."
    sleep 10
  done
  return 1
}

# The CI failures that stop the run before any test and pass a minute later:
# Maven Central limiting the Gradle downloads, and Xcode not yet listing the
# simulator.
infra_failure() { # <log file>
  grep -aqE 'Too Many Requests|Could not resolve|Could not GET|xcodebuild exited with code 70|Unable to find a device matching' "$1"
}

run_patrol "$results/first-try.log" "$TARGETS" "$@"
status=$?
if [ "$status" -eq 0 ]; then
  exit 0
fi

failed=$(failed_files "$results/first-try.log")
if [ -z "$failed" ] && infra_failure "$results/first-try.log"; then
  echo "::warning::The run stopped before the tests on a download limit or Xcode not finding the simulator; trying the whole run again in 60 s."
  {
    echo "### E2E: the first try stopped before the tests"
    echo
    echo "A download limit or Xcode not finding the simulator; the whole run was tried again."
    echo
  } >> "$summary"
  echo "infrastructure" > "$results/retried.txt"
  sleep 60
  run_patrol "$results/whole-run-again.log" "$TARGETS" "$@"
  status=$?
  if [ "$status" -eq 0 ]; then
    echo "The whole run passed on the second try." >> "$summary"
    exit 0
  fi
  # The tests ran this time: their failures get the usual second try below.
  cp "$results/whole-run-again.log" "$results/first-try.log"
  failed=$(failed_files "$results/first-try.log")
fi

if [ -z "$failed" ]; then
  # Nothing ran, for example the build failed: a second try would not help.
  echo "::error::Patrol failed with no failed test listed; not tried again."
  exit "$status"
fi

echo "::group::Failed on the first try: ${failed//,/ }"
echo "Trying these again after the E2E server answers."
echo "::endgroup::"
{
  echo "### E2E: failed on the first try"
  echo
  tr ',' '\n' <<< "$failed" | sed 's/^/- /'
  echo
} >> "$summary"

# Keep the first try's Android test results and screenshots: the second try
# writes over them. The iOS .xcresult of each try has its own name.
for dir in build/app/outputs/androidTest-results patrol_test/screenshots; do
  if [ -d "$dir" ]; then
    mkdir -p "$results/first-try"
    cp -R "$dir" "$results/first-try/"
  fi
done
echo "$failed" > "$results/retried.txt"

if ! wait_for_server; then
  echo "::error::The E2E server ($E2E_SERVER_URL) did not answer for 3 minutes; the failed tests were not tried again."
  echo "The E2E server did not answer for 3 minutes, so the failed tests were not tried again." >> "$summary"
  exit "$status"
fi

run_patrol "$results/second-try.log" "$failed" "$@"
status=$?
if [ "$status" -eq 0 ]; then
  echo "::warning::Passed only on the second try: ${failed//,/, }. See the first try in the job log."
  echo "All of them passed on the second try." >> "$summary"
else
  still=$(failed_files "$results/second-try.log")
  echo "Failed again on the second try: ${still:-see the job log}." >> "$summary"
fi
exit "$status"
