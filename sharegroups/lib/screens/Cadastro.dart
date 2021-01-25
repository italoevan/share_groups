import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:sharegroups/helper/autenticacao.dart';

import 'package:sharegroups/stores/cadastro_store.dart';

class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  CadastroStore cadastroStore;
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    cadastroStore = Provider.of<CadastroStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            color: Color(0xff121212),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                Container(
                  child: Observer(
                    builder: (context) {
                      return Column(
                        children: [
                          TextField(
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                labelText: "Email"),
                            onChanged: cadastroStore.setEmail,
                          ),
                          TextField(
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                labelText: "Apelido"),
                            onChanged: cadastroStore.setApelido,
                          ),
                          TextField(
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                    icon: Icon(
                                      Icons.remove_red_eye_sharp,
                                      color: cadastroStore.visible
                                          ? Colors.red
                                          : Colors.grey,
                                    ),
                                    onPressed: cadastroStore.changeVisible),
                                filled: true,
                                fillColor: Colors.white,
                                labelText: "Senha"),
                            obscureText: !cadastroStore.visible,
                            onChanged: cadastroStore.setSenha,
                          )
                        ],
                      );
                    },
                  ),
                ),
                Divider(
                  height: 30,
                  color: Colors.transparent,
                ),
                SizedBox(
                  height: 45,
                  child: Observer(
                    builder: (context) {
                      return RaisedButton(
                        onPressed: cadastroStore.done
                            ? () {
                                Autenticacao.CadastrarUsuario(firestore,auth, cadastroStore.email, cadastroStore.senha,cadastroStore.apelido, context);
                              }
                            : null,
                        child: Text("Cadastrar"),
                      );
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
  /*
  void logarUsuario() {
    String erro;
    auth
        .createUserWithEmailAndPassword(
            email: cadastroStore.email, password: cadastroStore.senha)
        .catchError((error) {
      erro = error.toString();
    }).then((value) {
      print("Email: ${cadastroStore.email} Senha: ${cadastroStore.senha}");
      Navigator.pushNamedAndRemoveUntil(context, '/home',(Route<dynamic> route) => false);
    });
  }


   */
}
