import 'package:flutter/material.dart';
import 'package:group_introduce_project/presentation/views/home.dart';
import 'package:group_introduce_project/presentation/views/login.dart';
import 'package:group_introduce_project/presentation/views/profile.dart';

class BottomNavigationBarPage extends StatefulWidget {
  const BottomNavigationBarPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _BottomNavigationBarPage();
  }
}

class _BottomNavigationBarPage extends State<BottomNavigationBarPage> {
  var _navIndex = 0;
  var _label = '';
  final _titles = ['login', 'home', 'profile'];

  final List<Widget> _pages = [
    LoginPage(title: 'login'),
    const MyHomePage(title: 'home'),
    const ProfilePage(title: 'profile')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Add this
      body: _pages[_navIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts),
            label: 'login',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'profile',
          ),
        ],
        onTap: (int index) {
          setState(
            () {
              _navIndex = index;
              _label = _titles[index];
            },
          );
        },
        currentIndex: _navIndex,
      ),
    );
  }
}
