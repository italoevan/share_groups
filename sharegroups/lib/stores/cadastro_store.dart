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
  bool get emailComputed=> email.length >10 && email.length < 26;

  @computed
  bool get apelidoComputed =>apelido.length > 3 && apelido.length < 12;

  @computed
  bool get senhaComputed => senha.length > 3 && senha.length < 10;

  @computed
  bool get done => emailComputed && apelidoComputed;

  @observable
  String erro = "";

  @action
  void setErro(String value) =>erro=value;

  @observable
  bool carregando = false;

  @action
  void changeCarregando()=> carregando = !carregando;



}
