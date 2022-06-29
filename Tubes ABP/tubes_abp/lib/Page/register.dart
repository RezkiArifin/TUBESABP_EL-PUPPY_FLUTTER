import 'package:flutter/material.dart';
import 'package:tubes_abp/Page/login.dart';
import 'package:tubes_abp/main.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);
 
  @override
  State<Register> createState() => _RegisterState();
}
 
class _RegisterState extends State<Register> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController newpasswordController = TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 35,
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
                child:TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Username',
                  ),
                ),
              ),
              SizedBox(
                height: 12,
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
                height: 12,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  obscureText: true,
                  controller: newpasswordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Konfirmasi Password',
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
                    child: const Text('Register'),
                    onPressed: () {
                      Navigator.push(  
                        context,  
                        MaterialPageRoute(builder: (context) => MyHomePage(title: 'El Puppy store',)),  
                      ); 
                    },
                  )
              ),
              SizedBox(
                height: 54,
              ),
              Row(
                children: <Widget>[
                  const Text('Sudah punya akun ?'),
                  TextButton(
                    child: const Text(
                      'Login',
                      style: TextStyle(
                      fontSize: 14,
                      color: Color.fromARGB(255, 233, 78, 39),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Login()),
                      );
                    },
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ],
          )),
    );
  }
}