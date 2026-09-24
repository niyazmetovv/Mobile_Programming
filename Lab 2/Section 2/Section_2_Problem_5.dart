void main() {
  dynamic value = 'hello dart';

  if (value is String) {
    print('length: ${value.length}');
  }

  value = 42;

  if (value is int) {
    print('is even: ${value.isEven}');
  }
}