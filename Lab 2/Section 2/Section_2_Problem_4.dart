void main() {
  String? nullableCity;
  String city = nullableCity ?? 'Tashkent';

  print('city: $city');

  nullableCity = 'Samarkand';
  city = nullableCity ?? 'Tashkent';

  print('city: $city');
}