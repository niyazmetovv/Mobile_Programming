void main() {
  int n = 5;

  int fact1 = 1;
  for (int i = 1; i <= n; i++) {
    fact1 *= i;
  }
  print('for loop: $fact1');

  List<int> numbers = [1, 2, 3, 4, 5];
  int fact2 = 1;
  for (var num in numbers) {
    fact2 *= num;
  }
  print('for-in loop: $fact2');
}