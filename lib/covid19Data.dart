import 'networking.dart';

class CovidData {
  static const String COUNTRY_NAME = 'name';
  static const String LATEST_DATA = 'latest_data';
  static const String LATEST_CONFIRMED = 'confirmed';
  static const String LATEST_DEATHS = 'deaths';
  static const String LATEST_RECOVERED = 'recovered';
  static const String URL = 'https://corona-api.com/countries';

  List allCountries;

  Future<dynamic> getData() async {
    Networking networking = Networking(url: URL);
    var data = await networking.getResponse();
    allCountries = data['data'];
    return allCountries;
  }

  String riskLevel(int deaths) {
    if (deaths < 100) {
      return 'Low';
    } else if (deaths > 100 && deaths < 1000) {
      return 'Medium';
    } else if (deaths > 1000 && deaths < 10000) {
      return 'High';
    } else {
      return 'Very Risky';
    }
  }
}
