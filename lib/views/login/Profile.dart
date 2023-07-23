import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/shared/theme.dart';
import 'package:get/get.dart';

import '../../controllers/ProfileController.dart';
import '../../widgets/profile.dart';
import '../bottom_navigation_helper.dart';
import '../navigation_drawer.dart';

class Profile extends GetView<ProfileController> {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawer(),
      appBar: AppBar(
        title: Text('profil'.tr),
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            gradient: LinearGradient(
              colors: [
                Color(0xffE99E22),
                blue,
                grey,
              ],
            ),
          ),
        ),
      ),
      body: Body(),
      bottomNavigationBar: createHomeBottomNavigationBar(3),
    );
  }
}
