import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:sharegroups/stores/storeGeral.dart';
import 'package:sharegroups/widgets/tiles/DrawerTile.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  StoreGeral storeGeral;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    storeGeral = Provider.of<StoreGeral>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Theme.of(context).accentColor,
        child: SafeArea(
          child: Container(
            child: Observer(
              builder: (context) {
                return Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        "Hello ${storeGeral.apelido}",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontFamily: 'PottaOne',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Divider(),
                    Container(
                      height: 150,
                      child: Center(
                        child: Text(
                          'SHARE\n GROUPS',
                          style: TextStyle(
                              fontSize: 45,
                              fontFamily: 'AlmondCream',
                              color: Colors.green),
                        ),
                      ),
                    ),
                    Divider(),
                    DrawerTile(
                      () {
                        launch(
                            'https://play.google.com/store/apps/details?id=com.evinc.sharegroups');
                      },
                      'Rate Us',
                      Icons.star,
                      colorIcon: Colors.orange,
                    ),
                    Spacer(),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            "ÉVINC",
                            style: TextStyle(color: Colors.white),
                          )),
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
