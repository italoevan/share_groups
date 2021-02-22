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
        title: Text("Create post on ${widget.tagname}"),
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
              return SingleChildScrollView(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        decoration: InputDecoration(
                            errorText: storeCriarPost.nomeGrupoComputed
                                ? null
                                : "The group name must be between 5 and 17 letters.",
                            fillColor: Colors.white,
                            filled: true,
                            labelText: "Group's name"),
                        onChanged: storeCriarPost.setNome_grupo,
                      ),
                      TextField(
                        decoration: InputDecoration(
                            errorText: storeCriarPost.linkGrupoComputed
                                ? null
                                : "The link must not be empty.",
                            fillColor: Colors.white,
                            filled: true,
                            labelText: "Group link"),
                        onChanged: storeCriarPost.setLink_grupo,
                      ),
                      TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: 8,
                        decoration: InputDecoration(
                            errorText: storeCriarPost.descricaoComputed
                                ? null
                                : "The description must be between 20 and 88 characters long.",
                            filled: true,
                            fillColor: Colors.white,
                            labelText: "Description"),
                        onChanged: storeCriarPost.setDescricao,
                      ),
                      Divider(
                        color: Colors.transparent,
                      ),
                      SizedBox(
                        height: 45,
                        child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            color: Colors.green,
                            onPressed: getImage,
                            child: Text("Choose Photo",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20))),
                      ),
                      Divider(color: Colors.transparent),
                      SizedBox(
                        height: 45,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          color:
                              storeCriarPost.done ? Colors.blue : Colors.black,
                          onPressed: storeCriarPost.done
                              ? () {
                                  storeCriarPost.carregando
                                      ? () {}
                                      : storeCriarPost.changeBool();
                                  uploadImagem().then((url) {
                                    Postar(context, url);
                                  });
                                  ;
                                }
                              : () {
                                  key.currentState.showSnackBar(
                                      SnackBar(content: Text("Error.")));
                                },
                          child: Text("Create",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                        ),
                      ),
                      Divider(),
                      _image != null
                          ? Image.file(
                              _image,
                              height: 150,
                              width: 200,
                            )
                          : Container(),
                      storeCriarPost.carregando
                          ? CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(Colors.green),
                            )
                          : Container()
                    ],
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }

  void Postar(BuildContext context, String iurl) {
    var mapPost = ModelPost(
            nome_grupo: storeCriarPost.nome_grupo,
            apelido: storeGeral.apelido,
            data: SalvarData(),
            link_grupo: storeCriarPost.link_grupo,
            descricao: storeCriarPost.descricao,
            email: storeGeral.email,
            idUsuario: storeGeral.id,
            imageUrl: iurl,
            tagName: widget.tagname)
        .toJson();
    String date = SalvarData();
    firestore
        .collection('posts')
        .doc(widget.tagname)
        .collection('lista')
        .doc(date)
        .set(mapPost)
        .then((value) {
      postagensGeral(mapPost, date);
      storeCriarPost.changeBool();
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => Home()), (route) => false);
      return showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return Observer(builder: (_) {
              return AlertDialog(
                actions: [
                  FlatButton(
                      onPressed: () {
                        storeGeral.carregandoGeralToFalse();
                        Navigator.pop(context);
                      },
                      child: Text("Close"))
                ],
                content: Container(
                    child: Text("Wait for your post to be approved.")),
              );
            });
          });
    });
  }

  void postagensGeral(Map<String, dynamic> model, String idUnico) {
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
        storeCriarPost.changeFoto();
      } else {
        print('No image selected.');
      }
    });
  }

  Future<String> uploadImagem() async {
    var data;
    data = Timestamp.now();
    FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    var raiz = firebaseStorage.ref();
    var arquivo =
        raiz.child('imagePosts/${storeGeral.id}/${data}').putFile(_image);

    //recuperar
    String url = await (await arquivo).ref.getDownloadURL();

    print("URL: " + url.toString());
    return url;
  }
}
