import 'package:flutter/material.dart';
import 'package:raslla_call/Call%20Screens/call_screen.dart';
import 'package:raslla_call/Category%20Screens/category_screen.dart';
import 'package:raslla_call/Purchase%20Screens/purchase_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  final List<Widget> _children = [CallScreen(), CategoryScreen(), Purchase()];
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              width: 1.0,
              color: Color.fromRGBO(164, 202, 243, 1),
            ),
          ),
        ),
        child: SizedBox(
          height: 80,
          child: BottomNavigationBar(
            unselectedItemColor: Color.fromRGBO(164, 202, 243, 1),
            selectedItemColor: Color.fromRGBO(61, 231, 157, 1),
            backgroundColor: Color.fromRGBO(28, 40, 55, 1),
            onTap: onTabTapped, // new
            currentIndex:
                _currentIndex, // this will be set when a new tab is tapped
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: 'Llamadas',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.article,
                ),
                label: 'Categorías',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.attach_money,
                ),
                label: 'Comprar',
                activeIcon: Icon(
                  Icons.attach_money,
                ),
              )
            ],
          ),
        ),
      ),
      body: _children[_currentIndex],
    );
  }
}
