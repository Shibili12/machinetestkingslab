import 'package:flutter/material.dart';
import 'package:machinetestkingslab/model/Loginmessage.dart';
import 'package:machinetestkingslab/pages/homepage.dart';
import 'package:machinetestkingslab/services/loginservice.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  List<Loginmessage>? msg;
  int index = 1;
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  String username = "kminchelle";
  String password = "0lelplR";
  var isLoaded = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getmessage();
  }

  void getmessage() async {
    msg = await Loginservice().getPosts();
    if (msg != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: usernamecontroller,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          TextFormField(
            controller: passwordcontroller,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (username == usernamecontroller.text &&
                  password == passwordcontroller.text) {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Homepage()));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(msg![index].message),
                ));
              }
            },
            child: Text("Login"),
          ),
        ],
      ),
    );
  }
}
