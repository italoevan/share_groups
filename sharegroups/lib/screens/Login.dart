import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:sharegroups/helper/autenticacao.dart';
import 'package:sharegroups/stores/login_store.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  LoginStore loginStore;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    loginStore = Provider.of<LoginStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            color:  Theme.of(context).primaryColor,
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Observer(
                  builder: (_) {
                    return TextField(
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: "Email"),
                      onChanged: loginStore.setEmail,
                    );
                  },
                ),
                Observer(builder: (_) {
                  return TextField(
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                            icon: Icon(
                              Icons.remove_red_eye_sharp,
                              color: Colors.grey,
                            ),
                            onPressed: () {}),
                        filled: true,
                        fillColor: Colors.white,
                        labelText: "Senha"),
                    onChanged: loginStore.setSenha,
                  );
                }),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 45,
                      child: RaisedButton(
                        onPressed: () {
                          Autenticacao.LogarUsuario(auth, loginStore.email,
                              loginStore.senha, context);
                          print(loginStore.email);
                        },
                        child: Text("Logar"),
                      ),
                    ),
                    SizedBox(
                      height: 45,
                      child: RaisedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/cadastro');
                          },
                          child: Text("Cadastrar")),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
