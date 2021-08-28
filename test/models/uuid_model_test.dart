import 'package:test/test.dart';
import 'package:wirecard/src/models/uuid_model.dart';

void main() {
  test('constructor', () {
    final response = UuidModel('2d797916-8b14-4d1c-83b2-ea42dbd577a6');
    expect(response.value, '2d797916-8b14-4d1c-83b2-ea42dbd577a6');
  });
  test('fromMap', () {
    final response = UuidModel.fromMap('2d7979168b144d1c83b2ea42dbd577a6');
    expect(response.value, '2d797916-8b14-4d1c-83b2-ea42dbd577a6');
  });
  test('toMap', () {
    final response = UuidModel('2d797916-8b14-4d1c-83b2-ea42dbd577a6').toMap();
    expect(response, '2d7979168b144d1c83b2ea42dbd577a6');
  });
  
}