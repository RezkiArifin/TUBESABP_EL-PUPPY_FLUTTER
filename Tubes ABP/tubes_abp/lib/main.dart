import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tubes_abp/Page/on_boarding.dart';
import 'package:tubes_abp/tabBar/bar_home.dart';
import 'package:tubes_abp/tabBar/bar_account.dart';
import '../theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tubes ABP',
      // home: MyHomePage(title: 'Jakarta'),
      home: Onboarding(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    BarHome(),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    BarAccount(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xff1C1D1D)),
        backgroundColor: Colors.white,
        title: Text(widget.title,
        style: const TextStyle(
              color: Color(0xff1C1D1D),
              fontWeight: FontWeight.w800,
              fontSize: 16,
              ),
        ),
        centerTitle: true,
        actions: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.notifications_active),
          ),
        ],
      ),
      drawer: Drawer(
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
        ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_outlined),
            label: 'Order',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history_outlined),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Account',
          ),
        ],
        currentIndex:  _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
