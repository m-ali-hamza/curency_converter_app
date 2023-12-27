import 'package:currency_convert_app/screens/currencies_list.dart';
import 'package:currency_convert_app/screens/currencies_rate.dart';
import 'package:currency_convert_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        title: Text(
          'Home',
          style: TextStyle(
            color: Colors.grey.shade300, // Set the color to your desired color
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            children: [
              ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                tileColor: Colors.grey.shade700,
                leading: Icon(
                  Icons.currency_yuan_sharp,
                  color: Colors.grey.shade300,
                ),
                title: Text(
                  'Currencies List',
                  style: TextStyle(
                    color: Colors
                        .grey.shade300, // Set the color to your desired color
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => CurrenciesList())));
                },
              ),
              SizedBox(height: 10),
              ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                tileColor: Colors.grey.shade700,
                leading: Icon(
                  Icons.currency_pound,
                  color: Colors.grey.shade300,
                ),
                title: Text(
                  'Currencies Rate',
                  style: TextStyle(
                    color: Colors
                        .grey.shade300, // Set the color to your desired color
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => CurrenciesRate())));
                },
              ),
              SizedBox(height: 10),
              ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                tileColor: Colors.grey.shade700,
                leading: Icon(
                  Icons.currency_exchange,
                  color: Colors.grey.shade300,
                ),
                title: Text(
                  'Convert Currencies',
                  style: TextStyle(
                    color: Colors
                        .grey.shade300, // Set the color to your desired color
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => HomeScreen())));
                },
              )
            ],
          )),
    );
  }
}
