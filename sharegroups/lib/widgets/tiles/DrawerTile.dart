import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  Function function;
  String text;
  IconData icon;
  MaterialColor colorIcon;

  DrawerTile(this.function, this.text, this.icon, {this.colorIcon});
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
          onTap: function,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green)
            ),
              height: 60,
              child: ListTile(
                title: Text(
                  text,
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'PottaOne',
                      color: Colors.white),
                ),
                leading: Icon(
                  icon,
                  color: colorIcon != null ? colorIcon : Colors.white,
                ),
              ))),
    );
  }
}
