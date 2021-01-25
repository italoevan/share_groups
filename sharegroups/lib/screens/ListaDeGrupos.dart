import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sharegroups/models/ModelPost.dart';
import 'package:sharegroups/screens/CriarPost.dart';
import 'package:sharegroups/screens/Posts.dart';
import 'package:sharegroups/widgets/tiles/ListaDeGruposTile.dart';

class ListaDeGrupos extends StatefulWidget {
  String nomeTag;
  QuerySnapshot querySnapshot;
  String img;
  ListaDeGrupos(this.nomeTag, this.querySnapshot, this.img);
  @override
  _ListaDeGruposState createState() => _ListaDeGruposState();
}

class _ListaDeGruposState extends State<ListaDeGrupos> {
  List<QueryDocumentSnapshot> data;
  ModelPost postGeral;

  @override
  void initState() {
    // TODO: implement initState
    print("ListaDeGrupos()");
    super.initState();
    data = widget.querySnapshot.docs;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          title: widget.img != null ? Row(mainAxisAlignment: MainAxisAlignment.center,children: [Text("${widget.nomeTag.toUpperCase()}"), SizedBox(width: 10,),Image.network(widget.img,height: 30, width: 30,)],) : Text("${widget.nomeTag.toUpperCase()}") ,
          centerTitle: true,
          elevation: 0,
        ),
        body: ListView.separated(itemBuilder:(context,i){
              return GestureDetector(
                onTap: (){

                  Map<String,dynamic> map = {
                    'nome_grupo' : data[i].data()['nome_grupo'],
                    'apelido' : data[i].data()['apelido'],
                    'data' :data[i].data()['data'],
                    'link_grupo' : data[i].data()['link_grupo'],
                    'descricao' : data[i].data()['descricao']
                  };

                 ModelPost post = ModelPost.fromMap(map);
                  postGeral = post;


                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Posts(post,widget.nomeTag)));
                },
                child:Text(data[i].data()['nome_grupo'], style: TextStyle(color: Colors.white),), //ListaDeGruposTile(postGeral,i)

              );


        }, separatorBuilder: (context,i)=> Divider(), itemCount: data.length),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>CriarPost(widget.nomeTag)));
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
