// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storeGeral.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StoreGeral on _StoreGeral, Store {
  final _$emailAtom = Atom(name: '_StoreGeral.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$apelidoAtom = Atom(name: '_StoreGeral.apelido');

  @override
  String get apelido {
    _$apelidoAtom.reportRead();
    return super.apelido;
  }

  @override
  set apelido(String value) {
    _$apelidoAtom.reportWrite(value, super.apelido, () {
      super.apelido = value;
    });
  }

  final _$idAtom = Atom(name: '_StoreGeral.id');

  @override
  String get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(String value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  final _$carregandoGeralAtom = Atom(name: '_StoreGeral.carregandoGeral');

  @override
  bool get carregandoGeral {
    _$carregandoGeralAtom.reportRead();
    return super.carregandoGeral;
  }

  @override
  set carregandoGeral(bool value) {
    _$carregandoGeralAtom.reportWrite(value, super.carregandoGeral, () {
      super.carregandoGeral = value;
    });
  }

  final _$_StoreGeralActionController = ActionController(name: '_StoreGeral');

  @override
  void setemail(dynamic em) {
    final _$actionInfo =
        _$_StoreGeralActionController.startAction(name: '_StoreGeral.setemail');
    try {
      return super.setemail(em);
    } finally {
      _$_StoreGeralActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setApelido(dynamic ap) {
    final _$actionInfo = _$_StoreGeralActionController.startAction(
        name: '_StoreGeral.setApelido');
    try {
      return super.setApelido(ap);
    } finally {
      _$_StoreGeralActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setId(dynamic i) {
    final _$actionInfo =
        _$_StoreGeralActionController.startAction(name: '_StoreGeral.setId');
    try {
      return super.setId(i);
    } finally {
      _$_StoreGeralActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeCarregandoGeral() {
    final _$actionInfo = _$_StoreGeralActionController.startAction(
        name: '_StoreGeral.changeCarregandoGeral');
    try {
      return super.changeCarregandoGeral();
    } finally {
      _$_StoreGeralActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
apelido: ${apelido},
id: ${id},
carregandoGeral: ${carregandoGeral}
    ''';
  }
}
