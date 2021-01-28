import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:sharegroups/models/ModelPost.dart';
import 'package:sharegroups/screens/Home.dart';
import 'package:sharegroups/stores/storeCriarPost.dart';
import 'package:sharegroups/stores/storeGeral.dart';

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
                          fillColor: Colors.white,
                          filled: true,
                          labelText: "Nome do Grupo"),
                      onChanged: storeCriarPost.setNome_grupo,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          labelText: "Link do grupo"),
                      onChanged: storeCriarPost.setLink_grupo,
                    ),
                    TextField(
                      keyboardType: TextInputType.multiline,
                      maxLines: 8,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: "Descricao"),
                      onChanged: storeCriarPost.setDescricao,
                    ),
                    RaisedButton(
                      onPressed: storeCriarPost.done
                          ? () {
                              storeCriarPost.changeBool();
                              Postar(context);
                            }
                          : null,
                      child: Text("Salvar"),
                    ),
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

  void Postar(BuildContext context) {
    var value = ModelPost(
      nome_grupo: storeCriarPost.nome_grupo,
      apelido: storeGeral.apelido,
      data: SalvarData(),
      link_grupo: storeCriarPost.link_grupo,
      descricao: storeCriarPost.descricao,
      email: storeGeral.email,
      idUsuario: storeGeral.id
    ).toJson();

    firestore
        .collection('posts')
        .doc(widget.tagname)
        .collection('lista')
        .doc(SalvarData())
        .set(value)
        .then((value) {
          storeCriarPost.changeBool();
          Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => Home()), (route) => false);
          return showDialog(context: context, builder: (context){
            return AlertDialog(
              content: Container(child:Text("Concluido, agora espere a moderação verificar se seu grupo cumpre com os requisitos necessários.")),
              
            );
          });
    });
  }

  String SalvarData() {
    String date = Timestamp.now().toString();
    return date;
  }
}
