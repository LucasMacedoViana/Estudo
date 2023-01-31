import 'package:alura/components/task.dart';
import 'package:alura/data/task_dao.dart';
import 'package:alura/data/task_inherited.dart';
import 'package:flutter/material.dart';

class RedefinirScreen extends StatefulWidget {
  const RedefinirScreen({Key? key}) : super(key: key);

  @override
  State<RedefinirScreen> createState() => _RedefinirScreenState();
}

class _RedefinirScreenState extends State<RedefinirScreen> {
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
                    "Redefinir Senha",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Informe o email cadastrado e enviaremos instruções para recuperar a senha por lá.",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
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
            Container(
              margin: EdgeInsets.only(top: 50),
              height: 36,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: 200,),
                          Text(
                            "Redefinir",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
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
