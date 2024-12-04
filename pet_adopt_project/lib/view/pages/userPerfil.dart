import 'package:flutter/material.dart';

class Userperfil extends StatefulWidget {
  const Userperfil({super.key});

  @override
  State<Userperfil> createState() => _UserperfilState();
}

class _UserperfilState extends State<Userperfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 30, top: 20),
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(200),
                      ),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Image.asset(
                      'assets/images/user.jpg',
                      fit: BoxFit.cover,
                      width: 210,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 280,
              decoration: BoxDecoration(
                color: Colors.white, // Cor de fundo do Container
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 0, 0, 0)
                        .withOpacity(0.20), // Cor da sombra
                    spreadRadius: 2, // Espalhamento da sombra
                    blurRadius: 5, // Desfoque da sombra
                    offset: const Offset(-9, 10), // Posição da sombra
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Jorge Mendes',
                              style:
                                  TextStyle(fontSize: 32, color: Colors.blue),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 390,
                        margin: const EdgeInsets.only(top: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              child: const Row(
                                children: [
                                  Icon(
                                    Icons.location_on_outlined,
                                    color: Colors.deepPurpleAccent,
                                    size: 32,
                                  ),
                                  Text(
                                    'Tel Aviv',
                                    style: TextStyle(
                                      fontSize: 22,
                                      color: Color.fromARGB(80, 0, 0, 0),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 390,
                        margin: const EdgeInsets.only(top: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              child: const Row(
                                children: [
                                  Icon(
                                    Icons.phone,
                                    color: Colors.deepPurpleAccent,
                                    size: 28,
                                  ),
                                  Text(
                                    ' (11)987654321',
                                    style: TextStyle(
                                        fontFamily: "Poppins",
                                        fontSize: 18,
                                        color: Color.fromARGB(80, 0, 0, 0)),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: const Row(
                                children: [
                                  Icon(
                                    Icons.email_outlined,
                                    color: Colors.deepPurpleAccent,
                                    size: 28,
                                  ),
                                  Text(
                                    ' jorge@gmail.com',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Color.fromARGB(80, 0, 0, 0),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 390,
                        margin: const EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 180,
                              height: 80,
                              padding: const EdgeInsets.all(5),
                              margin: const EdgeInsets.only(top: 15),
                              decoration:
                                  const BoxDecoration(color: Colors.deepPurple),
                              child: TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'Configure',
                                    style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.white,
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
