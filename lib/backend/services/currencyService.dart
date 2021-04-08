import 'package:currency_converter/backend/models/currencyModel.dart';
import 'package:dio/dio.dart';

class CurrencyService {
  Future<CurrencyModel> getCurrency(String amount) async {
    String url =
        "https://api.frankfurter.app/latest?amount=$amount&from=USD&to=INR";

    try {
      var response = await Dio().get(url);
      print(response.data.toString());
      return CurrencyModel.fromJson(response.data);
    } catch (e) {
      print("Exception Occurred!");
      return null;
    }
  }
}
