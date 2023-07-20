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

  NotificationModel({
    required this.notifications,
    required this.commandsNumber,
    required this.clientscommandsNumber,
    required this.myclientsRejectedCommandsNumber,
    required this.thresholdArticles,
    required this.expiringSoonArticles,
    required this.myRejectedCommandsNumber,
    required this.invoicesTopay,
    required this.invoicesToValidate,
    required this.exitinvoicesTopay,
    required this.exitInvoicesToValidate,
    required this.expirationArticles,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
        notifications: json['notifications'],
        commandsNumber: json['commandsNumber'],
        clientscommandsNumber: json['clientscommandsNumber'],
        myclientsRejectedCommandsNumber:
            json['myclientsRejectedCommandsNumber'],
        thresholdArticles: json['thresholdArticles'],
        expiringSoonArticles: json['expiringSoonArticles'],
        myRejectedCommandsNumber: json['myRejectedCommandsNumber'],
        invoicesTopay: json['invoicesTopay'],
        invoicesToValidate: json['invoicesToValidate'],
        exitinvoicesTopay: json['exitinvoicesTopay'],
        exitInvoicesToValidate: json['exitInvoicesToValidate'],
        expirationArticles: json['expirationArticles']);
  }
}