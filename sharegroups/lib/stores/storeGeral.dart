import 'package:mobx/mobx.dart';
part 'storeGeral.g.dart';

class StoreGeral = _StoreGeral with _$StoreGeral;

abstract class _StoreGeral with Store {

  
  /*Email, Apelido, id,  */

  /* Email */
  @observable
  String email = "";

  @action
  void setemail(em) => email = em;

  /*Apelido */
  @observable
  String apelido = "";

  @action
  void setApelido(ap) => apelido = ap;

  /*Id */

  @observable
  String id = "";

  @action
  void setId(i) => id = i;


  @observable
  bool carregandoGeral = false;

  @action
  void carregandoGeralToTrue()=> carregandoGeral = true;

  @action
  void carregandoGeralToFalse()=> carregandoGeral = false;

  @action
  void changeCarregandoGeral()=> carregandoGeral = !carregandoGeral;

}
