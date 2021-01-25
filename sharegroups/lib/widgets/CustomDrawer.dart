import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:sharegroups/stores/storeGeral.dart';

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
            child:

            Observer(builder: (context){return Column(
              children: [
                Padding(padding: EdgeInsets.all(8),child: Text("Olá ${storeGeral.apelido}",style: TextStyle(color: Colors.white),),),

              ],
            );},),
          ),
        ),
      ),
    );
  }
}
