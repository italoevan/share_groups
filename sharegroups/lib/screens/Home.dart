import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:sharegroups/helper/FireHelper.dart';
import 'package:sharegroups/helper/admob_service.dart';
import 'package:sharegroups/models/Usuario.dart';
import 'package:sharegroups/stores/cadastro_store.dart';
import 'package:sharegroups/stores/storeGeral.dart';
import 'package:sharegroups/widgets/CustomDrawer.dart';
import 'package:sharegroups/widgets/tiles/HomeTile.dart';
import 'package:sharegroups/models/ModelPost.dart';
import 'package:admob_flutter/admob_flutter.dart';



import 'ListaDeGrupos.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Usuario fireHelper;
  StoreGeral storeGeral;
  Usuario usuario = Usuario();
  List<DocumentSnapshot> documents;
  String imagemTile;
  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
   //ad
  AdmobService ams = AdmobService();
   AdmobInterstitial interstitialAd;

  

 

 

  //Animation
  bool animate = false;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    storeGeral = Provider.of<StoreGeral>(context);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
 
    //ad
      interstitialAd = AdmobInterstitial(
      adUnitId: ams.getInterstitialAdUnitId(),
      listener: (AdmobAdEvent event, Map<String, dynamic> args) {
        if (event == AdmobAdEvent.closed) interstitialAd.load();
        handleEvent(event, args, 'Interstitial');
      },
    );
     interstitialAd.load();



    //

    print("Home()");
    waitFire().then((value) {
      usuario = value;
      storeGeral.setApelido(usuario.apelido);
      storeGeral.setemail(usuario.email);
      storeGeral.setId(usuario.id);
      animar();
    });



 
  }

  @override
  void dispose() {
    // TODO: implement dispose
   
    super.dispose();
    interstitialAd.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      key: key,
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: AnimatedDefaultTextStyle(
          curve: Curves.elasticOut,
            style: animate
                ? TextStyle(color: Colors.green,fontSize: 18, fontFamily: 'AlmondCream')
                : TextStyle(color: Colors.white,fontSize: 8,fontFamily: 'AlmondCream'),
            duration: Duration(seconds: 2),
            child: Text("Share Groups".toUpperCase(), )),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                auth.signOut().then((value) {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/login', (route) => false);
                });
              })
        ],
      ),
      body: Stack(
        children: [
          Container(color: Theme.of(context).primaryColor),
          Column(
            children: [
              Container(
                height: height * 0.8,
                child: FutureBuilder(
              future: getTiles(firestore).then((value) => documents = value),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                      child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                  ));
                } else {
                  return ListView.builder(
                    itemCount: documents.length,
                    itemBuilder: (context, i) {
                      return GestureDetector(
                      
                          onTap: () {
                            storeGeral.carregandoGeral == true
                                ? () {}
                                : storeGeral.changeCarregandoGeral();
                              
                            print(storeGeral.carregandoGeral.toString());
                            getDisponiveis(i).then((value) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ListaDeGrupos(
                                          documents[i].id.toString(),
                                          value,
                                          documents[i]
                                              .data()['img']
                                              .toString()))).whenComplete(
                                  () => storeGeral.changeCarregandoGeral());
                            });
                             interstitialAd.show();
                          },
                          child: HomeTile(documents[i].id.toString(), context,
                              documents[i].data()['img'])
                          /*
                        Text(
                          documents[i].id.toString(),
                          style: TextStyle(color: Colors.white),
                        ),

                         */
                          );
                    },
                  );
                }
              }),
              ),
              Expanded(child:Container(
                width: width,
                child: AdmobBanner(adSize:AdmobBannerSize.FULL_BANNER,adUnitId: ams.getBannerId())
              ))
            ],
          ),
          Observer(builder: (context) {
            return Center(
                child: Container(
                    child: storeGeral.carregandoGeral
                        ? CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(Colors.red),
                          )
                        : Container(
                            width: 0,
                            height: 0,
                          )));
          }),
          
        ],
      ),
    );
  }

  Future waitFire() async {
    fireHelper = await FireHelper.dadosToStoreGeral(auth, firestore);
    usuario = fireHelper;
    return usuario;
  }

  static Future<List<DocumentSnapshot>> getTiles(
      FirebaseFirestore firestore) async {
    QuerySnapshot querySnapshot = await firestore.collection('posts').get();

    List<DocumentSnapshot> list = querySnapshot.docs;

    return list;
  }

  Future<List<QueryDocumentSnapshot>> getDisponiveis(int i) async {
    List<QueryDocumentSnapshot> filtered = [];

    QuerySnapshot querySnapshot = await firestore
        .collection('posts')
        .doc("${documents[i].id.toString()}")
        .collection('lista')
        .orderBy('data', descending: true)
        .limit(40)
        .where('disponivel', isNotEqualTo: null)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        if (element.data()['disponivel'] == true) {
          filtered.add(element);
        }
      });
    });

    return filtered;
  }

  Future<String> getImagemTile({int i}) async {
    DocumentSnapshot documentSnapshot = await firestore
        .collection('posts')
        .doc("${documents[i].id.toString()}")
        .get();
    String img = documentSnapshot.data()['img'];
    imagemTile = img;
    return img;
  }

  void animar() {
    setState(() {
      animate = true;
    });
  }
   void handleEvent(
      AdmobAdEvent event, Map<String, dynamic> args, String adType) {
    switch (event) {
      case AdmobAdEvent.loaded:
       print('New Admob $adType Ad loaded!');
        break;
      case AdmobAdEvent.opened:
        print('Admob $adType Ad opened!');
        break;
      case AdmobAdEvent.closed:
        print('Admob $adType Ad closed!');
        break;
      case AdmobAdEvent.failedToLoad:
        print('Admob $adType failed to load. :(');
        break;
      case AdmobAdEvent.rewarded:
       print('rewarded');
        break;
      default:
    }
  }
}
