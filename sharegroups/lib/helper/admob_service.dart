import 'dart:io';

import 'package:firebase_admob/firebase_admob.dart';


class AdmobService{

 
MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
  keywords: <String>['whatsapp','Twitter','Facebook','Instagram','TikTok','Kwai','Grupos'],
  contentUrl: 'https://flutter.io',

  childDirected: false,
  // or MobileAdGender.female, MobileAdGender.unknown
  testDevices: <String>['4C2E4D6952A11D6203FD3B49B74EC151'], // Android emulators are considered test devices
);


  // Sample AdMob app ID: ca-app-pub-3940256099942544~3347511713
  String getAdmobAppId(){
  
 

      return "ca-app-pub-6321157595470088~7927317631";
    

  }


  //ca-app-pub-3940256099942544/6300978111
  String getBannerId(){
       

      return "ca-app-pub-6321157595470088/7735745946";
    
  
  }
  //ca-app-pub-3940256099942544/1033173712
  String getInterstitialAdUnitId() {
 if(Platform.isAndroid){
   return 'ca-app-pub-6321157595470088/8823512623';
 }
  return null;
}

}