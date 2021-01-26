import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:sharegroups/helper/FireHelper.dart';
import 'package:sharegroups/stores/login_store.dart';

class Autenticacao {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  bool usuarioLogado(FirebaseAuth auth) {
    if (auth.currentUser != null) {
      return true;
    } else {
      return false;
    }
  }

  static void CadastrarUsuario(FirebaseFirestore firestore, FirebaseAuth auth,
      String email, String senha, String apelido, BuildContext context) {
    String erro;
    auth
        .createUserWithEmailAndPassword(email: email, password: senha)
        .then((value) {
      print("Email: ${email} Senha: ${senha}");
      FireHelper.SalvarBancoDeDados(firestore,
          firstCollection: 'usuarios',
          id: value.user.uid,
          apelido: apelido,
          email: email);
      Navigator.pushNamedAndRemoveUntil(
          context, '/home', (Route<dynamic> route) => false);
    })
          ..catchError((error) {
            erro = error.toString();
            print(erro);
          });
  }

  static void LogarUsuario(FirebaseAuth auth, String email, String senha,
      BuildContext context, LoginStore loginStore) {
    String erro;
    loginStore.changeCarregando();
    auth
        .signInWithEmailAndPassword(email: email, password: senha)
        .then((value) {
      Navigator.pushNamedAndRemoveUntil(
          context, '/home', (Route<dynamic> route) => false);
    }).catchError((error) {
      loginStore.changeCarregando();
      erro = error.toString();
      loginStore.setErro(erro);
      print(erro);
    });
  }
}
