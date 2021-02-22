import 'dart:io';



class AdmobService{

 



  // Sample AdMob app ID: ca-app-pub-3940256099942544~3347511713
  String getAdmobAppId(){
  
 

      return "ca-app-pub-6321157595470088~7927317631";
    

  }

  String getRewardBasedVideoAdUnitId(){

    return 'ca-app-pub-6321157595470088/2526148260';
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