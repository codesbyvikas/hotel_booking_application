import 'package:flutter/material.dart';
import 'package:hotel_booking_application/signup.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _loginemail = TextEditingController();
  final TextEditingController _loginpassword = TextEditingController();
  bool _isObscure = true;

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
              child: Column(
                children: [
                  Image.asset("assets/images/hotel_book.png"),
                  const Text(
                    "Welcome",
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Color.fromARGB(255, 16, 183, 136),
                    ),
                  ),
                  const Text(
                    "Please login here",
                    style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      color: Colors.teal,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Padding(
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
                          obscureText: _isObscure,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.teal,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.green, width: 2)),
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
                                icon: Icon(_isObscure
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    _isObscure = !_isObscure;
                                  });
                                },
                              )),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Password cannot be Empty!";
                            } else if (value.length < 8) {
                              return "Password length should be greater than 8 characters";
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(height: 5),
                      ],
                    ),
                  ),
                  TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          fixedSize: const Size(150, 40),
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.teal,
                          textStyle: const TextStyle(fontSize: 15)),
                      child: const Text("Login")),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SignUp()),
                      );
                    },
                    child: const Text(
                      "Create an account",
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
