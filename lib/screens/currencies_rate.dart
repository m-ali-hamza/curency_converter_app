import 'package:currency_convert_app/functions/fetch_rates.dart';
import 'package:flutter/material.dart';

class CurrenciesRate extends StatefulWidget {
  const CurrenciesRate({super.key});

  @override
  State<CurrenciesRate> createState() => _CurrenciesRateState();
}

class _CurrenciesRateState extends State<CurrenciesRate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        iconTheme: IconThemeData(color: Colors.grey.shade300),
        title: Text(
          'Currencies Rates',
          style: TextStyle(
            color: Colors.grey.shade300, // Set the color to your desired color
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: FutureBuilder(
              future: fetchRates(),
              builder: (context, snapshot) {
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
                  List data = snapshot.data!.rates.entries.toList();
                  return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        MapEntry<String, dynamic> entry = data[index];
                        String key = entry.key;
                        dynamic value = entry.value;
                        return Container(
                          margin: EdgeInsets.only(top: 5, bottom: 5),
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            tileColor: Colors.grey.shade700,
                            leading: Text(
                              key,
                              style: TextStyle(
                                color: Colors.grey
                                    .shade300, // Set the color to your desired color
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            title: Text(
                              value.toString(),
                              style: TextStyle(
                                color: Colors.grey
                                    .shade300, // Set the color to your desired color
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      });
                }
              })),
    );
  }
}
