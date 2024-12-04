import 'package:flutter/material.dart';
import 'package:pet_adopt_project/view/pages/registerPet.dart';
import 'package:pet_adopt_project/view/pages/formNewPet.dart';
import 'package:pet_adopt_project/view/pages/home.dart';
import 'package:pet_adopt_project/view/pages/intro.dart';
import 'package:pet_adopt_project/view/pages/userPerfil.dart';

class Controller extends StatefulWidget {
  const Controller({super.key});

  @override
  State<Controller> createState() => _ControllerState();
}

class _ControllerState extends State<Controller> {
  int _selectedIndex = 0;

  // Função para criar a página dinamicamente
  Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return const Home();
      case 1:
        return const RegisterPet();
      case 2:
        return const NewPet();
      case 3:
        return const Userperfil();
      default:
        return const Home();
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.dehaze, size: 28),
        ),
        title: Container(
          margin: const EdgeInsets.only(top: 5),
          alignment: Alignment.center,
          padding: const EdgeInsets.only(bottom: 10, left: 10),
          child: Text(
            'Pet Adopt',
            style: TextStyle(
              fontSize: 26,
              color: Colors.deepPurpleAccent[100],
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const IntroPage()),
              );
            },
            icon: const Icon(Icons.logout, size: 28),
          ),
        ],
      ),
      body: _buildPage(_selectedIndex), // Carregamento sob demanda
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Pets',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pets),
            label: 'Add pet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple[500],
        onTap: _onItemTapped,
        unselectedItemColor: const Color.fromARGB(100, 0, 0, 0),
      ),
    );
  }
}
