

import 'package:flutter/material.dart';
import 'package:sharegroups/screens/Cadastro.dart';
import 'package:sharegroups/screens/Home.dart';
import 'package:sharegroups/screens/Login.dart';

class Routes{

  Map<String, Widget Function(BuildContext context)> routes = {
    '/cadastro' : (context)=>Cadastro(),
    '/home' : (context) =>Home(),
    '/login' : (context) =>Login()

  };
}