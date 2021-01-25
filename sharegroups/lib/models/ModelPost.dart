import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ModelPost{
  String nome_grupo;
  String apelido;
  var data;
  String link_grupo;
  String descricao;
  String email;
  ModelPost({@required this.nome_grupo,@required this.apelido,@required this.data,@required this.link_grupo,@required this.descricao, @required this.email});


ModelPost.fromMap(Map<String, dynamic> map){
  nome_grupo = map['nome_grupo'];
  apelido = map['apelido'];
  data = map['data'];
  link_grupo = map['link_grupo'];
  descricao = map['descricao'];

}

  Map<String,dynamic> toJson(){

  Map<String,dynamic> map = {};

  map['nome_grupo'] = nome_grupo;
  map['apelido'] = apelido;
  map['data'] = data;
  map['link_grupo'] = link_grupo;
  map['descricao']  = descricao;

  return map;


}


}