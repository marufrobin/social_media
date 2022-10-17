import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

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
        resizeToAvoidBottomInset: true,
        // drawer: Drawer(),
        // endDrawer: MyDrawer(),
        // key: _scaffoldKey,
        // appBar: AppBar(
        //   actions: [
        //     IconButton(
        //         onPressed: () {
        //           _scaffoldKey.currentState?.openEndDrawer();
        //         },
        //         icon: Icon(Icons.menu))
        //   ],
        //   title: Text("Robin App"),
        body: Container(
          // color: Colors.cyan,
          // height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/image2.jpg"), fit: BoxFit.cover)),
          child: Container(
            padding: EdgeInsets.all(22),
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.2),
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
                    validator: (value) {},
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
                        onPressed: () {},
                        // style: ButtonStyle(),
                        child: Text(
                          "Login",
                          style: TextStyle(fontSize: 20),
                        )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
