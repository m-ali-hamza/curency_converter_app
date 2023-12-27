import 'dart:convert';

import 'package:currency_convert_app/models/currecies_model.dart';
import 'package:currency_convert_app/models/currency_rates_model.dart';
import 'package:currency_convert_app/utils/api_key.dart';
import "package:http/http.dart" as http;

Future<CurrencyRatesModel> fetchRates() async {
  try {
    String url = "https://openexchangerates.org/api/latest.json?app_id=$apiKey";
    final data = await http.get(Uri.parse(url));
    final result = jsonDecode(data.body);

    return CurrencyRatesModel.fromJson(result);
  } catch (e) {
    throw Exception(e);
  }
}

Future<Map<String, dynamic>> fetchCurrencies() async {
  try {
    String url = "https://openexchangerates.org/api/currencies.json";
    final data = await http.get(Uri.parse(url));
    final result = jsonDecode(data.body);
    return result;
  } catch (e) {
    throw Exception(e);
  }
}

double usdToAnyCurrency(double value, double rate) {
  if (value != 0.0) {
    double result = value * rate;
    return double.parse(result.toStringAsFixed(2));
  }

  return 0.0;
}

double anyToAnyCurrency(double value, double baseRate, double targetRate) {
  if (value != 0.0) {
    double result = value * (targetRate / baseRate);
    return double.parse(result.toStringAsFixed(2));
  }

  return 0.0;
}
