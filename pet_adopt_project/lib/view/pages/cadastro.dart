import 'package:flutter/material.dart';
import 'package:pet_adopt_project/services/authenticate_user.dart';
import 'package:pet_adopt_project/models/user_model.dart';
import 'package:localstorage/localstorage.dart';
import 'package:pet_adopt_project/view/pages/login.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();

    void resgisterUser() async {
      try {
        await initLocalStorage();

        final UserModel userData = UserModel(
            name: nameController.text,
            email: emailController.text,
            phone: phoneController.text,
            password: passwordController.text,
            confirmpassword: confirmPasswordController.text);

        print(userData);

        var responseData = await createUser(userData);

        print("Usuário criado com sucesso: ${responseData['userId']}");

        localStorage.setItem('token', responseData['token']);
        localStorage.setItem('_idUser', responseData['userId']);

        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const Login()));
      } catch (e) {
        print("Erro ao registrar usuário: $e");
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            Colors.deepPurpleAccent, // Fundo transparente para a AppBar
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.deepPurpleAccent, // Cor de fundo do Container
              boxShadow: [
                BoxShadow(
                  color:
                      Colors.deepPurpleAccent.withOpacity(0.4), // Cor da sombra
                  spreadRadius: 2, // Espalhamento da sombra
                  blurRadius: 5, // Desfoque da sombra
                  offset: const Offset(0, 10), // Posição da sombra
                ),
              ],
            ),
            alignment: Alignment.center,
            height: 100,
            child: const Text(
              'Register',
              style: TextStyle(
                color: Colors.white, // Cor do texto para melhor visibilidade
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 60, right: 40, left: 40),
              padding: const EdgeInsets.all(20),
              color: const Color.fromARGB(50, 124, 77, 255),
              child: Column(
                children: [
                  const Text(
                    'Pet adopt',
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
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20.0, top: 20, bottom: 10),
                        child: TextField(
                          controller: nameController,
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Enter your username',
                          ),
                          cursorColor: const Color.fromARGB(255, 255, 255, 255),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20.0, bottom: 10),
                        child: TextField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Enter your email',
                          ),
                          cursorColor: const Color.fromARGB(255, 255, 255, 255),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20.0, bottom: 10),
                        child: TextField(
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Enter your phone',
                          ),
                          cursorColor: const Color.fromARGB(255, 255, 255, 255),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20.0, bottom: 20),
                        child: TextField(
                          controller: passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Enter your password',
                          ),
                          cursorColor: const Color.fromARGB(255, 255, 255, 255),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20.0, bottom: 20),
                        child: TextField(
                          controller: confirmPasswordController,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Confirm your password',
                          ),
                          cursorColor: const Color.fromARGB(255, 255, 255, 255),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 20),
                            child: ElevatedButton(
                              style: const ButtonStyle(
                                  padding: WidgetStatePropertyAll(
                                      EdgeInsets.only(
                                          left: 50,
                                          right: 50,
                                          top: 15,
                                          bottom: 15)),
                                  foregroundColor:
                                      WidgetStatePropertyAll(Colors.white),
                                  backgroundColor: WidgetStatePropertyAll(
                                      Color.fromARGB(150, 124, 77, 255))),
                              onPressed: () {
                                resgisterUser();
                              },
                              child: const Text(
                                'Register',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
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
