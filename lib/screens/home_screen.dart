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
        title: const Text(
          "Curency Converter",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: FutureBuilder<CurrencyRatesModel>(
        future: result,
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
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
      )),
    );
  }
}
