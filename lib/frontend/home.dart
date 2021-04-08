import 'package:currency_converter/backend/models/currencyModel.dart';
import 'package:currency_converter/backend/services/currencyService.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final amountController = TextEditingController();
  String result = '';
  CurrencyModel currencyModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Currency Converter"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 18,
        ),
        shrinkWrap: true,
        children: [
          TextField(
            controller: amountController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: "Amount in USD",
            ),
          ),
          SizedBox(
            height: 10,
          ),
          MaterialButton(
            color: Colors.blue,
            onPressed: () async {
              currencyModel =
                  await CurrencyService().getCurrency(amountController.text);
              if (currencyModel != null) {
                setState(() {
                  result = currencyModel.rates.inr.toString();
                });
              }
            },
            child: Text(
              "Convert",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            result,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
