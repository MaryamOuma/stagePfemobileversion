import 'package:get/get.dart';
import '../models/notification.dart';

class NotificationsController extends GetxController {
  final RxList<NotificationCard> _notificationCards = <NotificationCard>[].obs;

  List<NotificationCard> get notificationCards => _notificationCards.toList();

  void clearAllNotifications() {
    _notificationCards.clear();
  }

  void clearNotification(int index) {
    if (index >= 0 && index < _notificationCards.length) {
      _notificationCards.removeAt(index);
    }
  }

  void viewNotification(int index) {
    // Handle viewing notification at the given index
  }

  void addNotification(NotificationCard notification) {
    _notificationCards.add(notification);
  }

  var notifications = <dynamic>[].obs;
  @override
  void onInit() {
    super.onInit();
    fetchNotifications();
  }

  // Method to retrieve notification data
  void fetchNotifications() {

    final List<NotificationCard> fetchedNotifications = [
      NotificationCard(
        date: DateTime.now(),
        title: 'Commands',
        subtitle: 'You have x commands to treat',
      ),
      NotificationCard(
        date: DateTime.now(),
        title: 'Invoices',
        subtitle: 'You have x invoices to validate',
      ),
      NotificationCard(
        date: DateTime.now(),
        title: 'Orders',
        subtitle: 'You have x orders to treat',
      ),
    ];

    _notificationCards.addAll(fetchedNotifications);
  }

}