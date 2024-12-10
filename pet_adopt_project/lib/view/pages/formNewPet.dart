import 'package:flutter/material.dart';
import 'package:pet_adopt_project/services/newPet_controller.dart';
import 'package:pet_adopt_project/models/pet_model.dart';
import 'package:pet_adopt_project/view/pages/navigation.dart';

class NewPet extends StatefulWidget {
  const NewPet({super.key});

  @override
  State<NewPet> createState() => _NewPetState();
}

class _NewPetState extends State<NewPet> {
  int? _selectedGenderIndex;
  String? gender;

  void _onGenderChanged(int index) {
    setState(() {
      if (_selectedGenderIndex == index) {
        _selectedGenderIndex = null;
      } else {
        _selectedGenderIndex = index;
        gender = index == 0 ? 'masculino' : 'feminino';
      }
    });
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController imagesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void resgisterPet() async {
      try {
        final PetModel petData = PetModel(
            name: nameController.text,
            color: colorController.text,
            weight: weightController.hashCode,
            age: ageController.hashCode,
            images: [imagesController.text]);

        print(petData);

        var responseData = await registerNewPet(petData);

        print("Pet registrado com sucesso: $responseData");

        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const Controller()));
      } catch (e) {
        print("Erro ao registrar usuário: $e");
      }
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 40, left: 40),
              padding: const EdgeInsets.all(20),
              color: const Color.fromARGB(50, 124, 77, 255),
              child: Column(
                children: [
                  const Text(
                    'New Pet Form',
                    style: TextStyle(
                      fontSize: 32,
                      color: Color.fromARGB(255, 103, 86, 139),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: TextField(
                          controller: nameController,
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Pet name',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: TextField(
                          controller: colorController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Color',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: TextField(
                          controller: weightController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Weight',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: TextField(
                          controller: ageController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Age',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: TextField(
                          controller: imagesController,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Images URL',
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Gender:'),
                                  CheckboxExample(
                                    label: 'Male',
                                    index: 0,
                                    isSelected: _selectedGenderIndex == 0,
                                    onChanged: _onGenderChanged,
                                  ),
                                  CheckboxExample(
                                    label: 'Female',
                                    index: 1,
                                    isSelected: _selectedGenderIndex == 1,
                                    onChanged: _onGenderChanged,
                                  ),
                                ],
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  resgisterPet();
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 50, vertical: 15),
                                  backgroundColor:
                                      const Color.fromARGB(150, 124, 77, 255),
                                ),
                                child: const Text(
                                  'Register',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ],
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

class CheckboxExample extends StatelessWidget {
  final String label;
  final int index;
  final bool isSelected;
  final ValueChanged<int> onChanged;

  const CheckboxExample({
    super.key,
    required this.label,
    required this.index,
    required this.isSelected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: isSelected,
          onChanged: (bool? value) {
            if (value == true || (value == false && isSelected)) {
              onChanged(index);
            }
          },
        ),
        Text(label),
      ],
    );
  }
}
