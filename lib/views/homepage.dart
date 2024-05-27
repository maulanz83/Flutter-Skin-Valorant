// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../helpers/shared_pref.dart';
import 'kesanpesan.dart';
import 'konversipage.dart';
import 'loginpage.dart';
import 'weaponskinlist.dart';
import 'profilepage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    Home_Page(),
    KesanPesanPage(),
    ProfilePage(),
    const Log_Out(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 3) {
        logout(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home Page',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Kesan Pesan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'Log Out',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromRGBO(29, 66, 137, 1),
        unselectedItemColor: Color.fromRGBO(200, 16, 46, 0.6),
        showUnselectedLabels: true,
        onTap: _onItemTapped,
      ),
    );
  }
}

class Home_Page extends StatefulWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Home Page"),
            backgroundColor: Colors.blueGrey[300],
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.list_alt),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => WeaponSkinsList()),
                    );
                  },
                ),
                Text('Valorant Weapon Skins List'),
                SizedBox(height: 20),
                IconButton(
                  icon: Icon(Icons.compare_arrows),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => KonversiPage()),
                    );
                  },
                ),
                Text('Konversi'),
              ],
            ),
          ),
        )
    );
  }
}

class Log_Out extends StatefulWidget {
  const Log_Out({Key? key}) : super(key: key);

  @override
  State<Log_Out> createState() => _Log_OutState();
}

class _Log_OutState extends State<Log_Out> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

void logout(context) async {
    await UserPreferences.setLoggedIn(false);
    await UserPreferences.setUsername('');
    Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => LoginPage()));
}