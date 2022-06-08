import 'package:flutter/material.dart';
import 'package:tubes_abp/Page/login.dart';
import 'package:tubes_abp/main.dart';
import '../theme.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: Scaffold(
            body: SafeArea(
                child: Container(
          // margin:
          //       EdgeInsets.only(left: 23.0, top: 0, right: 23.0, bottom: 0),
          // padding: EdgeInsets.only(left: 0, top: 50.0, right: 0, bottom: 0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: 190,
                    ),
                    Image(
                      image: AssetImage('assets/kitty2.png'),
                      height: 160,
                      width: 160,
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0, bottom: 4.0),
                      child: Text("Healthy Pets", style: mainHeader),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Text(
                      "The finest fresh food and all \nyour pet needs",
                      style: subHeader,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 34,
                    ),
                    ElevatedButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Color.fromARGB(229, 233, 78, 39)),
                      child: const Text('Get Started'),
                      onPressed: () {  
                      Navigator.push(  
                        context,  
                        MaterialPageRoute(builder: (context) => Login()),  
                      );  
                      }
                    )
                  ],
                )
              ]),
        ))));
  }
}
