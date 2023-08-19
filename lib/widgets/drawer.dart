import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppDawer extends StatelessWidget {
  const AppDawer({super.key});

  final _imageurl = "https://cdn-icons-png.flaticon.com/512/1177/1177568.png";

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.purple,
        child: ListView(
          children: [
            DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  accountName: Text("Tridev Deka"),
                  accountEmail: Text("tridev@gmail.com"),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(_imageurl),
                  ),
                )),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: Text("Home", textScaleFactor: 1.2),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
              ),
              title: Text(
                "Profile",
                textScaleFactor: 1.2,
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                color: Colors.white,
              ),
              title: Text("Email", textScaleFactor: 1.2),
            )
          ],
        ),
      ),
    );
  }
}
