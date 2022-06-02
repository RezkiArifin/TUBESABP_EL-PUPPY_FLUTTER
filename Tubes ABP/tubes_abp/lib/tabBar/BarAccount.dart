import 'package:flutter/material.dart';
import 'package:tubes_abp/Page/login.dart';

import '../theme.dart';

class BarAccount extends StatefulWidget {
  const BarAccount({Key? key}) : super(key: key);

  @override
  State<BarAccount> createState() => _BarAccountState();
}

class _BarAccountState extends State<BarAccount> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
            child: Column(
          children: [
            SizedBox(
              width: 5,
              height: 16,
            ),
            SizedBox(
              width: 5,
              height: 40,
            ),
            CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage('assets/Profile.jpeg'),
            ),
            SizedBox(
              width: 5,
              height: 14,
            ),
            Text(
              'Amanda Haira',
              style: blackTextStyle.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
            ),
            SizedBox(
              width: 5,
              height: 4,
            ),
            Text(
              'amanda20@gmail.com',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              width: 10,
              height: 20,
            ),
            Container(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 50.0),
                child: OutlinedButton.icon(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    fixedSize: const Size(320, 48),
                  ),
                  icon: Icon(
                    Icons.edit,
                    size: 20,
                    color: Colors.grey,
                  ),
                  label: Text(
                    "Edit",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )),
            Container(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 50.0),
                child: OutlinedButton.icon(
                  onPressed: () {
                    Navigator.push(  
                        context,  
                        MaterialPageRoute(builder: (context) => Login()),  
                      );
                  },
                  style: OutlinedButton.styleFrom(
                    fixedSize: const Size(320, 48),
                  ),
                  icon: Icon(
                    Icons.logout,
                    size: 20,
                    color: Colors.grey,
                  ),
                  label: Text(
                    "Logout",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )),
          ],
        )),
      ),
    );
  }
}
