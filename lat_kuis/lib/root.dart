import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/profil.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {

    List<Widget> pages = [Home(), ProfilPage()];
    List<String> pageTitles = ["Home Page", "Profil Page"];

    return Scaffold(
      appBar: AppBar(
        title: Text(pageTitles[_selectedIndex]),
      ),

      body: pages[_selectedIndex] ,

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index){
          setState(() {
            _selectedIndex = index;
          });
        },
        items:[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home"
          ),

           BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Person"
          ),
        ]
     ),
    );
  }
}