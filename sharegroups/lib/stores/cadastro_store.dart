import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

part 'cadastro_store.g.dart';

class CadastroStore = _CadastroStore with _$CadastroStore;

abstract class _CadastroStore with Store {
  @observable
  String email = "";

  @action
  void setEmail(String em) => email = em;

  @observable
  String apelido = "";

  @action
  void setApelido(String ap) => apelido = ap;

  @observable
  String id = "";

  @action
  void setId(String i) => id = i;

  @observable
  String senha = "";

  @action
  void setSenha(String sh) => senha = sh;

  @observable
  bool visible = false;

  @action
  void changeVisible() => visible = !visible;

  @computed
  bool get done => email.length > 6 && apelido.length > 5 && senha.length > 5;
}
