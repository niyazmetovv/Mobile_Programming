String formatText(String text, [String prefix = '', String suffix = '']) {
  return '$prefix$text$suffix';
}

void main() {
  print(formatText('dart'));
  print(formatText('dart', '[ '));
  print(formatText('dart', '[ ', ' ]'));
}