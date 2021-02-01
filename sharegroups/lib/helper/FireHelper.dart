import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sharegroups/models/Usuario.dart';

class FireHelper {
  static Future SalvarBancoDeDados(FirebaseFirestore firestore,
      {@required String firstCollection,
      @required String id,
      @required String apelido,
      @required String email}) async {
    Map<String, dynamic> data = {'apelido': apelido, 'id': id, 'email': email};

    firestore.collection(firstCollection).doc(id).set(data);
  }

  static Future<Usuario> dadosToStoreGeral(
      FirebaseAuth auth, FirebaseFirestore firestore) async {
    DocumentSnapshot documentSnapshot = await firestore
        .collection('usuarios')
        .doc(auth.currentUser.uid.toString())
        .get();
    Map<String, dynamic> data = documentSnapshot.data();
    Usuario user = Usuario();

    user.email = data['email'];
    user.id = data['id'];
    user.apelido = data['apelido'];
    return user;
  }

}
