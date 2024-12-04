import 'package:flutter/material.dart';

class petCategory extends StatelessWidget {
  const petCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5, right: 15),
      padding: const EdgeInsets.only(left: 10, right: 10),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        color: Color.fromARGB(95, 77, 98, 255),
      ),
      width: 100,
      height: 55,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            clipBehavior: Clip.antiAlias,
            height: 40,
            width: 40,
            child: Image.asset(
              'assets/images/gatinho.jpg',
              fit: BoxFit.cover,
            ),
          ),
          const Text(
            'Cat',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 20),
          ),
        ],
      ),
    );
  }
}
