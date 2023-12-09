import 'package:geolocator/geolocator.dart';



class ControllGps{

  Future<Position> determinarPosicion() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    // ? verfica el estado de la conceccion
    if(permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();
    }else{
      if(permission == LocationPermission.denied){
        return Future.error("erroo");
      }
    }
    return await Geolocator.getCurrentPosition();
  }

}