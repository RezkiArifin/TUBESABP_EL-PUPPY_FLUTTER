import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tubes_abp/Page/register.dart';
import 'package:tubes_abp/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tubes_abp/Widget/sign_in_checker.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
 
  @override
  State<Login> createState() => _LoginState();
}
 
class _LoginState extends State<Login> {
  // TextEditingController nameController = TextEditingController();
  // TextEditingController passwordController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
 
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 83,
              ),
              Image(
                image: AssetImage('assets/elpuppy.png'),
                height: 248,
                width: 242,
                ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ElevatedButton(
                    style: TextButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 233, 78, 39)),
                    child: const Text('Login'),
                    onPressed: signIn,
                     
                    
                  )
              ),
              SizedBox(
                height: 54,
              ),
              Row(
                children: <Widget>[
                  const Text('Belum punya akun ?'),
                  TextButton(
                    child: const Text(
                      'Register',
                      style: TextStyle(
                      fontSize: 14,
                      color: Color.fromARGB(255, 233, 78, 39),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Register()),
                      );
                    },
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
              // RichText(
              //   text: TextSpan(
              //     style: TextStyle(color: Colors.black, fontSize: 14),
              //     text: 'Belum punya akun?',
              //     children: [
              //       TextSpan(
              //         recognizer: TapGestureRecognizer()
              //         ..onTap = widget.register,
              //         text: 'Sign Up',
              //         style: TextStyle(fontSize: 14,color: Color.fromARGB(255, 233, 78, 39),
      
              //         ),
              //       ),
              //     ],
              //   ),
         
              // ),
            ],
          )),
    );
  }

  Future signIn() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(child: CircularProgressIndicator()),
    );
    
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      ).then((value) =>  Navigator.push(  
                          context,  
                          MaterialPageRoute(builder: (context) => MyHomePage(title: 'El Puppy Store')),  
                        ));
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }
}

