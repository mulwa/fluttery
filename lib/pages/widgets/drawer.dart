import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountEmail: Text("mulwatech@gmail.com"),
              accountName: Text("Christopher Mulwa"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://media-exp1.licdn.com/dms/image/C4D03AQHR1bSfU2yM4g/profile-displayphoto-shrink_100_100/0?e=1598486400&v=beta&t=_hv2cMjpASJNYwCPntDGOYPIvWZUO6Bo6DpC8bdxEjU"),
              ),
              otherAccountsPictures: <Widget>[
                GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("adding another Account"),
                          );
                        });
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.orange,
                    child: Icon(Icons.add, color: Colors.white,),
                  ),
                )
              ],
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.inbox),
              title: Text("Inbox"),
              trailing: Chip(
                backgroundColor: Colors.blue[100],
                label: Text(
                  "25",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.edit),
              title: Text("Draft"),
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.archive),
              title: Text("Archive"),
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.paperPlane),
              title: Text("Sent"),
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.trash),
              title: Text("Trash"),
            ),
            Divider(),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: ListTile(
                  leading: Icon(FontAwesomeIcons.cog),
                  title: Text("Settings"),
                ),
              ),
            ),
          ],
        ),
      );
  }
}