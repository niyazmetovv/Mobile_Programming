void main() {
  int target = 7;
  int current = 1;

  while (true) {
    if (current == target) {
      print('target reached: $current');
      break;
    }
    current++;
  }
}