import 'package:flutter/material.dart';

class HomeTile extends StatelessWidget {
  String img;
  String nomeCategoria;
  BuildContext context;

  HomeTile(this.nomeCategoria, this.context, this.img);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(1),
      height: 90,
      child: Card(
        color: Colors.green,
        child: Center(
          child: ListTile(
            title: Text(nomeCategoria.toUpperCase(), style: TextStyle(color: Colors.white, fontSize: 25),),
            leading: img != null ? Image.network(img, fit: BoxFit.cover, height: 50,width: 50,) : Container(width: 50, height: 50,),
            trailing: Icon(Icons.arrow_forward,color: Colors.white,),
          ),
        ),
      ),
    );
  }
}
