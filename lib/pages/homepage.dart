import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          shadowColor: Colors.transparent,
          title: const Text(
            "Welcome",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: ListView(
              children: <Widget>[
                Image(),
                const SizedBox(height: 10),
                Txt(),
                const SizedBox(height: 10),
                Logout(),
              ],
            )));
  }

  Widget Image() {
    return Container(
      height: 200,
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage(
          "assets/images/hotel.png",
        ),
        fit: BoxFit.fill,
      )),
    );
  }

  Widget  Txt() {
    return const Center(
      child: Text("Welcome",
          style: TextStyle(
            color: Color.fromARGB(255, 130, 121, 121),
            fontSize: 22,
          )),
    );
  }

  Widget Logout() {
    return Center(
      child: InkWell(
        onTap: () {
          FirebaseAuth.instance.signOut();
        },
        child: Container(
          width: 200,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
              ),
            ],
          ),
          child:const  Center(
            child: Text(
              'Logout',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
