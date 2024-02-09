import 'package:flutter/material.dart';
import 'package:hotel_booking_application/constants/loading_widget.dart';
import 'package:hotel_booking_application/pages/homepage.dart';
import 'package:hotel_booking_application/pages/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:oktoast/oktoast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _loginemail = TextEditingController();
  final TextEditingController _loginpassword = TextEditingController();
  bool _isObscure = true;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Hotels.com",
          style: TextStyle(
            color: Colors.black,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Material(
            color: Colors.white,
            child: SingleChildScrollView(
                child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Image.asset(
                    "assets/images/hotel_book.png",
                    scale: 3,
                  ),
                  text1(),
                  text2(),
                  logincredit(),
                  loginButton(),
                  newAccountButton(),
                  googleAccount(),
                ],
              ),
            ))),
      ),
    );
  }

  Widget text1() {
    return const Text(
      "Welcome",
      style: TextStyle(
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.bold,
        fontSize: 30,
        color: Color.fromARGB(255, 16, 183, 136),
      ),
    );
  }

  Widget text2() {
    return const Text(
      "Please login here",
      style: TextStyle(
        fontSize: 20,
        fontStyle: FontStyle.italic,
        color: Colors.teal,
        fontWeight: FontWeight.w300,
      ),
    );
  }

  Widget logincredit() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 32,
        vertical: 16,
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            controller: _loginemail,
            decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.teal,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 2)),
                prefixIcon: Icon(Icons.email),
                labelText: "Email"),
            validator: (value) {
              if (value!.isEmpty) {
                return "Email adress cannot be empty!";
              } else {
                return null;
              }
            },
          ),
          const SizedBox(height: 30),
          TextFormField(
            controller: _loginpassword,
            obscureText: _isObscure,
            decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.teal,
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.green,
                  width: 2,
                )),
                prefixIcon: const Icon(Icons.lock),
                labelText: "Password",
                suffixIcon: IconButton(
                  icon: Icon(
                      _isObscure ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                )),
            validator: (value) {
              if (value!.isEmpty) {
                return "Password cannot be Empty!";
              } else if (value.length < 6) {
                return "Password length should be greater than 8 characters";
              } else {
                return null;
              }
            },
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }

  Widget loginButton() {
    return TextButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            signInWithEmailAndPassword();
          }
        },
        style: TextButton.styleFrom(
            fixedSize: const Size(150, 40),
            foregroundColor: Colors.white,
            backgroundColor: Colors.teal,
            textStyle: const TextStyle(fontSize: 15)),
        child: const Text("Login"));
  }

  Widget newAccountButton() {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SignUp()),
        );
      },
      child: const Text(
        "Create an account",
      ),
    );
  }

  Widget googleAccount() {
    return Container(
        width: 300,
        height: 45,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(50),
            color: Colors.white),
        child: Row(
          children: [
            const SizedBox(width: 7),
            Image.asset(
              'assets/images/google.png',
              scale: 25,
            ),
            const SizedBox(width: 25),
            TextButton(
              child: const Text(
                "Continue with Google",
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
              onPressed: () {},
            ),
          ],
        ));
  }

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      try {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return const CustomLoadingWidget();
          },
        );

        await Future.delayed(const Duration(seconds: 2)); // Simulating a delay

        Navigator.pop(context); // Close the loading indicator dialog

        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _loginemail.text.trim(),
          password: _loginpassword.text.trim(),
        );

        if (mounted) {
          await Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) => HomePage()),
          );
        }
      } catch (e) {
        // Handle any exceptions if necessary
      }
    }
  }

  signInWithEmailAndPassword() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _loginemail.text.trim(),
        password: _loginpassword.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
        if (mounted) {
          _showToast("Incorrect Login Credentials");
        }
      } else if (e.code == 'wrong-password') {
        _showToast("Incorrect Login Credentials");
      } else {
        _showToast("Please check you email");
      }
    }
  }

  void _showToast(String message) {
    showToast(
      message,
      duration: const Duration(seconds: 2),
      position: ToastPosition.bottom,
    );
  }
}
