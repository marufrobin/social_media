import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:social_media/screen/my_drawer.dart';
import 'package:social_media/screen/page2.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: true,
        // drawer: MyDrawer(),
        endDrawer: MyDrawer(),
        key: _scaffoldKey,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          // foregroundColor: Colors.transparent,
          // shadowColor: Colors.transparent,
          actions: [
            IconButton(
                onPressed: () {
                  _scaffoldKey.currentState?.openEndDrawer();
                },
                icon: Icon(Icons.menu))
          ],
          title: Text("Robin App"),
        ),
        body: Container(
          // color: Colors.cyan,
          // height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/image2.jpg"), fit: BoxFit.cover)),
          child: Container(
            // height: MediaQuery.of(context).size.height * 0.4,
            // width: double.infinity,
            padding: EdgeInsets.all(22),
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.4),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(36),
                    topRight: Radius.circular(36))),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Wellcome to SocialApp!",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Text(
                    "Sing in to continue.",
                    style: TextStyle(fontSize: 18, color: Colors.grey.shade600),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  TextFormField(
                    validator: (value) {
                      var emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value.toString());

                      if (value!.isEmpty) {
                        return "Fill up with your email";
                      }
                      if (emailValid == false) {
                        return "Invalid email";
                      }
                    },
                    controller: emailController,
                    decoration: InputDecoration(
                        labelStyle: TextStyle(fontSize: 24),
                        prefixIcon: Icon(Icons.email),
                        hintText: "Enter Email",
                        filled: true,
                        labelText: "Email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        )),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password is empty";
                      }
                      if (value.length < 5) {
                        return "Passowrd is too short";
                      }
                      if (value.length > 10) {
                        return "Password is too long";
                      }
                    },
                    controller: passwordController,
                    obscureText: true,
                    obscuringCharacter: "#",
                    decoration: InputDecoration(
                        labelStyle: TextStyle(fontSize: 24),
                        prefixIcon: Icon(Icons.password),
                        hintText: "Enter Password",
                        filled: true,
                        labelText: "Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        )),
                  ),
                  Center(
                    child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Page2()));
                          } else
                            print("Somtthing prblem");
                        },
                        // style: ButtonStyle(),
                        child: Text(
                          "Login",
                          style: TextStyle(fontSize: 20),
                        )),
                  ),
                  SizedBox(
                    // height: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.125,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
