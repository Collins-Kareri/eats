import 'package:flutter/material.dart';
import 'package:firstapp/screens/home/home_page.dart';
import 'package:firstapp/screens/signup.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("L o g i n"),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          iconSize: 28.0,
          icon: const Icon(Icons.arrow_back_rounded),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: Form(
          child: Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'U s e r n a m e',
                      isDense: true,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'P a s s w o r d',
                      isDense: true,
                    ),
                    obscureText: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don\'t have an account?',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return const SignUp();
                            }),
                          );
                        },
                        style: ButtonStyle(
                          foregroundColor: MaterialStateColor.resolveWith(
                              (states) => Colors.black),
                        ),
                        child: const Text(
                          ' Sign up',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            decorationStyle: TextDecorationStyle.solid,
                            decoration: TextDecoration.underline,
                            fontSize: 16.0,
                          ),
                          selectionColor: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Login'),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
