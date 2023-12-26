import 'package:currency_convert_app/functions/fetch_rates.dart';
import 'package:flutter/material.dart';

class AnyToAny extends StatefulWidget {
  Map<String, dynamic> rates;
  AnyToAny({super.key, required this.rates});

  @override
  State<AnyToAny> createState() => _AnyToAnyState();
}

class _AnyToAnyState extends State<AnyToAny> {
  TextEditingController controller = TextEditingController();

  String dropdownValue1 = "USD";
  String dropdownValue2 = "PKR";

  double amount1 = 0.0;
  double amount2 = 0.0;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    // controller.text = '0.0';
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: height / 60, vertical: height / 60),
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
            controller: controller,
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
                    value: dropdownValue1,
                    items: widget.rates.keys
                        .toList()
                        .map<DropdownMenuItem<String>>((value) {
                      return DropdownMenuItem<String>(
                          value: value, child: Text(value));
                    }).toList(),
                    onChanged: (value) {
                      dropdownValue1 = value!;
                      setState(() {});
                    },
                  ),
                ),
              ),
              Icon(
                Icons.currency_exchange,
                color: Colors.grey.shade300,
                size: 30,
              ),
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
                    value: dropdownValue2,
                    items: widget.rates.keys
                        .toList()
                        .map<DropdownMenuItem<String>>((value) {
                      return DropdownMenuItem<String>(
                          value: value, child: Text(value));
                    }).toList(),
                    onChanged: (value) {
                      dropdownValue2 = value!;
                      setState(() {});
                    },
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: FilledButton(
                    onPressed: () {
                      amount1 = anyToAnyCurrency(
                          double.parse(controller.text),
                          widget.rates[dropdownValue1]!,
                          widget.rates[dropdownValue2]!);
                      setState(() {});
                    },
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.grey.shade600,
                      foregroundColor: Colors.grey.shade300,
                    ),
                    child: const Text("Convert")),
              ),
            ],
          ),
          SizedBox(
            height: height / 100,
          ),
          Text(
            "1 $dropdownValue1 = ${(widget.rates[dropdownValue2]) / (widget.rates[dropdownValue1])} $dropdownValue2",
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
            "${controller.text} $dropdownValue1 * ${(widget.rates[dropdownValue2]) / (widget.rates[dropdownValue1])} $dropdownValue2 = $amount1 $dropdownValue2",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: Colors.grey.shade300,
                fontWeight: FontWeight.bold,
                fontSize: 16),
          )
        ],
      ),
    );
  }
}
