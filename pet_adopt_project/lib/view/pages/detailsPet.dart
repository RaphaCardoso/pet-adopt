import 'package:flutter/material.dart';
import 'package:pet_adopt_project/services/petDetails.dart';
import 'package:pet_adopt_project/view/pages/navigation.dart';

class DetailsPet extends StatefulWidget {
  final String id;

  const DetailsPet({super.key, required this.id});

  @override
  State<DetailsPet> createState() => _DetailsPetState();
}

class _DetailsPetState extends State<DetailsPet> {
  String nome = '';
  int age = 0;
  int weight = 0;
  String colors = '';
  List<String> images = [];

  void getPetsDetails() async {
    try {
      var responseData = await petsDetails(widget.id);

      print(responseData);

      setState(() {
        nome = responseData['pet']['name'];
        age = responseData['pet']['age'];
        weight = responseData['pet']['weight'];
        colors = responseData['pet']['color'];
        images.add(responseData['pet']['images'][0]);
      });

      print("Detalhe pet efetuado com sucesso!");
    } catch (e) {
      print("Erro ao detalhar pet: $e");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getPetsDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 450,
            floating: false,
            // pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    images[0],
                    fit: BoxFit.cover,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.only(left: 20, top: 50),
                    child: Container(
                      width: 55,
                      height: 55,
                      color: const Color.fromARGB(100, 0, 0, 0),
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const Controller(),
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios_sharp,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 500,
              width: double.infinity,
              child: Column(
                children: [
                  Container(
                    height: 140,
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
                              padding: const EdgeInsets.only(left: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    nome,
                                    style: const TextStyle(
                                        fontSize: 28, color: Colors.pink),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 32),
                                    padding: const EdgeInsets.all(2),
                                    decoration: const BoxDecoration(
                                        color: Color.fromARGB(50, 233, 30, 98),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Color.fromARGB(80, 255, 0, 0),
                                            blurRadius: 5,
                                            offset: Offset(0, 0),
                                          )
                                        ]),
                                    child: const Icon(
                                      Icons.female,
                                      size: 38,
                                      color: Colors.pink,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.location_on_outlined,
                                    color: Colors.deepPurpleAccent,
                                    size: 38,
                                  ),
                                  Text(
                                    'California (2,5km)',
                                    style: TextStyle(
                                      fontSize: 22,
                                      color: Color.fromARGB(80, 0, 0, 0),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(top: 20),
                              height: 140,
                              width: 100,
                              child: const Column(
                                children: [
                                  Text(
                                    '\$95',
                                    style: TextStyle(
                                        fontFamily: "Poppins",
                                        fontSize: 26,
                                        color: Color.fromARGB(255, 0, 0, 0)),
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 400,
                    height: 200,
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: 80,
                                height: 120,
                                padding: const EdgeInsets.only(top: 25),
                                decoration: BoxDecoration(
                                    color: Colors.deepPurple[100]),
                                child: const Column(
                                  children: [
                                    Text(
                                      'Breed',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      'Persian',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                width: 80,
                                height: 120,
                                padding: const EdgeInsets.only(top: 25),
                                decoration: BoxDecoration(
                                    color: Colors.deepPurple[100]),
                                child: Column(
                                  children: [
                                    const Text(
                                      'Color',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      colors,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                width: 80,
                                height: 120,
                                padding: const EdgeInsets.only(top: 25),
                                decoration: BoxDecoration(
                                    color: Colors.deepPurple[100]),
                                child: Column(
                                  children: [
                                    const Text(
                                      'Weight',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      weight.toString(),
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                width: 80,
                                height: 120,
                                padding: const EdgeInsets.only(top: 25),
                                decoration: BoxDecoration(
                                    color: Colors.deepPurple[100]),
                                child: Column(
                                  children: [
                                    const Text(
                                      'Age',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      age.toString(),
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 400,
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 10, right: 10),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(140),
                            ),
                          ),
                          clipBehavior: Clip
                              .antiAlias, // Necessário para o Container recortar a imagem
                          child: Image.asset(
                            'assets/images/user.jpg', // Substitua pelo caminho da sua imagem
                            fit: BoxFit.cover,
                            width: 100,
                          ),
                        ),
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Owner by:',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(120, 0, 0, 0)),
                            ),
                            Text(
                              'Jorge Mendes',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                            )
                          ],
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(140),
                            ),
                            color: Colors.deepPurple[100],
                          ),
                          child: const Icon(
                            Icons.phone,
                            size: 30,
                          ),
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(140),
                            ),
                            color: Colors.deepPurple[100],
                          ),
                          child: const Icon(
                            Icons.message_outlined,
                            size: 30,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
