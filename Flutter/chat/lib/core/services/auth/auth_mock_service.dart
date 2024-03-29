import 'dart:io';

import 'package:chat/core/models/chat_user.dart';
import 'package:chat/core/services/auth/auth_service.dart';

class AuthMockService implements AuthService{
  static Map<String,ChatUser> _user = {};
  static ChatUser? _currentUser;

  ChatUser? get currentUser{
    return _currentUser;
  }

  Stream<ChatUser?> get userChanges{}

  Future<void> signup(String name, String email, String password, File image) async {}

  Future<void> login(String email, String password) async {}

  Future<void> logout() async {

  }
}