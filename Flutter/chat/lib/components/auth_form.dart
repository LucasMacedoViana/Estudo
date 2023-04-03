import 'dart:io';

import 'package:chat/components/user_image_picker.dart';
import 'package:chat/core/models/auth_form_data.dart';
import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  final void Function(AuthFormData) onSubmit;
  const AuthForm({Key? key,required this.onSubmit}) : super(key: key);

  @override
  State<AuthForm> createState() => _AuthFormState();

}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  final _formData = AuthFormData();

  void _hangleImagePicked(File image){
    _formData.image = image;
  }

  void _showErrorDialog(String message){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Theme.of(context).errorColor,
      ),
    );
  }

  void _submit() {
    final isValid = _formKey.currentState!.validate() ?? false;
    if(!isValid) return;
    if(_formData.isSignup && _formData.image == null) return _showErrorDialog('Selecione uma imagem');
    widget.onSubmit(_formData);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if(_formData.isSignup) UserImagePicker( onImagePicked: _hangleImagePicked,),
              if(_formData.isSignup)
                TextFormField(
                  key: ValueKey('name'),
                  initialValue: _formData.name,
                  onChanged: (name)=> _formData.name = name,
                  decoration: const InputDecoration(labelText: 'Nome'),
                  validator: (name){
                    if(name == null || name.trim().length < 3){
                      return 'Nome inválido';
                    }
                    return null;
                  },
                ),
              TextFormField(
                key: ValueKey('email'),
                initialValue: _formData.email,
                onChanged: (email)=> _formData.email = email,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (email){
                  if(email == null || !email.contains('@')){
                    return 'Email inválido';
                  }
                  return null;
                },
              ),
              TextFormField(
                key: ValueKey('password'),
                initialValue: _formData.password,
                onChanged: (password)=> _formData.password = password,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Senha'),
                validator: (password){
                  if(password == null || password.trim().length < 6){
                    return 'Senha deve ter no mínimo 6 caracteres';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: _submit,
                child: Text(_formData.isLogin ?'Entrar' : 'Cadastrar'),
              ),
              TextButton(
                child: Text(_formData.isLogin ? 'Criar uma nova conta' : 'Já possui conta?',),
                onPressed: () {
                  setState(() {
                    _formData.toggleAuthMode();
                  });
                },
              ),
            ],
          )
        ),
      ),
    );
  }
}
