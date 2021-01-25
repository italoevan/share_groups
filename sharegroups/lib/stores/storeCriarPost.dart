import 'package:mobx/mobx.dart';
part 'storeCriarPost.g.dart';

class StoreCriarPost = _StoreCriarPost with _$StoreCriarPost;

abstract class _StoreCriarPost with Store {
  @observable
  String nome_grupo = "";

  @action
  void setNome_grupo(String value) => nome_grupo = value;

  @observable
  String data = "";

  @action
  void setData(String value) => data = value;

  @observable
  String link_grupo = "";

  @action
  void setLink_grupo(String value)=>link_grupo = value;


  @observable
  String descricao = "";

  @action
  void setDescricao(String value)=>descricao = value;

  @observable
  bool carregando = false;

  @action
  void changeBool() => carregando = !carregando;


  @computed
  bool get done => nome_grupo.length >5 && nome_grupo.length < 15 && descricao.length > 20 && descricao.length < 88 && link_grupo.isNotEmpty;
}
