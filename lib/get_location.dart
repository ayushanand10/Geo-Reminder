import 'package:geolocator/geolocator.dart';
import 'package:get_location/get_notification.dart';
import 'main.dart';
import 'distance.dart';

void getLocation(Place place) async {
  var position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);
  print(position.latitude);
  print(position.longitude);
  print(place.latitude);
  print(place.longitude);
  print("Reminder is ${reminderOn}");

  double d = distance(
      position.latitude, position.longitude, place.latitude, place.longitude);

  print("Remaining Distance = ${d}");

  if (d <= place.radius) {
    reminderOn = false;
  }
}
