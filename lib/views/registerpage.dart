import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/auth_services.dart';
import 'loginpage.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String username = "";
  String password = "";
  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[300],
        title: Text("Register Page"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _usernameField(),
          _passwordField(),
          _registerButton(),
          _login()
        ],
      ),
    ));
  }

  Widget _usernameField() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: TextFormField(
        onChanged: (value) {
          setState(() {
            username = value;
          });
        },
        decoration: InputDecoration(
            labelText: 'Username',
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Color.fromRGBO(144, 164, 174, 1),
                )),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  width: 3,
                  color: Color.fromRGBO(144, 164, 174, 1),
                ))),
      ),
    );
  }

  Widget _passwordField() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: TextFormField(
        onChanged: (value) {
          setState(() {
            password = value;
          });
        },
        obscureText: true,
        decoration: InputDecoration(
            labelText: 'Password',
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Color.fromRGBO(29, 66, 137, 1),
                )),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  width: 3,
                  color: Colors.blue,
                ))),
      ),
    );
  }

  Widget _registerButton() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: ElevatedButton(
        onPressed: () async {
          String text = "";
          bool registerSuccess = await authService.register(username, password);

          if (registerSuccess) {
            text = 'Registration successful';
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => LoginPage(),
            ));
          } else {
            text = 'Registration failed';
          }

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(text),
            ),
          );
        },
        child: Text("Register"),
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueGrey[300],
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _login() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      width: MediaQuery.of(context).size.width,
      child: TextButton(
        style: TextButton.styleFrom(backgroundColor: Colors.blueGrey[300]),
        onPressed: () {
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (context) {
            return LoginPage();
          }));
        },
        child: Text(
          "Login",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
