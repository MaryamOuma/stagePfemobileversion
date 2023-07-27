import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/EntriesController.dart';

class ArticleCommandCard extends StatelessWidget {
  final String? reference;
  final String? name;
  final DateTime? premptionDate;
  final String? price;
  final bool? critical;
  final bool? active;
  final String? managingType;
  final int? threshold;
  final String? barcode;
  final int? supplierId;
  final int? familyId;
  final int? quantity;
  final DateTime? expirationDate;

  const ArticleCommandCard({
    Key? key,
    required this.reference,
    required this.name,
    this.premptionDate,
    required this.price,
    required this.critical,
    required this.active,
    required this.managingType,
    required this.threshold,
    this.barcode,
    this.supplierId,
    this.familyId,
    required this.quantity,
    this.expirationDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Register EntriesController
    Get.put(EntriesController());
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
                reference!,
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
                      'Name: $name',
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
                      'ExpirationDate: $expirationDate',
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
                    Icon(Icons.add_circle),
                    SizedBox(width: 8),
                    Text(
                      'Quantity: $quantity',
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
                      'PremptionDate: $premptionDate',
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
                      'Critical: $critical',
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
