import 'package:flutter/material.dart';
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
      appBar: AppBar(
        title: Text(widget.modelPost.nome_grupo.toUpperCase()),
        elevation: 0,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            color: Theme.of(context).primaryColor,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: EdgeInsets.all(12),
                height: height / 1.8,
                width: width,
                child: Card(
                    elevation: 16,
                    shadowColor: Colors.green,
                    color: Color(0xff404040),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          widget.modelPost.nome_grupo.toUpperCase(),
                          style: TextStyle(color: Colors.white, fontSize: 30),
                          textAlign: TextAlign.center,
                        ),
                        Divider(),
                        Container(
                          padding: EdgeInsets.all(12),
                          height: 200,
                          child: Text(
                            widget.modelPost.descricao,
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        ),
                        Divider()
                      ],
                    )),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, left: 5, right: 5),
                child: SizedBox(
                  height: height / 15,
                  child: RaisedButton(
                    color: Colors.green[600],
                    onPressed: () {
                      _launchURL();
                    },
                    child: Text("Entrar", style: TextStyle(fontSize: 30,color: Colors.white),),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, left: 5, right: 5),
                child: SizedBox(
                  height: height / 15,
                  child: RaisedButton(
                    color: Colors.red[900],
                    onPressed: () {},
                    child: Text("REPORTAR", style: TextStyle(fontSize: 30,color: Colors.white),),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
  _launchURL() async {
    String url = widget.modelPost.link_grupo;
    if (await canLaunch('https://chat.whatsapp.com/'+url)) {
      await launch('https://chat.whatsapp.com/'+url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
