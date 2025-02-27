import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import '../../error/failure.dart';

class LocationManager{

 Future<Either<Failure,Position>> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return left(LocationDisabledFailure());
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return left(LocationDisabledFailure());
      }
    }

    if (permission == LocationPermission.deniedForever) {

      return left(LocationDisabledFailure());
    }

    return  right(await Geolocator.getCurrentPosition()) ;
  }
}