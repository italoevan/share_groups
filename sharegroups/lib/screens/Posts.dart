import 'package:flutter/material.dart';
import 'package:sharegroups/models/ModelPost.dart';

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
        title: Text(widget.modelPost.nome_grupo),
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
              Text(widget.modelPost.descricao, style: TextStyle(fontSize: 30, color: Colors.white),textAlign: TextAlign.center,)


            ],
          )
        ],
      ),
    );
  }
}
