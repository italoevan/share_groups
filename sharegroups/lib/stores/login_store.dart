import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  @observable
  String email = "";

  @action
  void setEmail(String em) {
    email = em;
  }

  @observable
  String senha = "";

  @action
  void setSenha(String sn) {
    senha = sn;
  }

  @observable
  bool visible = false;

  @action
  void changeVisible() => visible = !visible;

  @observable
  bool carregando = false;

  @action
  void changeCarregando()=> carregando = !carregando;

  @observable
  String erro = "";

  @action
  void setErro(value) => erro = value;
}
