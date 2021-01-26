import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sharegroups/Routes.dart';
import 'package:sharegroups/helper/autenticacao.dart';
import 'package:sharegroups/screens/Home.dart';
import 'package:sharegroups/screens/Login.dart';
import 'package:sharegroups/stores/cadastro_store.dart';
import 'package:sharegroups/stores/login_store.dart';
import 'package:sharegroups/stores/storeGeral.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(FirstScreen());
}

class FirstScreen extends StatelessWidget {
  Autenticacao autenticacao = Autenticacao();
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<CadastroStore>(
          create: (_) => CadastroStore(),
        ),
        Provider<StoreGeral>(
          create: (_) => StoreGeral(),
        )
      ],
      child: MaterialApp(
        home: autenticacao.usuarioLogado(auth) ? Home() : Login(),
        routes: Routes().routes,
        theme: ThemeData(
            primaryColor: Color(0xff121212), accentColor: Color(0xff404040)),
      ),
    );
  }
}
