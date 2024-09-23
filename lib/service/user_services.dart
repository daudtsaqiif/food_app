part of 'services.dart';

class UserServices {
  static Future<ApiReturnValue<User>> signIn(
      String email, String password) async {
    await Future.delayed(Duration(milliseconds: 500));

//login berhasil
    return ApiReturnValue(value: mockUser);

    //login gagal
    // return ApiReturnValue(message: 'Emain atau password salah');
  }
}
