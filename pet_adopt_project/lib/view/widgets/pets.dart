import 'package:flutter/material.dart';
import 'package:pet_adopt_project/view/pages/detailsPet.dart';

class Pets extends StatelessWidget {
  final String name;
  final List<dynamic> images;

  const Pets({super.key, required this.name, required this.images});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const DetailsPet()),
        );
      },
      child: Container(
        padding: const EdgeInsets.only(left: 5, bottom: 20, right: 5),
        height: 260,
        child: Row(
          children: [
            Container(
              width: 200,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
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
              child: Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    clipBehavior: Clip.antiAlias,
                    height: 150,
                    width: 200,
                    child: Image.network(
                      images[0].toString(),
                      height: 100,
                      width: 220,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          name,
                          style:
                              const TextStyle(fontSize: 20, color: Colors.pink),
                        ),
                        Container(
                          padding: const EdgeInsets.all(2),
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(50, 233, 30, 98),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(80, 255, 0, 0),
                                  blurRadius: 5,
                                  offset: Offset(0, 0),
                                )
                              ]),
                          child: const Icon(
                            Icons.female,
                            size: 30,
                            color: Colors.pink,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    padding: const EdgeInsets.only(left: 15),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: Colors.deepPurpleAccent,
                        ),
                        Text(
                          'California (2,5km)',
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    ),
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
