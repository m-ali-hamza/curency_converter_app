import 'package:currency_convert_app/functions/fetch_rates.dart';
import 'package:flutter/material.dart';

class UsdToAny extends StatefulWidget {
  Map<String, dynamic> rates;
  UsdToAny({super.key, required this.rates});

  @override
  State<UsdToAny> createState() => _UsdToAnyState();
}

class _UsdToAnyState extends State<UsdToAny> {
  TextEditingController usdController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String dropdownValue = "PKR";

  double usdAmount = 0.0;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: height / 60, vertical: height / 60),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text("USD to Any Currency",
                  style: TextStyle(
                      color: Colors.grey.shade300,
                      fontWeight: FontWeight.bold,
                      fontSize: 18)),
            ),
            SizedBox(
              height: height / 50,
            ),
            TextFormField(
              controller: usdController,
              keyboardType: TextInputType.number,
              style: TextStyle(
                  color: Colors.grey.shade300, fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                hintText: "USD",
                prefixIcon: Icon(
                  Icons.attach_money,
                  color: Colors.grey.shade300,
                ),
                fillColor: Colors.grey.shade600,
                filled: true,
                hintStyle: TextStyle(
                    color: Colors.grey.shade300, fontWeight: FontWeight.bold),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10)),
              ),
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Amount';
                }
                return null;
              },
            ),
            SizedBox(
              height: height / 30,
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: DropdownButton(
                      borderRadius: BorderRadius.circular(10),
                      dropdownColor: Colors.grey.shade900,
                      isExpanded: true,
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.grey.shade300,
                      ),
                      style: TextStyle(
                          color: Colors.grey.shade300,
                          fontWeight: FontWeight.bold),
                      iconSize: width / 13,
                      value: dropdownValue,
                      items: widget.rates.keys
                          .toList()
                          .map<DropdownMenuItem<String>>((value) {
                        return DropdownMenuItem<String>(
                            value: value, child: Text(value));
                      }).toList(),
                      onChanged: (value) {
                        dropdownValue = value!;
                        setState(() {});
                      },
                    ),
                  ),
                ),
                FilledButton(
                    onPressed: () {
                      //form validation
                      if (!_formKey.currentState!.validate()) {
                        return;
                      } else {
                        usdAmount = usdToAnyCurrency(
                            double.parse(usdController.text),
                            widget.rates[dropdownValue]!);
                        setState(() {});
                      }
                    },
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.grey.shade600,
                      foregroundColor: Colors.grey.shade300,
                    ),
                    child: const Text("Convert"))
              ],
            ),
            SizedBox(
              height: height / 100,
            ),
            Text(
              "1 USD = ${double.parse(widget.rates[dropdownValue].toStringAsFixed(2))} $dropdownValue",
              style: TextStyle(
                  color: Colors.grey.shade300,
                  fontWeight: FontWeight.bold,
                  fontSize: 12),
            ),
            SizedBox(
              height: height / 100,
            ),
            Text(
              "Converted Amount",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: Colors.grey.shade300,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            Text(
              "${usdController.text} * ${double.parse(widget.rates[dropdownValue].toStringAsFixed(2))} = $usdAmount $dropdownValue",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: Colors.grey.shade300,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
