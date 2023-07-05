import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../shared/theme.dart';

import 'package:flutter/material.dart';

class CardStaggerdWidgets extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final IconData icon;
  final VoidCallback onTap;

  const CardStaggerdWidgets({
    Key? key,
    required this.label,
    required this.backgroundColor,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      //height: 130,
      child: InkWell(
        onTap: onTap,
        child: Card(
          color: backgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Icon(
                icon,
                size: 60,
                color: Colors.white,
              ),
              const SizedBox(height: 8),
              Text(
                'More info',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              Icon(
                Icons.arrow_circle_right,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
