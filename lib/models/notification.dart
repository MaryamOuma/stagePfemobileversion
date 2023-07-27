import 'package:flutter_project/models/Article.dart';
import 'package:flutter_project/models/Command.dart';
import 'package:flutter_project/models/ExitCommand.dart';
import 'package:flutter_project/models/ExitInvoice.dart';
import 'package:flutter_project/models/Invoice.dart';

class NotificationModel {
  int? notifications;
  int? commandsNumber;
  int? clientscommandsNumber;
  int? myclientsRejectedCommandsNumber;
  int? thresholdArticles;
  int? expiringSoonArticles;
  int? expirationArticles;
  int? myRejectedCommandsNumber;
  int? invoicesTopay;
  int? invoicesToValidate;
  int? exitinvoicesTopay;
  int? exitInvoicesToValidate;
  final List<ExitCommand>? clientscommands;
  final List<ExitCommand>? rejectedclientscommands;
  final List<Command>? commands;
  final List<Command>? rejectedcommands;
  final List<Invoice>? entriesinvoicesTopay;
  final List<Invoice>? entriesinvoicesTovalidate;
  final List<ExitInvoice>? exitsinvoicesTopay;
  final List<ExitInvoice>? exitsinvoicesTovalidate;
  final List<Article>? expiredarticles;
  final List<Article>? thresholdarticles;
  NotificationModel({
    required this.notifications,
    required this.commandsNumber,
    required this.clientscommandsNumber,
    required this.clientscommands,
    required this.rejectedclientscommands,
    required this.commands,
    required this.rejectedcommands,
    required this.myclientsRejectedCommandsNumber,
    required this.thresholdArticles,
    required this.expiringSoonArticles,
    required this.myRejectedCommandsNumber,
    required this.invoicesTopay,
    required this.invoicesToValidate,
    required this.exitinvoicesTopay,
    required this.exitInvoicesToValidate,
    required this.exitsinvoicesTopay,
    required this.exitsinvoicesTovalidate,
    required this.entriesinvoicesTopay,
    required this.entriesinvoicesTovalidate,
    required this.expirationArticles,
    required this.expiredarticles,
    required this.thresholdarticles,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
        notifications: json['notifications'],
        commandsNumber: json['commandsNumber'],
        clientscommandsNumber: json['clientscommandsNumber'],
        clientscommands: json['clientscommands'] != null
            ? List<ExitCommand>.from(
                json['clientscommands']
                    .map((item) => ExitCommand.fromJson(item)),
              )
            : null,
        rejectedclientscommands: json['rejectedclientscommands'] != null
            ? List<ExitCommand>.from(
                json['rejectedclientscommands']
                    .map((item) => ExitCommand.fromJson(item)),
              )
            : null,
        commands: json['myCommands'] != null
            ? List<Command>.from(
                json['myCommands'].map((item) => Command.fromJson(item)),
              )
            : null,
        rejectedcommands: json['myRejectedCommands'] != null
            ? List<Command>.from(
                json['myRejectedCommands']
                    .map((item) => Command.fromJson(item)),
              )
            : null,
        myclientsRejectedCommandsNumber:
            json['myclientsRejectedCommandsNumber'],
        thresholdArticles: json['thresholdArticles'],
        expiringSoonArticles: json['expiringSoonArticles'],
        myRejectedCommandsNumber: json['myRejectedCommandsNumber'],
        invoicesTopay: json['invoicesTopay'],
        invoicesToValidate: json['invoicesToValidate'],
        exitinvoicesTopay: json['exitinvoicesTopay'],
        exitInvoicesToValidate: json['exitInvoicesToValidate'],
        entriesinvoicesTopay: json['EntriesinvoicesToPay'] != null
            ? List<Invoice>.from(
                json['EntriesinvoicesToPay']
                    .map((item) => Invoice.fromJson(item)),
              )
            : null,
        entriesinvoicesTovalidate: json['EntriesinvoicesToValidate'] != null
            ? List<Invoice>.from(
                json['EntriesinvoicesToValidate']
                    .map((item) => Invoice.fromJson(item)),
              )
            : null,
        exitsinvoicesTopay: json['ExitsinvoicesToPay'] != null
            ? List<ExitInvoice>.from(
                json['ExitsinvoicesToPay']
                    .map((item) => ExitInvoice.fromJson(item)),
              )
            : null,
        exitsinvoicesTovalidate: json['ExitsinvoicesToValidate'] != null
            ? List<ExitInvoice>.from(
                json['ExitsinvoicesToValidate']
                    .map((item) => ExitInvoice.fromJson(item)),
              )
            : null,

        // Use the fromJson method to convert the JSON data into List<Article>
        expiredarticles: json['expirationArticlesData'] != null
            ? List<Article>.from(json['expirationArticlesData']
                .map((item) => Article.fromJson(item)))
            : null,
        thresholdarticles: json['thresholdArticlesData'] != null
            ? List<Article>.from(json['thresholdArticlesData']
                .map((item) => Article.fromJson(item)))
            : null,
        expirationArticles: json['expirationArticles']);
  }
}
