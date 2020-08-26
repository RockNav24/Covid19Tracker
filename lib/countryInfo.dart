import 'networking.dart';

const String APIKEY = 'FAH2GC1iOpmrr4MW1c2OIKnGXavW9VYH';
const String URL =
    'http://open.mapquestapi.com/geocoding/v1/reverse?key=$APIKEY';

class CountryInfo {
  String countryCode;

  Future<String> getCountryCode(double latitude, double longitude) async {
    String newUrl =
        '$URL&location=${latitude.toString()},${longitude.toString()}&includeRoadMetadata=true&includeNearestIntersection=true';
    Networking networking = Networking(url: newUrl);
    var jsonData = await networking.getResponse();

    //print(jsonData['results'][0]['locations'][0]['adminArea1']);
    return jsonData['results'][0]['locations'][0]['adminArea1'];
  }
}
