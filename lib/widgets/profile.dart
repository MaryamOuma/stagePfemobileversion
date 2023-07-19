import 'package:flutter/material.dart';
import 'package:flutter_project/controllers/user_controller.dart';
import 'package:flutter_project/widgets/profile_menu.dart';
import 'package:flutter_project/widgets/profile_pic.dart';
import 'package:get/get.dart';

class Body extends StatelessWidget {
  UserController controller = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          Obx(() => ProfileMenu(
                text: controller.user.value.profil,
                icon: "assets/icons/user.png",
                press: () {},
              )),
          Obx(() => ProfileMenu(
                text: controller.user.value.email,
                icon: "assets/icons/email.png",
                press: () {},
              )),
          Obx(() => ProfileMenu(
                text: controller.user.value.department,
                icon: "assets/icons/department.png",
                press: () {},
              )),
          Obx(() => ProfileMenu(
                text: controller.user.value.superuser,
                icon: "assets/icons/superuser.jpg",
                press: () => {},
              )),
          ProfileMenu(
            text: "Change password",
            icon: "assets/icons/logout.png",
            press: () => {},
          ),
        ],
      ),
    );
  }
}
