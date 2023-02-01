import 'package:alura/components/task.dart';
import 'package:alura/data/task_dao.dart';
import 'package:alura/data/task_inherited.dart';
import 'package:flutter/material.dart';

class AccessScreen extends StatefulWidget {
  const AccessScreen({Key? key}) : super(key: key);

  @override
  State<AccessScreen> createState() => _AccessScreenState();
}

class _AccessScreenState extends State<AccessScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController difficultyController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool valueValidator(String? value) {
    if (value != null && value.isEmpty) {
      return true;
    }
    return false;
  }

  bool difficultyValidator(String? value) {
    if (value != null && value.isEmpty) {
      if (int.parse(value) > 5 || int.parse(value) < 1) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        padding: EdgeInsets.all(40),
        child: Column(
          children: <Widget>[
            InkWell(
              onTap: () {},
              child: Row(
                children: const [
                  SizedBox(width: 5),
                  Icon(Icons.arrow_back, size: 45),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 60),
              child: Image.asset('assets/images/LogoSignDark.png'),
            ),
            Padding(
              padding: EdgeInsets.only(top: 50),
              child: Column(
                children: const [
                  Text(
                    "Acesso",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 36,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Entre com suas credencias abaixo.",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Material(
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 20)),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      label: Text("Email"),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
            Material(
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 20)),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      label: Text("Senha"),
                      border: OutlineInputBorder(),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              child: RaisedButton(
                child: const Text(
                  "Entrar",
                  style: TextStyle(color: Colors.white),
                ),
                color: Color(0xff5AD7DF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                onPressed: () {
                  showModalBottomSheet<void>(context: context,builder: (BuildContext context) {
                    return Container(
                      height: 400,
                      color: Colors.white,
                      child: Container(
                        margin: EdgeInsets.all(40),

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            const Text('Termos de Uso',style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600,),),
                            const Text('Por favor, leia os nossos termos e aceite as condições para continuar.',style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400,),),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                padding:
                                EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 0.5,
                                  ),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child : Center(
                                  child: (
                                    Text(
                                      "Confirmar",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    )
                                ),
                                ),

                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }, );
                },
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 80),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 90),
              height: 36,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Esqueceu a senha?"),
                  SizedBox(width: 10),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        children: const [
                          Text(
                            "Redefinir",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(width: 5),
                          Icon(Icons.arrow_right, size: 16),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
