import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_project/controllers/ExitsController.dart';
import 'package:flutter_project/views/exits/Details.dart';
import 'package:get/get.dart';

class ExitCommandCard extends StatelessWidget {
  final String commandReference;
  final int id;
  final String dateOfCreation;
  final int articlesCount;
  final String userName;
  final String price;
  final String status;
  final String clientName;

  const ExitCommandCard({
    Key? key,
    required this.id,
    required this.commandReference,
    required this.dateOfCreation,
    required this.articlesCount,
    required this.userName,
    required this.price,
    required this.status,
    required this.clientName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Register EntriesController
    Get.put(ExitsController());

    final random = Random();
    final gradient = LinearGradient(
      colors: [
        Color(0xffFDB846),
        Color(0xffE99E22),
        Color.fromRGBO(253, 184, 70, 0.7),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
    final color = Color.fromARGB(255, 169, 192, 240);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        /*image: const DecorationImage(
       // image: AssetImage('images/commands-back.jpg'),
        fit: BoxFit.cover,
      ),*/
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            offset: const Offset(4, 6),
            blurRadius: 4.0,
          ),
        ],
        // gradient: gradient,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: ExpansionTile(
        title: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            gradient: gradient,
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(10.0)),
          ),
          child: Row(
            children: [
              Icon(
                Icons.info_outline,
                color: Colors.white,
              ),
              SizedBox(width: 8),
              Text(
                commandReference,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'YourDesiredFont',
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.grey[
            300], // Set the background color for the body of ExpansionTile
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.calendar_today),
                    SizedBox(width: 8),
                    Text(
                      'Date of Creation: $dateOfCreation',
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: 'YourDesiredFont',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),
                Row(
                  children: [
                    Icon(Icons.attach_money),
                    SizedBox(width: 8),
                    Text(
                      'Price: $price',
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: 'YourDesiredFont',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),
                Row(
                  children: [
                    Icon(Icons.article),
                    SizedBox(width: 8),
                    Text(
                      'Articles Count: $articlesCount articles',
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: 'YourDesiredFont',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),
                Row(
                  children: [
                    Icon(Icons.person),
                    SizedBox(width: 8),
                    Text(
                      'Made By User: $userName',
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: 'YourDesiredFont',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),
                Row(
                  children: [
                    Icon(Icons.info),
                    SizedBox(width: 8),
                    Text(
                      'Status: $status',
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: 'YourDesiredFont',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),
                Row(
                  children: [
                    Icon(Icons.business),
                    SizedBox(width: 8),
                    Text(
                      'Client: $clientName',
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: 'YourDesiredFont',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Inside the Padding widget:
          // Inside the Padding widget:
          Padding(
            padding: const EdgeInsets.only(top: 8.0, right: 8.0, bottom: 8.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: CustomFancyElevatedButton(
                onPressed: () {
                  Get.to(() => DetailScreen(commandId: id),
                      transition: Transition.fade);
                },
                buttonText: 'See Details',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Custom Fancy Elevated Button Widget
class CustomFancyElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;

  CustomFancyElevatedButton({
    required this.onPressed,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8.0,
      borderRadius: BorderRadius.circular(24.0),
      shadowColor: Colors.blue.withOpacity(0.5),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: Colors.blue,
          onPrimary: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0),
          ),
          padding: EdgeInsets.zero,
          // Add more customizations here if needed
        ),
        child: SizedBox(
          width: 200.0, // Set the width as needed
          height: 50.0,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.0),
              gradient: LinearGradient(
                colors: [
                  Color(0xffFDB846),
                  Color(0xffE99E22),
                  Color.fromRGBO(253, 184, 70, 0.7),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
