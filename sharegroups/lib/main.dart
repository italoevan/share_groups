import 'package:admob_flutter/admob_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sharegroups/Routes.dart';
import 'package:sharegroups/helper/autenticacao.dart';
import 'package:sharegroups/screens/Home.dart';
import 'package:sharegroups/screens/Login.dart';
import 'package:sharegroups/stores/cadastro_store.dart';
import 'package:sharegroups/stores/login_store.dart';
import 'package:sharegroups/stores/storeGeral.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await firebase_core.Firebase.initializeApp();
  Admob.initialize(testDeviceIds: [
    '6BD0295466E5EAB65344AF3C3F7BDA6B',
    '4C2E4D6952A11D6203FD3B49B74EC151'
  ]);

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
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
        title: 'Share Groups',
        home: autenticacao.usuarioLogado(auth) ? Home() : Login(),
        routes: Routes().routes,
        theme: ThemeData(
            primaryColor: Color(0xff121212), accentColor: Color(0xff404040)),
      ),
    );
  }
}
