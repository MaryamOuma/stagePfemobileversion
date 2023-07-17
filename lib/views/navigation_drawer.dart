import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bottom_navigation_helper.dart';
import 'entries/entries.dart';
import 'notifications.dart';
import 'settings.dart';
import 'entries/entries.dart';
import 'exits/exits.dart';

import 'home.dart';

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  int hoveredItemIndex = -1; // Track the hovered item index

  @override
  Widget build(BuildContext context) => Drawer(
        child: ClipRRect(
          //borderRadius: BorderRadius.circular(20),
          child: Container(
            color: Colors.grey[300],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                buildHeader(context),
                buildMenuItems(context),
              ],
            ),
          ),
        ),
      );

  Widget buildMenuItems(BuildContext context) => Container(
        padding: const EdgeInsets.all(24),
        child: Wrap(
          runSpacing: 10,
          children: [
            buildMenuItem(
              icon: Icons.home_outlined,
              text: 'Home',
              index: 0,
              onTap: () {
                Get.offAll(() => Home());
              },
            ),
            //const Divider(color: Colors.black54),
             buildMenuItem(
              icon: Icons.input,
              text: 'Entries',
              index: 1,
              onTap: () {
                Get.to(() => Entries(
                      bottomNavigationBar: handleBottomNavigationBar(1),
                    ));
              },
            ),
            //const Divider(color: Colors.black54),
             buildMenuItem(
              icon: Icons.output,
              text: 'Exits',
              index: 2,
              onTap: () {
                Get.to(() => Exits(
                      bottomNavigationBar: handleBottomNavigationBar(2),
                    ));
              },
            ),
            buildMenuItem(
              icon: Icons.logout,
              text: 'Log out',
              index: 3,
              onTap: () {
                //AuthController().logout();
              },
            ),
          ],
        ),
      );
      Widget buildMenuItem({
    required IconData icon,
    required String text,
    required int index,
    required VoidCallback onTap,
  }) {
    final isHovered = hoveredItemIndex == index;
    // Define the animation duration and curve
    final Duration animationDuration = Duration(milliseconds: 200);
    final Curve animationCurve = Curves.easeInOut;

    return MouseRegion(
      onEnter: (_) {
        setState(() {
          hoveredItemIndex = index; // Update the hovered item index
        });
      },
      onExit: (_) {
        setState(() {
          hoveredItemIndex = -1; // Reset the hovered item index
        });
      },
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: animationDuration,
          curve: animationCurve,
          /* decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(175, 190, 34, 1).withOpacity(0.4),
                blurRadius: 1,
                spreadRadius: 20,
              ),
            ],
          ),*/
          transform:
              isHovered ? Matrix4.identity().scaled(1.1) : Matrix4.identity(),
          child: ListTile(
            leading: Stack(
              children: [
                Icon(
                  icon,
                  color: Colors.grey[600],
                ),
                if (isHovered)
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(175, 190, 34, 1),
                            blurRadius: 8,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
            title: Stack(
              children: [
                Text(
                  text,
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
                if (isHovered)
                  Positioned.fill(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(175, 190, 34, 1)
                                  .withOpacity(0.4),
                              blurRadius: 1,
                              spreadRadius: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            onTap: onTap, // Set the onTap callback
          ),
        ),
      ),
    );
  }
  Widget _icon() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 2),
        shape: BoxShape.circle,
      ),
      child: const Icon(Icons.person, color: Colors.white, size: 100),
    );
  }

  Widget buildHeader(BuildContext context) => ClipPath(
        clipper: WaveClipper(),
        child: Container(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 24),
          // color: Color.fromRGBO(175, 190, 34, 1),
          color: Color.fromARGB(255, 122, 158, 187),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 12),
                child: _icon(),
              ),
            Padding(
                padding: EdgeInsets.only(bottom: 3),
                child: Text(
                  'Kawtar Bekkali',
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                  ),
                ),
              ),
            Padding(
                padding: EdgeInsets.only(bottom: 12),
                child: Text(
                  'k.bek@gmail.com',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Text(
                  '',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 60);

    final firstControlPoint = Offset(size.width / 4, size.height);
    final firstEndPoint = Offset(size.width / 2.25, size.height - 30);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    final secondControlPoint = Offset(size.width - (size.width / 3.25),
        size.height - 50); // Adjust the y-coordinate
    final secondEndPoint =
        Offset(size.width, size.height - 20); // Adjust the y-coordinate
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height - 20);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  //bool shouldReclip(WaveClipper oldClipper) => false;

  //@override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
