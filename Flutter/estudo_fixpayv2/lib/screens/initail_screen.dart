import 'package:flutter/material.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        padding: EdgeInsets.all(40),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 60),
              child: Image.asset('assets/images/LogoSignDark.png'),
            ),
            Container(
              margin: EdgeInsets.only(top: 50),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomRight,
                    widthFactor: 1.7,
                    child: ClipRRect(
                      child: Image.asset('assets/images/inicial2.png'),
                      borderRadius: BorderRadius.all(Radius.circular(80)),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    heightFactor: 0.7,
                    widthFactor: 1.1,
                    child: ClipRRect(
                      child: Image.asset('assets/images/inicial1.png'),
                      borderRadius: BorderRadius.all(Radius.circular(80)),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 50),
              child: Column(
                children: const [
                  Text(
                    "Use FixPay",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 36,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Agora ficou fácil vender e acompanhar suas vendas com a FixPay. Entre agora e utilize os nossos serviços de pagamentos online.",
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

            Container(
              margin: EdgeInsets.only(top: 15),
              child: RaisedButton(
                child: const Text(
                  "Conheça",
                  style: TextStyle(color: Colors.white),
                ),
                color: Color(0xff5AD7DF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                onPressed: () {},
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 80),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 90),
              height: 36,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Já é cliente?"),
                  SizedBox(width: 10),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        children: const [
                          Text(
                            "Login",
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
