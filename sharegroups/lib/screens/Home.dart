import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sharegroups/helper/FireHelper.dart';
import 'package:sharegroups/models/Usuario.dart';
import 'package:sharegroups/stores/cadastro_store.dart';
import 'package:sharegroups/stores/storeGeral.dart';
import 'package:sharegroups/widgets/CustomDrawer.dart';
import 'package:sharegroups/widgets/tiles/HomeTile.dart';

import 'ListaDeGrupos.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Usuario fireHelper;
  StoreGeral storeGeral;
  Usuario usuario = Usuario();
  List<DocumentSnapshot> documents;
  String imagemTile;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    storeGeral = Provider.of<StoreGeral>(context);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Home()");
    waitFire().then((value) {
      usuario = value;
      storeGeral.setApelido(usuario.apelido);
      storeGeral.setemail(usuario.email);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                auth.signOut().then((value) {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/login', (route) => false);
                });
              })
        ],
      ),
      body: Stack(
        children: [
          Container(color: Theme.of(context).primaryColor),
          FutureBuilder(
              future: getTiles(firestore).then((value) => documents = value),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                      child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                  ));
                } else {
                  return ListView.builder(
                    itemCount: documents.length,
                    itemBuilder: (context, i) {
                      return GestureDetector(
                          onTap: () {

                            getDisponiveis(i).then((value) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ListaDeGrupos(
                                          documents[i].id.toString(),
                                          value,
                                          documents[i]
                                              .data()['img']
                                              .toString())));
                            });
                          },
                          child: HomeTile(documents[i].id.toString(), context,
                              documents[i].data()['img'])
                          /*
                        Text(
                          documents[i].id.toString(),
                          style: TextStyle(color: Colors.white),
                        ),

                         */
                          );
                    },
                  );
                }
              })
        ],
      ),
    );
  }

  Future waitFire() async {
    fireHelper = await FireHelper.dadosToStoreGeral(auth, firestore);
    usuario = fireHelper;
    return usuario;
  }

  static Future<List<DocumentSnapshot>> getTiles(
      FirebaseFirestore firestore) async {
    QuerySnapshot querySnapshot = await firestore.collection('posts').get();

    List<DocumentSnapshot> list = querySnapshot.docs;

    return list;
  }

  Future<QuerySnapshot> getDisponiveis(int i) async {

    QuerySnapshot finalSnapshot ;
    QuerySnapshot snapshot = await firestore
        .collection('posts')
        .doc("${documents[i].id.toString()}")
        .collection('lista')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        if(element.data()['disponivel'] != null){
          /*element.data().
          finalSnapshot =
          
           */

        }else{

        }
      });
    });
    return finalSnapshot;

  }

  Future<QuerySnapshot> getQuerySnapshot(int i) async {
    QuerySnapshot querySnapshot = await firestore
        .collection('posts')
        .doc("${documents[i].id.toString()}")
        .collection('lista')
        .orderBy('data', descending: true)
        .limit(30)
        .get();
    return querySnapshot;
  }

  Future<String> getImagemTile({int i}) async {
    DocumentSnapshot documentSnapshot = await firestore
        .collection('posts')
        .doc("${documents[i].id.toString()}")
        .get();
    String img = documentSnapshot.data()['img'];
    imagemTile = img;
    return img;
  }
}
