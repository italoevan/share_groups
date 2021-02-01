import 'package:admob_flutter/admob_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sharegroups/helper/admob_service.dart';
import 'package:sharegroups/models/ModelPost.dart';
import 'package:sharegroups/screens/CriarPost.dart';
import 'package:sharegroups/screens/Posts.dart';
import 'package:sharegroups/stores/storeGeral.dart';
import 'package:sharegroups/widgets/tiles/ListaDeGruposTile.dart';

class ListaDeGrupos extends StatefulWidget {
  String nomeTag;
  List<QueryDocumentSnapshot> querySnapshot = [];
  String img;
  ListaDeGrupos(this.nomeTag, this.querySnapshot, this.img);
  @override
  _ListaDeGruposState createState() => _ListaDeGruposState();
}

class _ListaDeGruposState extends State<ListaDeGrupos> {
  List<QueryDocumentSnapshot> data;
  ModelPost postGeral;
  StoreGeral storeGeral;
  AdmobService ams = AdmobService();

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    storeGeral = Provider.of<StoreGeral>(context);
  
  }

  @override
  void initState() {
    // TODO: implement initState
    print("ListaDeGrupos()");
    super.initState();
    data = widget.querySnapshot;
   
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: widget.img != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${widget.nomeTag.toUpperCase()}"),
                  SizedBox(
                    width: 10,
                  ),
                  Image.network(
                    widget.img,
                    height: 30,
                    width: 30,
                  )
                ],
              )
            : Text("${widget.nomeTag.toUpperCase()}"),
        centerTitle: true,
        elevation: 0,
        actions: [
          Row(
            children: [
              IconButton(
                  icon: Icon(
                    Icons.add,
                    size: 40,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CriarPost(widget.nomeTag)));
                  }),
              SizedBox(
                width: 5,
              )
            ],
          )
        ],
      ),
      body: widget.querySnapshot.length != 0
          ? Column(children: [
            Container(
              height: height * 0.8,
              child: ListView.builder(
              itemBuilder: (context, i) {
                return GestureDetector(
                    onTap: () {
                      Map<String, dynamic> map = {
                        'nome_grupo': data[i].data()['nome_grupo'],
                        'apelido': data[i].data()['apelido'],
                        'data': data[i].data()['data'],
                        'link_grupo': data[i].data()['link_grupo'],
                        'descricao': data[i].data()['descricao'],
                        'idUsuario': data[i].data()['idUsuario'],
                        'imageUrl': data[i].data()['imageUrl']
                      };

                      ModelPost post = ModelPost.fromMap(map);
                      postGeral = post;

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Posts(post, widget.nomeTag)));
                    },
                    child: ListaDeGruposTile(data[i])
                    /*
                Text(data[i].data()['nome_grupo'], style: TextStyle(color: Colors.white),), //

                 */

                    );
              },
              itemCount: data.length),
            ),
             Expanded(child:Container(
               width: width,
                child: AdmobBanner(adSize:AdmobBannerSize.FULL_BANNER,adUnitId: ams.getBannerId())
              ))
          ],)
          : Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      'https://firebasestorage.googleapis.com/v0/b/share-groups-3e88d.appspot.com/o/box.png?alt=media&token=1397e512-cd6f-4870-a1c0-4eba58f99d3c',
                      fit: BoxFit.cover,
                      height: 110,
                      width: 110,
                    ),
                    Text(
                      "Não encontramos nada aqui...Ainda.",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
    );
  }


  
}
