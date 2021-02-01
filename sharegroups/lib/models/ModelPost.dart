import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ModelPost{
  String nome_grupo;
  String apelido;
  var data;
  String link_grupo;
  String descricao;
  String email;
  bool disponivel;
  String idUsuario;
  String imageUrl;
  String tagName;
  ModelPost({@required this.nome_grupo,@required this.apelido,@required this.data,@required this.link_grupo,@required this.descricao, @required this.email,@required this.idUsuario ,@required this.imageUrl,this.disponivel,this.tagName});


ModelPost.fromMap(Map<String, dynamic> map){
  nome_grupo = map['nome_grupo'];
  apelido = map['apelido'];
  data = map['data'];
  link_grupo = map['link_grupo'];
  descricao = map['descricao'];
  idUsuario = map['idUsuario'];
  imageUrl = map['imageUrl'];
  tagName = map['tagName'];


}

  Map<String,dynamic> toJson(){

  Map<String,dynamic> map = {};

  map['nome_grupo'] = nome_grupo;
  map['apelido'] = apelido;
  map['data'] = data;
  map['link_grupo'] = link_grupo;
  map['descricao']  = descricao; 
  map['idUsuario'] = idUsuario;
  map['imageUrl']  = imageUrl;
  map['tagName']  = tagName;

  return map;


}


}