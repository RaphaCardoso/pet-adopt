import 'package:flutter/material.dart';
import 'package:pet_adopt_project/controller/petsUser_controller.dart';
import 'package:pet_adopt_project/view/widgets/pets.dart';

class RegisterPet extends StatefulWidget {
  const RegisterPet({super.key});

  @override
  State<RegisterPet> createState() => _RegisterPetState();
}

class _RegisterPetState extends State<RegisterPet> {
  List<Map<String, dynamic>> pets = [];

  void getPetsUser() async {
    try {
      var responseData = await petsUser();

      print("////////////////");
      print(responseData);

      for (var element in responseData['pets']) {
        setState(() {
          pets.add(element);
        });
      }
    } catch (e) {
      print("Erro ao listar pets: $e");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPetsUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  width: 370,
                  height: 50,
                  padding: const EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 0.5,
                      color: const Color.fromARGB(100, 124, 77, 255),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                        suffixIcon: Container(
                          width: 50,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(100, 124, 77, 255),
                              borderRadius: BorderRadius.circular(10)),
                          child: const Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                        ),
                        border: InputBorder.none,
                        hintText: "Search",
                        hintStyle: const TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 78, 48, 161),
                        )),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
              width: 370,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Pets User',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(150, 124, 77, 255),
                        fontSize: 20),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'See All',
                      style: TextStyle(
                        color: Color.fromARGB(255, 100, 62, 204),
                        fontSize: 16,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 300, // Altura fixa para os itens
              child: ListView.builder(
                scrollDirection: Axis.horizontal, // Rolagem horizontal
                itemCount: pets.length, // Quantidade de itens
                itemBuilder: (context, index) {
                  List<dynamic> images = pets[index]['images'];

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Pets(
                      name: pets[index]['name'],
                      images: images,
                    ),
                  );
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              height: 260,
              width: 375,
              decoration: const BoxDecoration(
                color: Color.fromARGB(150, 124, 77, 255),
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 260,
                        width: 200,
                        padding:
                            const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text(
                              "Adopt! \nEvery pet deserves a loving home. By adopting, you are giving a second chance to a furry friend in need. Bring joy into your life and theirs—save a life today!",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                              softWrap: true,
                              textAlign: TextAlign.center,
                            ),
                            Container(
                              padding: const EdgeInsets.all(0.5),
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                                color: Colors.white,
                              ),
                              child: TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'Adopt now',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 260,
                        width: 170,
                        child: Image.asset(
                          'assets/images/adoptPet.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
