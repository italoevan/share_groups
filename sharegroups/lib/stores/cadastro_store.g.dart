// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadastro_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CadastroStore on _CadastroStore, Store {
  Computed<bool> _$emailComputedComputed;

  @override
  bool get emailComputed =>
      (_$emailComputedComputed ??= Computed<bool>(() => super.emailComputed,
              name: '_CadastroStore.emailComputed'))
          .value;
  Computed<bool> _$apelidoComputedComputed;

  @override
  bool get apelidoComputed =>
      (_$apelidoComputedComputed ??= Computed<bool>(() => super.apelidoComputed,
              name: '_CadastroStore.apelidoComputed'))
          .value;
  Computed<bool> _$senhaComputedComputed;

  @override
  bool get senhaComputed =>
      (_$senhaComputedComputed ??= Computed<bool>(() => super.senhaComputed,
              name: '_CadastroStore.senhaComputed'))
          .value;
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

  final _$erroAtom = Atom(name: '_CadastroStore.erro');

  @override
  String get erro {
    _$erroAtom.reportRead();
    return super.erro;
  }

  @override
  set erro(String value) {
    _$erroAtom.reportWrite(value, super.erro, () {
      super.erro = value;
    });
  }

  final _$carregandoCadastroAtom =
      Atom(name: '_CadastroStore.carregandoCadastro');

  @override
  bool get carregandoCadastro {
    _$carregandoCadastroAtom.reportRead();
    return super.carregandoCadastro;
  }

  @override
  set carregandoCadastro(bool value) {
    _$carregandoCadastroAtom.reportWrite(value, super.carregandoCadastro, () {
      super.carregandoCadastro = value;
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
  void setErro(String value) {
    final _$actionInfo = _$_CadastroStoreActionController.startAction(
        name: '_CadastroStore.setErro');
    try {
      return super.setErro(value);
    } finally {
      _$_CadastroStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeCarregandoCadastro() {
    final _$actionInfo = _$_CadastroStoreActionController.startAction(
        name: '_CadastroStore.changeCarregandoCadastro');
    try {
      return super.changeCarregandoCadastro();
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
erro: ${erro},
carregandoCadastro: ${carregandoCadastro},
emailComputed: ${emailComputed},
apelidoComputed: ${apelidoComputed},
senhaComputed: ${senhaComputed},
done: ${done}
    ''';
  }
}
