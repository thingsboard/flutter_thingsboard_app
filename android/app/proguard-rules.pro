# The espressif library needs to have all their names and fields preserved.
-keep,allowoptimization class espressif.* { *; }

# AGP 9 dropped proguard-android.txt, which turned R8 optimizations off.
# Keep them off as before until the optimized build is tested on devices.
-dontoptimize
