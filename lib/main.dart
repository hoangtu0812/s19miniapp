import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:s19miniapp/models/user.dart';
import 'package:s19miniapp/screens/app_screen.dart';
import 'package:s19miniapp/screens/colors.dart';
import 'package:s19miniapp/screens/navigator.dart';
import 'package:s19miniapp/services/login/login.dart';
import 'package:s19miniapp/services/appServices.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: CustomColors.themeColor),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Login'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool passwordVisible = false;
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: CustomColors.themeColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.1),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                    image: AssetImage("assets/images/MINIAPP.png"),
                    height: 200,
                    width: 300),
              ],
            ),
            SizedBox(height: screenHeight * 0.1),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Column(
                    children: [
                      Text(
                        "Login",
                        style: TextStyle(
                            color: Color.fromRGBO(49, 39, 79, 1),
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      )
                    ],
                  ),
                  const SizedBox(height: 30),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(196, 135, 198, .3),
                            blurRadius: 20,
                            offset: Offset(0, 10),
                          )
                        ]),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color:
                                          Color.fromRGBO(196, 135, 198, .3)))),
                          child: TextField(
                            controller: usernameController,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Enter username',
                                hintStyle: TextStyle(color: Colors.grey)),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: TextField(
                            keyboardType: TextInputType.visiblePassword,
                            textInputAction: TextInputAction.done,
                            obscureText: passwordVisible,
                            controller: passwordController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Enter password',
                                hintStyle: const TextStyle(color: Colors.grey),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        passwordVisible = !passwordVisible;
                                      });
                                    },
                                    icon: Icon(passwordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off))),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Column(
              children: [
                Container(
                  width: screenWidth * 0.5,
                  height: screenHeight * 0.06,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: CustomColors.buttonColor
                    ),
                      onPressed: () async {
                        User user = User(
                            usernameController.text, passwordController.text);
                        if (await Login.login(user)) {
                          log("Login success");
                          AppServices.showToast(Login.message);
                          Navigators.navigateToAppScreen(context);
                        } else {
                          log(Login.message);
                          AppServices.showToast(Login.message);
                        }
                      },
                      child: const Text("Login")),
                )
              ],
            ),
            SizedBox(
                width: 100,
                height: 50,
                child: MaterialButton(
                  onPressed: () {},
                  child: const Text('Exit'),
                )),
          ],
        ),
      ),
      bottomNavigationBar: const BottomAppBar(
        height: 40,
        child: Text("Version 0.0.1"),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            usernameController.text = 'admin';
            passwordController.text = 'admin';
          },
          child: const Text("-")),
    );
  }
}
