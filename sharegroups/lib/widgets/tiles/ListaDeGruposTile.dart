import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sharegroups/models/ModelPost.dart';

class ListaDeGruposTile extends StatelessWidget {
  ModelPost post;
  int i;

  ListaDeGruposTile(this.post, this.i);

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
            title: Text(post.descricao[i]),
          ),
        ),
      ),
    );
  }
}
