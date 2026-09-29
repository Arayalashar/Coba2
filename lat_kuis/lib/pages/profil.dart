import 'package:flutter/material.dart';
import '../pages/login.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key});

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  Color _profileColor = Colors.blue;

  final List<Color> _colorOptions = [
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.orange,
    Colors.purple,
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 60,
            backgroundColor: _profileColor,
            child: const Icon(
              Icons.person,
              size: 80,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "Ubah Warna Profil",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _colorOptions.map((color) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _profileColor = color;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: _profileColor == color ? Colors.black : Colors.transparent,
                      width: 2,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context, 
                MaterialPageRoute(builder: (context) => LoginPage()), 
                (route) => false,
              );
            }, 
            child: const Text("Logout")
          ),
        ],
      ),
    );
  }
}