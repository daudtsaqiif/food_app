part of 'services.dart';

class FoodServices {
  static Future<ApiReturnValue<List<Food>>> getFood() async {
    await Future.delayed(Duration(milliseconds: 500));

    return ApiReturnValue(value: mockFoods);
  }
}
