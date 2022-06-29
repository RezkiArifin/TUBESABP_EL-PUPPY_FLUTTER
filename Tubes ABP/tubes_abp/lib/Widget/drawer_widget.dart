import 'package:flutter/material.dart';
import 'package:tubes_abp/tabBar/bar_account.dart';
import '../theme.dart';

class drawerWidget extends StatelessWidget {
  const drawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(padding: EdgeInsets.symmetric(vertical: 80.0, horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
                Row(
                children: [
                  InkWell(
                    onTap: () {
                    Navigator.push(  
                        context,  
                        MaterialPageRoute(builder: (context) => BarAccount()),  
                      );
                  },
                  child: CircleAvatar(
                    radius: 40.0,
                    backgroundImage: AssetImage('assets/Profile.jpeg'),
                  ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      Text(
                      'Amanda Haira',
                      style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w100,
                      ),),
                      const SizedBox(height: 5.0),
                      Text('amanda20@gmail.com',
                      style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w400, color: Colors.black)),
                    ],
                  ),

                ],
              ),
              const SizedBox(height: 50.0),
                Row(
                  children: [
                    Icon(Icons.search, color: Colors.black),
                    const SizedBox(width: 15.0),
                    Text('Search', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.black))
                  ],
                ),
                const SizedBox(height: 30.0),
                Row(
                  children: [
                    Icon(Icons.notifications_none, color: Colors.black),
                    const SizedBox(width: 15.0),
                    Text('Notification', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.black))
                  ],
                ),
                const SizedBox(height: 30.0),
                Row(
                  children: [
                    Icon(Icons.mail_outline, color: Colors.black),
                    const SizedBox(width: 15.0),
                    Text('Message', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.black))
                  ],
                ),
                const SizedBox(height: 30.0),
                Row(
                  children: [
                    Icon(Icons.bookmark_border, color: Colors.black),
                    const SizedBox(width: 15.0),
                    Text('Bookmark', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.black))
                  ],
                ),
                const SizedBox(height: 30.0),
                Row(
                  children: [
                    Icon(Icons.person_outline, color: Colors.black),
                    const SizedBox(width: 15.0),
                    Text('Profile', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.black))
                  ],
                ),
              ],
            ),
          ),
      );
  }
}