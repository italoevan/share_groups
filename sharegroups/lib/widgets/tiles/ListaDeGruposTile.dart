import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sharegroups/models/ModelPost.dart';

class ListaDeGruposTile extends StatefulWidget {
  QueryDocumentSnapshot snapshot;

  ListaDeGruposTile(this.snapshot);

  @override
  _ListaDeGruposTileState createState() => _ListaDeGruposTileState();
}

class _ListaDeGruposTileState extends State<ListaDeGruposTile> {
  ModelPost post;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    post = ModelPost.fromMap(widget.snapshot.data());
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: width,
      height: 100,
      child: Card(
        color: Colors.green,
        child: Center(
          child: ListTile(
              title: Text(
                post.nome_grupo.toUpperCase(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 19,
                ),
              ),
              leading: Icon(
                Icons.link,
                color: Colors.white,
              ),
              trailing: Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(12)),
                child: Text(
                  post.apelido,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              )),
        ),
      ),
    );
  }
}
