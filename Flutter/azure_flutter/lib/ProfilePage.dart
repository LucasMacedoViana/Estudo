import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _imageUrl = 'https://imageprofilepc2025.blob.core.windows.net/container1/foto.jpeg';

  Future<void> loadImage() async {
    final response = await http.get(Uri.parse('https://imageprofilepc2025.blob.core.windows.net/container1/foto.jpeg'));
    setState(() {
      _imageUrl = base64.encode(response.bodyBytes);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meu perfil'),
      ),
      body: Center(
        child: CircleAvatar(
          radius: 80,
          backgroundImage: _imageUrl == null ? null : MemoryImage(base64.decode(_imageUrl)),
        ),
      ),
    );
  }
}
