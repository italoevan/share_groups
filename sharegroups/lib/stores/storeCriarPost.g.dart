// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storeCriarPost.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StoreCriarPost on _StoreCriarPost, Store {
  Computed<bool> _$nomeGrupoComputedComputed;

  @override
  bool get nomeGrupoComputed => (_$nomeGrupoComputedComputed ??= Computed<bool>(
          () => super.nomeGrupoComputed,
          name: '_StoreCriarPost.nomeGrupoComputed'))
      .value;
  Computed<bool> _$linkGrupoComputedComputed;

  @override
  bool get linkGrupoComputed => (_$linkGrupoComputedComputed ??= Computed<bool>(
          () => super.linkGrupoComputed,
          name: '_StoreCriarPost.linkGrupoComputed'))
      .value;
  Computed<bool> _$descricaoComputedComputed;

  @override
  bool get descricaoComputed => (_$descricaoComputedComputed ??= Computed<bool>(
          () => super.descricaoComputed,
          name: '_StoreCriarPost.descricaoComputed'))
      .value;
  Computed<bool> _$doneComputed;

  @override
  bool get done => (_$doneComputed ??=
          Computed<bool>(() => super.done, name: '_StoreCriarPost.done'))
      .value;

  final _$nome_grupoAtom = Atom(name: '_StoreCriarPost.nome_grupo');

  @override
  String get nome_grupo {
    _$nome_grupoAtom.reportRead();
    return super.nome_grupo;
  }

  @override
  set nome_grupo(String value) {
    _$nome_grupoAtom.reportWrite(value, super.nome_grupo, () {
      super.nome_grupo = value;
    });
  }

  final _$dataAtom = Atom(name: '_StoreCriarPost.data');

  @override
  String get data {
    _$dataAtom.reportRead();
    return super.data;
  }

  @override
  set data(String value) {
    _$dataAtom.reportWrite(value, super.data, () {
      super.data = value;
    });
  }

  final _$link_grupoAtom = Atom(name: '_StoreCriarPost.link_grupo');

  @override
  String get link_grupo {
    _$link_grupoAtom.reportRead();
    return super.link_grupo;
  }

  @override
  set link_grupo(String value) {
    _$link_grupoAtom.reportWrite(value, super.link_grupo, () {
      super.link_grupo = value;
    });
  }

  final _$descricaoAtom = Atom(name: '_StoreCriarPost.descricao');

  @override
  String get descricao {
    _$descricaoAtom.reportRead();
    return super.descricao;
  }

  @override
  set descricao(String value) {
    _$descricaoAtom.reportWrite(value, super.descricao, () {
      super.descricao = value;
    });
  }

  final _$carregandoAtom = Atom(name: '_StoreCriarPost.carregando');

  @override
  bool get carregando {
    _$carregandoAtom.reportRead();
    return super.carregando;
  }

  @override
  set carregando(bool value) {
    _$carregandoAtom.reportWrite(value, super.carregando, () {
      super.carregando = value;
    });
  }

  final _$_StoreCriarPostActionController =
      ActionController(name: '_StoreCriarPost');

  @override
  void setNome_grupo(String value) {
    final _$actionInfo = _$_StoreCriarPostActionController.startAction(
        name: '_StoreCriarPost.setNome_grupo');
    try {
      return super.setNome_grupo(value);
    } finally {
      _$_StoreCriarPostActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setData(String value) {
    final _$actionInfo = _$_StoreCriarPostActionController.startAction(
        name: '_StoreCriarPost.setData');
    try {
      return super.setData(value);
    } finally {
      _$_StoreCriarPostActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLink_grupo(String value) {
    final _$actionInfo = _$_StoreCriarPostActionController.startAction(
        name: '_StoreCriarPost.setLink_grupo');
    try {
      return super.setLink_grupo(value);
    } finally {
      _$_StoreCriarPostActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDescricao(String value) {
    final _$actionInfo = _$_StoreCriarPostActionController.startAction(
        name: '_StoreCriarPost.setDescricao');
    try {
      return super.setDescricao(value);
    } finally {
      _$_StoreCriarPostActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeBool() {
    final _$actionInfo = _$_StoreCriarPostActionController.startAction(
        name: '_StoreCriarPost.changeBool');
    try {
      return super.changeBool();
    } finally {
      _$_StoreCriarPostActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
nome_grupo: ${nome_grupo},
data: ${data},
link_grupo: ${link_grupo},
descricao: ${descricao},
carregando: ${carregando},
nomeGrupoComputed: ${nomeGrupoComputed},
linkGrupoComputed: ${linkGrupoComputed},
descricaoComputed: ${descricaoComputed},
done: ${done}
    ''';
  }
}
