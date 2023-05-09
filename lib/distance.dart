import 'dart:math';

const pi = 3.141592653589;

double toRadians(double degree) {
  double oneDeg = pi / 180;
  return (oneDeg * degree);
}

double distance(double lat1, double long1, double lat2, double long2) {
  // Convert the latitudes
  // and longitudes
  // from degree to radians.
  lat1 = toRadians(lat1);
  long1 = toRadians(long1);
  lat2 = toRadians(lat2);
  long2 = toRadians(long2);

  double? dlong;
  double? dlat;
  // Haversine Formula`1
  dlong = long2 - long1;
  dlat = lat2 - lat1;

  double ans =
      pow(sin(dlat / 2), 2) + cos(lat1) * cos(lat2) * pow(sin(dlong / 2), 2);

  ans = 2 * asin(sqrt(ans));

  // Radius of Earth in
  // Kilometers, R = 6371
  // Use R = 3956 for miles
  double R = 6371;

  // Calculate the result
  ans = ans * R * 1000;

  return ans;
}

class Place {
  String name;
  double latitude;
  double longitude;
  double radius;

  Place(this.name, this.latitude, this.longitude, this.radius);

  @override
  String toString() {
    return '{ ${this.name}, ${this.longitude}, ${this.latitude} }';
  }
}
