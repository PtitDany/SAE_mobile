import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:all_o/Login_Page.dart';

final supabase = Supabase.instance.client;

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _register() async {
    final sm = ScaffoldMessenger.of(context);
    try{
      final authResponse = await supabase.auth.signUp(
      email: _usernameController.text,
      password: _passwordController.text
      );
      sm.showSnackBar(SnackBar(
      content: Text("User registered: ${authResponse.user?.email}")));
    }
    catch(e){
      sm.showSnackBar(SnackBar(
        content: Text("Error: ${e.toString()}")));
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 400,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: -40,
                    height: 400,
                    width: width,
                    child: FadeInUp(
                      duration: Duration(seconds: 1),
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('lib/assets/images/background.png'),
                                fit: BoxFit.fill)),
                      ),
                    ),
                  ),
                  Positioned(
                    height: 400,
                    width: width + 20,
                    child: FadeInUp(
                      duration: Duration(milliseconds: 1000),
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('lib/assets/images/background-2.png'),
                                fit: BoxFit.fill)),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeInUp(
                      duration: Duration(milliseconds: 1500),
                      child: Text(
                        "Register",
                        style: TextStyle(color: Color.fromRGBO(49, 39, 79, 1), fontWeight: FontWeight.bold, fontSize: 30),
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  FadeInUp(
                    duration: Duration(milliseconds: 1700),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          border: Border.all(color: Color.fromRGBO(196, 135, 198, .3)),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(196, 135, 198, .3),
                              blurRadius: 20,
                              offset: Offset(0, 10),
                            )
                          ]),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Color.fromRGBO(196, 135, 198, .3)))),
                            child: TextField(
                              controller: _usernameController,
                              decoration: InputDecoration(border: InputBorder.none, hintText: "Username", hintStyle: TextStyle(color: Colors.grey.shade700)),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: TextField(
                              controller: _passwordController,
                              obscureText: true,
                              decoration: InputDecoration(border: InputBorder.none, hintText: "Password", hintStyle: TextStyle(color: Colors.grey.shade700)),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FadeInUp(
                    duration: Duration(milliseconds: 1900),
                    child: MaterialButton(
                      onPressed: _register,
                      color: Color.fromRGBO(49, 39, 79, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      height: 50,
                      child: Center(
                        child: Text(
                          "Create Account",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // Bouton de retour
                  FadeInUp(
                    duration: Duration(milliseconds: 1900),
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      color: Color.fromRGBO(49, 39, 79, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      height: 50,
                      child: Center(
                        child: Text(
                          "Retour a la page de connexion",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}