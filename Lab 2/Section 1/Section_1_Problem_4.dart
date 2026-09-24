void main(List<String> arguments) {
  double sum = 0;
  for (var arg in arguments) {
    sum += double.parse(arg);
  }
  double average = sum / arguments.length;
  print('average: $average');
}