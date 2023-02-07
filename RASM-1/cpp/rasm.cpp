#include <iostream>

int main() {
  int A, B, C, D, X;

  std::cout << "Enter a whole number: ";
  std::cin >> A;
  std::cout << "Enter a whole number: ";
  std::cin >> B;
  std::cout << "Enter a whole number: ";
  std::cin >> C;
  std::cout << "Enter a whole number: ";
  std::cin >> D;

  X = (A + B) - (C + D);

  std::cout << "X = (A + B) - (C + D) = " << X << std::endl;

  return 0;
}