import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:s19miniapp/models/user.dart';
import 'package:s19miniapp/screens/login/login.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                  image: AssetImage("assets/images/MINIAPP.png"),
                  height: 200,
                  width: 300),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(padding: EdgeInsets.symmetric(vertical: 50)),
              Container(
                width: MediaQuery.of(context).size.width * 0.3,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Text("Username", style: TextStyle(fontSize: 16)),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                height: 40,
                child: TextField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter username',
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              Container(
                width: MediaQuery.of(context).size.width * 0.3,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Text(
                  "Password",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                height: 40,
                child: TextField(
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                  obscureText: passwordVisible,
                  controller: passwordController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter password',
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
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 100,
                child: ElevatedButton(
                    onPressed: () {
                      SystemNavigator.pop();
                    },
                    child: const Text("Exit")),
              ),
              const SizedBox(
                width: 20,
              ),
              SizedBox(
                width: 100,
                child: ElevatedButton(
                    onPressed: () async {
                      User user = User(
                          usernameController.text, passwordController.text);
                      if (await Login.login(user)) {
                        log("Login success");
                        AppServices.showToast(Login.message);
                      } else {
                        log(Login.message);
                        AppServices.showToast(Login.message);
                      }
                    },
                    child: const Text("Login")),
              ),
            ],
          ),
        ],
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
