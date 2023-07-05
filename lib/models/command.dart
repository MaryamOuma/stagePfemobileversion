import 'package:flutter/material.dart';

class Command {
  Color begin = Colors.transparent;
  Color end = Colors.transparent;
  String commandReference = '';
  int articlesNb = 0;

  Command(this.begin, this.end, this.commandReference, this.articlesNb);
}
