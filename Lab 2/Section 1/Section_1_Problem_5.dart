void main(List<String> arguments) {
  if (arguments.length != 2) {
    print('provide exactly two arguments');
    return;
  }
  print('arguments: ${arguments[0]} and ${arguments[1]}');
}