import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/ExitsController.dart';

class CommandCard extends StatelessWidget {
  final String commandReference;
  final String dateOfCreation;
  final int articlesCount;
  final String userName;
  final String price;
  final String status;
  final String client;

  const CommandCard({
    Key? key,
    required this.commandReference,
    required this.dateOfCreation,
    required this.articlesCount,
    required this.userName,
    required this.price,
    required this.status,
    required this.client,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Register EntriesController
    Get.put(ExitsController());
    final random = Random();
    final color = Color.fromARGB(255, 169, 192, 240);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: const DecorationImage(
          image: AssetImage('images/commands-back.jpg'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            offset: const Offset(4, 6),
            blurRadius: 4.0,
          ),
        ],
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: color,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(10.0)),
            ),
            child: Text(
              commandReference,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'YourDesiredFont',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Date of Creation: $dateOfCreation',
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'YourDesiredFont',
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  'Articles Count: $articlesCount',
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'YourDesiredFont',
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  'Price: $price',
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'YourDesiredFont',
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  'Made By: $userName',
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'YourDesiredFont',
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  'Status : $status',
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'YourDesiredFont',
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  'Client : $client',
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'YourDesiredFont',
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, right: 8.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: () {
                  // Button action
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: const Text(
                  'Details',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'YourDesiredFont',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
