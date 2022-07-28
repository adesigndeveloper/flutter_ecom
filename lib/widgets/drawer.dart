import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const imageurl =
        "https://media-exp1.licdn.com/dms/image/C4E03AQHA2Djz-jhqpw/profile-displayphoto-shrink_200_200/0/1644028387309?e=1659571200&v=beta&t=eWYMZTs64qTAp62m75uxbchtyFrQeQGfNbyo-sKLfug";
    return Drawer(
      child: Container(
        color: Colors.red,
        child: ListView(
          children: const [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,

                decoration: BoxDecoration(
                  color: Colors.red,
                ),
                accountName: Text("Aditya Sharma"),
                accountEmail: Text("adiworld.as@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageurl),
                ),
                // currentAccountPicture: CircleAvatar(
                //   backgroundImage: AssetImage("assets/images/male_avatar.png"),
                // ),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: Text(
                "Home",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
              ),
              title: Text(
                "Profile",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                color: Colors.white,
              ),
              title: Text(
                "Email Us",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
