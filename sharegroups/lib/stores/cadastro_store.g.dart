// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadastro_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CadastroStore on _CadastroStore, Store {
  Computed<bool> _$doneComputed;

  @override
  bool get done => (_$doneComputed ??=
          Computed<bool>(() => super.done, name: '_CadastroStore.done'))
      .value;

  final _$emailAtom = Atom(name: '_CadastroStore.email');

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

  final _$apelidoAtom = Atom(name: '_CadastroStore.apelido');

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

  final _$idAtom = Atom(name: '_CadastroStore.id');

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

  final _$senhaAtom = Atom(name: '_CadastroStore.senha');

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

  final _$visibleAtom = Atom(name: '_CadastroStore.visible');

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

  final _$_CadastroStoreActionController =
      ActionController(name: '_CadastroStore');

  @override
  void setEmail(String em) {
    final _$actionInfo = _$_CadastroStoreActionController.startAction(
        name: '_CadastroStore.setEmail');
    try {
      return super.setEmail(em);
    } finally {
      _$_CadastroStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setApelido(String ap) {
    final _$actionInfo = _$_CadastroStoreActionController.startAction(
        name: '_CadastroStore.setApelido');
    try {
      return super.setApelido(ap);
    } finally {
      _$_CadastroStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setId(String i) {
    final _$actionInfo = _$_CadastroStoreActionController.startAction(
        name: '_CadastroStore.setId');
    try {
      return super.setId(i);
    } finally {
      _$_CadastroStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSenha(String sh) {
    final _$actionInfo = _$_CadastroStoreActionController.startAction(
        name: '_CadastroStore.setSenha');
    try {
      return super.setSenha(sh);
    } finally {
      _$_CadastroStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeVisible() {
    final _$actionInfo = _$_CadastroStoreActionController.startAction(
        name: '_CadastroStore.changeVisible');
    try {
      return super.changeVisible();
    } finally {
      _$_CadastroStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
apelido: ${apelido},
id: ${id},
senha: ${senha},
visible: ${visible},
done: ${done}
    ''';
  }
}
