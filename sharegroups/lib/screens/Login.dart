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
  LoginStore loginStore = LoginStore();
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Theme.of(context).primaryColor,
          ),
          Align(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child:  Container(
              padding: EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
                  TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        filled: true,
                        fillColor: Colors.white,
                        labelText: "Email"),
                    onChanged: loginStore.setEmail,
                  ),
                  Divider(
                    height: 6,
                  ),
                  Observer(builder: (_) {
                    return TextField(
                      obscureText: !loginStore.visible,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: IconButton(
                              icon: loginStore.visible
                                  ? Icon(
                                      Icons.remove_red_eye_sharp,
                                      color: Colors.red,
                                    )
                                  : Icon(
                                      Icons.remove_red_eye_sharp,
                                      color: Colors.grey,
                                    ),
                              onPressed: () {
                                loginStore.changeVisible();
                              }),
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
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          color: Colors.blue,
                          onPressed: () {
                            FocusScope.of(context).requestFocus(FocusNode());
                            Autenticacao.LogarUsuario(auth, loginStore.email,
                                loginStore.senha, context, loginStore);

                            print(loginStore.email);
                          },
                          child: Text(
                            "Logar",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 45,
                        child: RaisedButton(
                            color: Colors.green,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            onPressed: () {
                              Navigator.pushNamed(context, '/cadastro');
                            },
                            child: Text("Cadastrar",
                                style: TextStyle(color: Colors.white))),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Observer(builder: (_) {
                    return loginStore.carregandoLogin
                        ? CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.green),
                          )
                        : Container();
                  }),
                  Observer(
                    builder: (_) {
                      return Text(
                        loginStore.erro,
                        style: TextStyle(color: Colors.red, fontSize: 22),
                      );
                    },
                  )
                ],
              ),
            ),
            ),
          )
        ],
      ),
    );
  }
}
