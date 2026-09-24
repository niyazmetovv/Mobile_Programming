List<int> transformList(List<int> numbers, int Function(int) transformer) {
  List<int> result = [];
  for (var num in numbers) {
    result.add(transformer(num));
  }
  return result;
}

void main() {
  List<int> list = [1, 2, 3, 4];
  var squared = transformList(list, (n) => n * n);
  print(squared);
}