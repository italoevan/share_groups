// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginStore on _LoginStore, Store {
  final _$emailAtom = Atom(name: '_LoginStore.email');

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

  final _$senhaAtom = Atom(name: '_LoginStore.senha');

  @override
  String get senha {
    _$senhaAtom.reportRead();
    return super.senha;
  }

  @override
  set senha(String value) {
    _$senhaAtom.reportWrite(value, super.senha, () {
      super.senha = value;
    });
  }

  final _$visibleAtom = Atom(name: '_LoginStore.visible');

  @override
  bool get visible {
    _$visibleAtom.reportRead();
    return super.visible;
  }

  @override
  set visible(bool value) {
    _$visibleAtom.reportWrite(value, super.visible, () {
      super.visible = value;
    });
  }

  final _$_LoginStoreActionController = ActionController(name: '_LoginStore');

  @override
  void setEmail(String em) {
    final _$actionInfo =
        _$_LoginStoreActionController.startAction(name: '_LoginStore.setEmail');
    try {
      return super.setEmail(em);
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSenha(String sn) {
    final _$actionInfo =
        _$_LoginStoreActionController.startAction(name: '_LoginStore.setSenha');
    try {
      return super.setSenha(sn);
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeVisible() {
    final _$actionInfo = _$_LoginStoreActionController.startAction(
        name: '_LoginStore.changeVisible');
    try {
      return super.changeVisible();
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
senha: ${senha},
visible: ${visible}
    ''';
  }
}
