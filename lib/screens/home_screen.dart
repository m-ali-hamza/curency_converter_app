import 'package:currency_convert_app/components/any_to_any.dart';
import 'package:currency_convert_app/components/usd_to_any.dart';
import 'package:currency_convert_app/functions/fetch_rates.dart';
import 'package:currency_convert_app/models/currecies_model.dart';
import 'package:currency_convert_app/models/currency_rates_model.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<CurrencyRatesModel> result;
  // late Map<String, String> currencies;
  @override
  void initState() {
    super.initState();
    result = fetchRates();
    // currencies = fetchCurrencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        iconTheme: IconThemeData(color: Colors.grey.shade300),
        title: Text(
          'Convert Currencies',
          style: TextStyle(
            color: Colors.grey.shade300, // Set the color to your desired color
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),
          FutureBuilder<CurrencyRatesModel>(
            future: result,
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child: CircularProgressIndicator(
                  color: Colors.grey.shade300,
                ));
              } else if (snapshot.hasError) {
                return Center(
                    child: Column(
                  children: [
                    Icon(
                      Icons.error,
                      size: 70,
                      color: Colors.grey.shade300,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextButton(
                        onPressed: () {
                          setState(() {});
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.grey.shade300,
                        ),
                        child: const Text("Click to Retry"))
                  ],
                ));
              } else {
                return Column(children: [
                  UsdToAny(rates: snapshot.data!.rates),
                  const SizedBox(
                    height: 30,
                  ),
                  AnyToAny(rates: snapshot.data!.rates),
                ]);
              }
            }),
          ),
        ],
      )),
    );
  }
}
