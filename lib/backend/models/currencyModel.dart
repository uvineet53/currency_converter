import 'ratesModel.dart';

class CurrencyModel {
  CurrencyModel({
    this.amount,
    this.base,
    this.rates,
  });

  double amount;
  String base;
  Rates rates;

  factory CurrencyModel.fromJson(Map<String, dynamic> json) => CurrencyModel(
        amount: json["amount"],
        base: json['base'],
        rates: Rates.fromJson(json['rates']),
      );
}
