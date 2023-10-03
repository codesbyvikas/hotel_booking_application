import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hotel_booking_application/pages/loginpage.dart';
import 'package:hotel_booking_application/data/userinfo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _isObscure = true;
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 32,
          ),
          child: Column(
            children: <Widget>[
              heading(),
              const SizedBox(height: 40),
              name(),
              const SizedBox(height: 20),
              emailid(),
              const SizedBox(height: 20),
              phoneno(),
              const SizedBox(height: 20),
              password(),
              const SizedBox(height: 20),
              button(),
              back(),
            ],
          ),
        ),
      )),
    );
  }

  Widget heading() {
    return const Text(
      "Create an Account",
      style: TextStyle(
          color: Colors.teal,
          fontSize: 20,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold),
    );
  }

  Widget name() {
    return TextFormField(
      controller: _name,
      decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.teal,
            ),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.teal, width: 2)),
          prefixIcon: Icon(Icons.person),
          labelText: "Full Name"),
      validator: (value) {
        if (value!.isEmpty) {
          return "Name cannot be Empty";
        } else {
          return null;
        }
      },
    );
  }

  Widget emailid() {
    return TextFormField(
      controller: _email,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.teal,
            ),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.teal, width: 2)),
          prefixIcon: Icon(Icons.email),
          labelText: "Email"),
      validator: (value) {
        if (value!.isEmpty) {
          return "Email cannot be Empty";
        } else {
          return null;
        }
      },
    );
  }

  Widget phoneno() {
    return TextFormField(
      controller: _phone,
      keyboardType: TextInputType.number,
      maxLength: 10,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
      decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.teal,
            ),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.teal, width: 2)),
          prefixIcon: Icon(Icons.phone),
          labelText: "Phone no."),
      validator: (value) {
        if (value!.isEmpty) {
          return "Phone no. cannot be Empty";
        } else {
          return null;
        }
      },
    );
  }

  Widget password() {
    return TextFormField(
      controller: _password,
      obscureText: _isObscure,
      decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.teal,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.teal, width: 2)),
          prefixIcon: const Icon(Icons.lock),
          labelText: "Password",
          suffixIcon: IconButton(
            icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
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
    );
  }

  Widget button() {
    return Container(
      width: 500,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50), color: Colors.teal),
      child: TextButton(
        child: const Text(
          "Sign up",
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
        onPressed: () {
          final user = Users(
            name: _name.text,
            email: _email.text,
            password: _password.text,
            phone: _phone.text,
          );
          createUser(user);
          createUserWithEmailAndPassword();
        },
      ),
    );
  }

  Widget back() {
    return TextButton(
      onPressed: () {
        Navigator.pop(context,
            MaterialPageRoute(builder: (context) => const LoginPage()));
      },
      child: const Text("Already have an account?"),
    );
  }

  createUserWithEmailAndPassword() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _email.text,
        password: _password.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return AlertDialog(
          title: const Text("Signup failed!"),
          titleTextStyle: const TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
          actionsOverflowButtonSpacing: 20,
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Ok")),
          ],
          content:const  Text("Password is too weak!"),
        );
      } else if (e.code == 'email-already-in-use') {
        return AlertDialog(
          title: const Text("Signup failed!"),
          titleTextStyle: const TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
          actionsOverflowButtonSpacing: 20,
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Ok")),
          ],
          content: const 
              Text("Email  is already is use!\n Please use different email"),
        );
      }
    }

    Navigator.pop(context);
  }

  Future createUser(Users user) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc();
    user.id = docUser.id;
    final json = user.toJson();
    await docUser.set(json);
  }
}
