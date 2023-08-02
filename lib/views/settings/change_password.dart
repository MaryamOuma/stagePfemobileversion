import 'package:flutter_project/shared/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_project/controllers/SettingsController.dart'; // Import the SettingsController

class ChangePasswordPage extends StatefulWidget {
  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final SettingsController settingsController =
      Get.put(SettingsController()); // Initialize the SettingsController
  final TextEditingController currentPasswordController =
      TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController retypeNewPasswordController =
      TextEditingController();

  bool passwordsMatch = false;

  void checkPasswordMatch() {
    String newPassword = newPasswordController.text;
    String retypeNewPassword = retypeNewPasswordController.text;
    setState(() {
      passwordsMatch = newPassword == retypeNewPassword;
    });
  }

  void changePassword() {
    // Call the changePassword method from the controller here
    // with the currentPasswordController.text and newPasswordController.text
    settingsController.changePassword(
      settingsController.authToken.value,
      currentPasswordController.text,
      newPasswordController.text,
    );
  }

  @override
  void dispose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    retypeNewPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double bottomPadding = MediaQuery.of(context).padding.bottom;

    Widget changePasswordButton = InkWell(
      onTap: () async {
        // Set the new passwords in the controller
        settingsController.currentPassword.value =
            currentPasswordController.text;
        settingsController.newPassword.value = newPasswordController.text;
        settingsController.retypeNewPassword.value =
            retypeNewPasswordController.text;

        var response = await settingsController.changePassword(
          settingsController.authToken.value,
          currentPasswordController.text,
          newPasswordController.text,
        );

        if (response.statusCode == 200) {
          // Reset the text controllers
          currentPasswordController.clear();
          newPasswordController.clear();
          retypeNewPasswordController.clear();
        }
      },
      child: Container(
        height: 80,
        width: width / 1.5,
        decoration: BoxDecoration(
            gradient: mainButton,
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.16),
                offset: Offset(0, 5),
                blurRadius: 10.0,
              )
            ],
            borderRadius: BorderRadius.circular(9.0)),
        child: Center(
          child: Text('confirm_change'.tr,
              style: const TextStyle(
                  color: const Color(0xfffefefe),
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                  fontSize: 20.0)),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        brightness: Brightness.light,
        backgroundColor: Colors.transparent,
        title: Text(
          'Settings',
          style: TextStyle(color: darkGrey),
        ),
        elevation: 0,
      ),
      body: SafeArea(
          bottom: true,
          child: LayoutBuilder(
            builder: (b, constraints) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding:
                                const EdgeInsets.only(bottom: 48.0, top: 16.0),
                            child: Text(
                              'change_password'.tr,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 12.0),
                            child: Text(
                              'enter_current_password'.tr,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8.0),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: TextField(
                                controller: currentPasswordController,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'existing_password'.tr,
                                    hintStyle: TextStyle(fontSize: 12.0)),
                                obscureText: true,
                              )),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 24, bottom: 12.0),
                            child: Text(
                              'enter_new_password'.tr,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8.0),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: TextField(
                                controller: newPasswordController,
                                onChanged: (_) => checkPasswordMatch(),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'new_password'.tr,
                                    hintStyle: TextStyle(fontSize: 12.0)),
                                obscureText: true,
                              )),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 24, bottom: 12.0),
                            child: Text(
                              'retype_new_password'.tr,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8.0),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: TextField(
                                controller: retypeNewPasswordController,
                                onChanged: (_) => checkPasswordMatch(),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'retype_password'.tr,
                                    hintStyle: TextStyle(fontSize: 12.0)),
                                obscureText: true,
                              )),
                        ],
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          padding: EdgeInsets.only(
                              top: 8.0,
                              bottom: bottomPadding != 20 ? 20 : bottomPadding),
                          width: width,
                          child: Center(child: changePasswordButton),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
