import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ContatoModel contato = new ContatoModel();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(contato.nome ?? ''),
        ),
      body:Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Wrap(
            spacing: 20,
            runSpacing: 10,
            children: <Widget>[
              TextFormField(
                validator: nomeValidator(),
                onChanged: updateNome,
                decoration: InputDecoration(labelText: "Nome"),
                maxLength: 100,
              ),
              TextFormField(
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  TelefoneInputFormatter(),
                ],
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Celular"),
              ),
              TextFormField(
                validator: emailValidator(),
                onChanged: updateEmail,
                decoration: InputDecoration(labelText: "E-mail"),
              ),
              TextFormField(
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CpfInputFormatter(),
                ],
                onChanged: updateCpf,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "CPF"),
              ),
              ElevatedButton(
                  onPressed: (){
                    if (_formKey.currentState!.validate()){
                      print(contato);
                    }
                  },
                  child: Text('Salvar'))
            ],
          ),
        ),
      ) ,
    );
  }

  void updateCpf(cpf) => contato.cpf = cpf;

  void updateEmail(email) => contato.email = email;

  void updateTelefone(telefone) => contato.telefone = telefone;

  void updateNome(nome){
    setState(() {
      contato.nome = nome;
    });
  }
  
  TextFieldValidator emailValidator(){
    return EmailValidator(errorText: ('e-mail inválido'));
  }
  
  FieldValidator nomeValidator(){
    return MultiValidator([RequiredValidator(errorText: 'campo obrigatorio'),
    MinLengthValidator(4, errorText: 'tamanho mínimo de 4 caracteres'),
    ]);
  }
}

class ContatoModel {
  late String nome;
  late String email;
  late String cpf;
  late String telefone;
  late ContatoType tipo;
}

enum ContatoType{ CELULAR, TRABALHO, FAVORITO, CASA }
