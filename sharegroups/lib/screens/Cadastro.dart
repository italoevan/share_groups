import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:sharegroups/helper/autenticacao.dart';

import 'package:sharegroups/stores/cadastro_store.dart';
import 'package:sharegroups/stores/storeCriarPost.dart';

class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  CadastroStore cadastroStore;
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    cadastroStore = Provider.of<CadastroStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            color: Color(0xff121212),
          ),
          SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                Container(
                  height: 190,
                  child: Center(
                    child: Text(
                      'SHARE\n GROUPS',
                      style: TextStyle(
                          fontSize: 45,
                          fontFamily: 'AlmondCream',
                          color: Colors.green),
                    ),
                  ),
                ),
                Container(
                  child: Observer(
                    builder: (context) {
                      return Column(
                        children: [
                          TextField(
                            decoration: InputDecoration(
                                errorText: cadastroStore.emailComputed
                                    ? null
                                    : "Minimum of 10 letters, maximum of 26",
                                filled: true,
                                fillColor: Colors.white,
                                labelText: "Email"),
                            onChanged: cadastroStore.setEmail,
                          ),
                          Divider(
                            height: 6,
                          ),
                          TextField(
                            decoration: InputDecoration(
                                errorText: cadastroStore.apelidoComputed
                                    ? null
                                    : "Minimum of 3 letters, maximum of 12.",
                                filled: true,
                                fillColor: Colors.white,
                                labelText: "Nickname"),
                            onChanged: cadastroStore.setApelido,
                          ),
                          Divider(
                            height: 6,
                          ),
                          TextField(
                            decoration: InputDecoration(
                                errorText: cadastroStore.senhaComputed
                                    ? null
                                    : "Minimum of 3 letters, maximum of 10.",
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
                                labelText: "Password"),
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
                    builder: (_) {
                      return RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        color: Colors.blue,
                        onPressed: cadastroStore.done
                            ? () {
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                                Autenticacao.CadastrarUsuario(
                                    cadastroStore,
                                    firestore,
                                    auth,
                                    cadastroStore.email,
                                    cadastroStore.senha,
                                    cadastroStore.apelido,
                                    context);
                              }
                            : () {
                                key.currentState.showSnackBar(SnackBar(
                                    content: Text(
                                        "Error.")));
                              },
                        child: Text("Sign up",
                            style: TextStyle(color: Colors.white)),
                      );
                    },
                  ),
                ),
                Divider(
                  color: Colors.transparent,
                ),
                Observer(
                  builder: (_) => cadastroStore.carregandoCadastro
                      ? CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.green),)
                      : Container(),
                ),
                Observer(
                  builder: (_) {
                    return Text(
                      "${cadastroStore.erro}",
                      style: TextStyle(fontSize: 25, color: Colors.red),
                    );
                  },
                )
              ],
            ),
          ))
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
