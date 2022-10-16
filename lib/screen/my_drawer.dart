import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Container(
        margin: EdgeInsets.only(top: 30, left: 8, right: 8, bottom: 2),
        // padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Column(
          children: [
            Row(
              // crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                          image: AssetImage("images/robin.png")),
                    )),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Maruf Ahmed Robin",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      " Verified user . Membership",
                      style: TextStyle(color: Colors.grey.shade500),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
                flex: 1,
                child: Column(
                  children: [
                    DrawerItem(
                      buttonName: "Set a Status",
                      icon: Icons.emoji_emotions,
                      clr: Colors.grey.shade400,
                      onTap: (() {}),
                    ),
                    Divider(indent: 45, thickness: 1),
                    DrawerItem(
                      buttonName: "Snooze Notifications",
                      icon: Icons.notifications,
                      clr: Colors.grey.shade400,
                      onTap: (() {}),
                    ),
                  ],
                )),
            Container(
              height: 20,
              width: double.infinity,
              color: Colors.grey.shade100,
            ),
            activityToYourFiles(),
            Container(
              height: 20,
              width: double.infinity,
              color: Colors.grey.shade100,
            ),
            editPeople(),
           
          ],
        ),
      ),
    );
  }

  Expanded editPeople() {
    return Expanded(
        flex: 2,
        child: Column(
          children: [
            DrawerItem(
                buttonName: "Invite People",
                icon: Icons.person_add,
                clr: Colors.grey.shade400,
                onTap: (() {})),
            Divider(
              indent: 45,
              thickness: 1,
            ),
            DrawerItem(
                buttonName: "Edit People",
                icon: Icons.person,
                clr: Colors.grey.shade400,
                onTap: (() {})),
            Divider(
              indent: 45,
              thickness: 1,
            ),
            DrawerItem(
                buttonName: "Settings",
                icon: Icons.settings,
                clr: Colors.grey.shade400,
                onTap: (() {}))
          ],
        ));
  }

  Expanded activityToYourFiles() {
    return Expanded(
        flex: 2,
        child: Column(
          children: [
            DrawerItem(
              buttonName: "Activity",
              icon: Icons.alternate_email,
              onTap: (() {}),
              clr: Colors.purple.shade600,
            ),
            Divider(
              indent: 45,
              thickness: 1,
            ),
            DrawerItem(
                buttonName: "Starred Items",
                icon: Icons.star,
                clr: Colors.yellow.shade900,
                onTap: (() {})),
            Divider(
              indent: 45,
              thickness: 1,
            ),
            DrawerItem(
                buttonName: "Your Files", icon: Icons.layers, onTap: (() {})),
            Divider(
              indent: 45,
              thickness: 1,
            ),
            DrawerItem(
                buttonName: "Directory",
                icon: Icons.all_inbox,
                clr: Colors.teal,
                onTap: (() {})),
          ],
        ));
  }
}

class DrawerItem extends StatelessWidget {
  DrawerItem(
      {Key? key,
      required this.buttonName,
      this.clr,
      required this.icon,
      required this.onTap})
      : super(key: key);
  VoidCallback? onTap;
  IconData? icon;
  Color? clr;
  String? buttonName;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          onPressed: onTap,
          child: Row(
            children: [
              Icon(
                icon,
                color: clr,
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                width: MediaQuery.of(context).size.width * 0.6,
                child: Text(
                  buttonName!,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.black87),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
