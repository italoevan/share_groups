import 'package:admob_flutter/admob_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sharegroups/helper/admob_service.dart';
import 'package:sharegroups/models/ModelPost.dart';
import 'package:url_launcher/url_launcher.dart';

class Posts extends StatefulWidget {
  ModelPost modelPost;
  String tagName;
  Posts(this.modelPost, this.tagName);

  @override
  _PostsState createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  //ads
  AdmobService ams = AdmobService();

  @override
  void initState() {
    // TODO: implement initState
    print("Posts()");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: key,
      body: Stack(
        children: [
          Container(color: Theme.of(context).primaryColor),
          SingleChildScrollView(
              child: Container(
            height: height,
            width: width,
            child: SafeArea(
              child: Container(
                child: SingleChildScrollView(
                    child: Container(
                        child: Column(
                  children: [
                    Container(
                      width: width,
                      height: height / 2.5,
                      child: Image.network(
                        widget.modelPost.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Divider(
                      color: Colors.transparent,
                    ),
                    Text(
                      widget.modelPost.nome_grupo.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'PottaOne',
                          color: Colors.white),
                    ),
                    Divider(color: Colors.white),
                    Container(
                      padding: EdgeInsets.all(12),
                      child: Text(widget.modelPost.descricao,
                          style: TextStyle(color: Colors.white, fontSize: 23)),
                    ),
                    Divider(color: Colors.white),
                    Padding(
                        padding: EdgeInsets.only(top: 20, left: 5, right: 5),
                        child: SizedBox(
                          height: height / 15,
                          width: width,
                          child: RaisedButton(
                            color: Colors.green[600],
                            onPressed: () {
                              _launchUrl();
                            },
                            child: Text(
                              "JOIN",
                              style:
                                  TextStyle(fontSize: 30, color: Colors.white),
                            ),
                          ),
                        )),
                    Padding(
                      padding: EdgeInsets.only(top: 20, left: 5, right: 5),
                      child: SizedBox(
                        width: width,
                        height: height / 15,
                        child: RaisedButton(
                          color: Colors.red[900],
                          onPressed: () async {
                            reportar(height, firestore);
                          },
                          child: Text(
                            "Report",
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ))),
              ),
            ),
          )),
          Positioned(
              left: 12,
              top: 40,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 55,
                  width: 55,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(200)),
                  child: Center(
                    child: Icon(
                      Icons.arrow_back_ios_outlined,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                ),
              )),
          Positioned(
              right: 12,
              top: 45,
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(12)),
                child: Text(
                  widget.tagName.toUpperCase(),
                  style:
                      TextStyle(color: Colors.white, fontFamily: 'AlmondCream'),
                ),
              ))
        ],
      ),
      bottomNavigationBar: Container(
        color: Theme.of(context).primaryColor,
        child: AdmobBanner(
          adUnitId: ams.getBannerId(),
          adSize: AdmobBannerSize.BANNER,
        ),
      ),
    );
  }


  _launchUrl() async {
    String url = widget.modelPost.link_grupo;
    if (await canLaunch('https://chat.whatsapp.com/' + url)) {
      await launch('https://chat.whatsapp.com/' + url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void reportar(double height, FirebaseFirestore firestore) {
    showDialog(
        context: key.currentState.context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              backgroundColor: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(23))),
              title: Container(
                child: Text(
                  'What\'s the problem?',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'PottaOne'),
                ),
              ),
              content: Container(
                height: height / 2.8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                        maxLength: 40,
                        style: TextStyle(color: Colors.white),
                        autofocus: true,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Theme.of(context).primaryColor)),
                    SizedBox(
                      height: 50,
                      child: RaisedButton(
                          child: Text("Send",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 30)),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          color: Colors.red,
                          onPressed: () {
                            var mapPost = ModelPost(
                                    nome_grupo: widget.modelPost.nome_grupo,
                                    apelido: widget.modelPost.apelido,
                                    data: widget.modelPost.data,
                                    link_grupo: widget.modelPost.link_grupo,
                                    descricao: widget.modelPost.descricao,
                                    idUsuario: widget.modelPost.idUsuario,
                                    tagName: widget.tagName)
                                .toJson();

                            firestore
                                .collection('reports')
                                .doc(widget.modelPost.data)
                                .set(mapPost)
                                .then((value) {
                              Navigator.pop(context);
                              key.currentState.showSnackBar(SnackBar(
                                content: Text("Report sent."),
                              ));
                            });
                          }),
                    )
                  ],
                ),
              ),
            );
          });
        });
  }
}
