// File: lib/demo_02.dart

bool checkPrime(int x) {
  if (x < 2) return false;
  for (int k = 2; k < x; k++) {
    if (x % k == 0) return false;
  }
  return true;
}