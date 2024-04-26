abstract class UseCase<Output, Input> {
  const UseCase();

  Output call(Input params);
}

class NoParams {
  const NoParams();
}
