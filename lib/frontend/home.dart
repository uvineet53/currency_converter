import 'package:currency_converter/backend/models/currencyModel.dart';
import 'package:currency_converter/backend/services/currencyService.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final amountController = TextEditingController();
  String result = '0.00';
  CurrencyModel currencyModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: 18,
          ),
          shrinkWrap: true,
          children: [
            Text(
              "INR",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
            Text(
              "$result",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.green,
                fontSize: 70,
                fontWeight: FontWeight.w500,
                letterSpacing: 1,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: amountController,
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 20,
                  letterSpacing: 1,
                  fontWeight: FontWeight.bold,
                ),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  icon: Text(
                    "\$",
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  hintText: "Amount in USD",
                  hintStyle: TextStyle(color: Colors.grey[600]),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green[700],
              ),
              child: IconButton(
                onPressed: () async {
                  currencyModel = await CurrencyService()
                      .getCurrency(amountController.text);
                  if (currencyModel != null) {
                    setState(() {
                      result = currencyModel.rates.inr.toString();
                    });
                  }
                },
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
