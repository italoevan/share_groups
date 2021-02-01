import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:sharegroups/models/ModelPost.dart';
import 'package:sharegroups/screens/Home.dart';
import 'package:sharegroups/stores/storeCriarPost.dart';
import 'package:sharegroups/stores/storeGeral.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class CriarPost extends StatefulWidget {
  String tagname;
  CriarPost(this.tagname);

  @override
  _CriarPostState createState() => _CriarPostState();
}

class _CriarPostState extends State<CriarPost> {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  StoreGeral storeGeral;
  StoreCriarPost storeCriarPost = StoreCriarPost();
  ModelPost post;
  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  
  //image
  File _image;
  final picker = ImagePicker();
  


  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    storeGeral = Provider.of<StoreGeral>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      appBar: AppBar(
        title: Text("Criar Post em ${widget.tagname}"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            color: Theme.of(context).primaryColor,
          ),
          Observer(
            builder: (context) {
              return Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                          errorText: storeCriarPost.nomeGrupoComputed
                              ? null
                              : "O nome do grupo tem que ter entre 5 e 17 letras.",
                          fillColor: Colors.white,
                          filled: true,
                          labelText: "Nome do Grupo"),
                      onChanged: storeCriarPost.setNome_grupo,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          errorText: storeCriarPost.linkGrupoComputed
                              ? null
                              : "O link não pode estar vazio.",
                          fillColor: Colors.white,
                          filled: true,
                          labelText: "Link do grupo"),
                      onChanged: storeCriarPost.setLink_grupo,
                    ),
                    TextField(
                      keyboardType: TextInputType.multiline,
                      maxLines: 8,
                      decoration: InputDecoration(
                          errorText: storeCriarPost.descricaoComputed
                              ? null
                              : "A descrição tem que ter entre 20 e 88 caracteres.",
                          filled: true,
                          fillColor: Colors.white,
                          labelText: "Descricao"),
                      onChanged: storeCriarPost.setDescricao,
                    ),
                    RaisedButton(
                        onPressed: getImage, child: Text("Escolher foto")),
                    RaisedButton(
                      onPressed: storeCriarPost.done
                          ? () {
                              storeCriarPost.changeBool();
                              uploadImagem().then((url) {
                              
                               
                                Postar(context,url);

                              });
                            }
                          : () {},
                      child: Text("Salvar"),
                    ),
                    _image != null ? Image.file(_image) : Container(),
                    storeCriarPost.carregando
                        ? CircularProgressIndicator()
                        : Container()
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }

  void Postar(BuildContext context,String iurl) {
    var mapPost = ModelPost(
            nome_grupo: storeCriarPost.nome_grupo,
            apelido: storeGeral.apelido,
            data: SalvarData(),
            link_grupo: storeCriarPost.link_grupo,
            descricao: storeCriarPost.descricao,
            email: storeGeral.email,
            idUsuario: storeGeral.id,
            imageUrl: iurl,
            tagName: widget.tagname
            )
        .toJson();
    String date = SalvarData();
    firestore
        .collection('posts')
        .doc(widget.tagname)
        .collection('lista')
        .doc(date)
        .set(mapPost)
        .then((value) {
      postagensGeral(mapPost,date);
      storeCriarPost.changeBool();
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => Home()), (route) => false);
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Container(
                  child: Text(
                      "Concluido, agora espere a moderação verificar se seu grupo cumpre com os requisitos necessários.")),
            );
          });
    });
  }

  void postagensGeral(Map<String, dynamic> model,String idUnico){
    firestore.collection('postagensGeral').doc(idUnico).set(model);

  }

  String SalvarData() {
    String date = Timestamp.now().toString();
    return date;
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future<String> uploadImagem() async {
    var data;
    data = Timestamp.now();
    FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    var raiz =  firebaseStorage.ref();
    var arquivo =
        raiz.child('imagePosts/${storeGeral.id}/${data}').putFile(_image);

        //recuperar 
         String url = await (await arquivo).ref.getDownloadURL();
          
          print("URL: " + url.toString());
         return url;

  }

 

  
}
