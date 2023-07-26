import 'package:flutter/material.dart';
import 'package:flutter_project/controllers/notification_controller.dart';
import 'package:get/get.dart';

import '../shared/theme.dart';

class IconMenuItem extends StatelessWidget {
  final String title;
  final String? row1;
  final IconData? icon;
  final VoidCallback? onTap;
  final int itemId; // New parameter to store the item ID

  const IconMenuItem({
    Key? key,
    this.title = '',
    this.row1,
    this.icon,
    this.onTap,
    required this.itemId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NotificationController notifcontroller = Get.put(NotificationController());
    bool isClicked = notifcontroller.clickedStatusMap[itemId] ?? false;
    print(isClicked);
    return InkWell(
        onTap: onTap,
        child: Container(
          //color: Colors.white,
          margin: EdgeInsets.all(2.0),
          //width: 320.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: isClicked ? Colors.white : Colors.grey[300],
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0, 2),
                blurRadius: 6.0,
              ),
            ],
            border: Border.all(
              width: 1.0,
              color: grey,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    SizedBox(width: 8.0),
                    Container(
                      width: 60,
                      // decoration: BoxDecoration(
                      //   color: Theme.of(context).primaryColorLight,
                      //   borderRadius: BorderRadius.circular(15.0),
                      //   border: Border.all(
                      //     width: 1.0,
                      //     color: Theme.of(context).primaryColorLight,
                      //   ),
                      // ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(icon,
                              color: Theme.of(context).primaryColorDark,
                              size: 40)
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              this.title,
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 4.0),
                            Text(
                              row1!,
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 4.0),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
