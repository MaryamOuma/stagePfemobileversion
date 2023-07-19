import 'package:flutter/material.dart';
import 'package:flutter_project/controllers/user_controller.dart';
import 'package:get/get.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserController controller = Get.put(UserController());
    print(controller.user.value.image);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ClipOval(
          // Wrap the CircleAvatar with ClipOval to make it rounded
          child: CircleAvatar(
            radius: 50,
            backgroundColor: Colors.transparent, // Remove the background color
            child: Obx(() {
              // Use Obx to reactively update the UI when the imageUrl changes
              if (controller.user.value.image.isNotEmpty) {
                return ClipOval(
                  // Wrap the Image.asset with ClipOval to make it rounded
                  child: Container(
                    width:
                        100, // Set the width of the container containing the Image.asset
                    height:
                        100, // Set the height of the container containing the Image.asset
                    child: Image.network(controller.user.value.image),
                  ),
                );
              } else {
                return Image.asset(
                  "assets/icons/default-image.png",
                  width: 100, // Set the width and height to make it round
                  height: 100,
                );
              }
            }),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/icons/name.png",
                  width: 26,
                  height: 26,
                  // You can set the color of the icon image
                ),
                SizedBox(width: 8),
                Text(
                  controller.user.value.name,
                  style: TextStyle(
                      // Replace with your desired text style
                      ),
                ),
              ],
            )),
      ],
    );
  }
}
