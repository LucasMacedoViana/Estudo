import 'dart:io';

enum AuthMode { Signup, Login }

class AuthFormData{
  String name = '';
  String email = '';
  String password = '';
  File? image;
  AuthMode _mode = AuthMode.Login;

  bool get isSignup {
    return _mode == AuthMode.Signup;
  }
  bool get isLogin {
    return _mode == AuthMode.Login;
  }

  void toggleAuthMode(){
    _mode = isLogin ? AuthMode.Signup : AuthMode.Login;
  }

}