import 'dart:convert';

import 'package:first_app/screens/payment.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class GoldBuyScreen extends StatefulWidget {
  const GoldBuyScreen({super.key});

  @override
  State<GoldBuyScreen> createState() {
    return _GoldBuyScreenState();
  }
}

class _GoldBuyScreenState extends State<GoldBuyScreen> {
  // Form controllers
  final apiUrl = 'https://www.goldapi.io/api/XAU/INR';
  String goldPrice = 'Loading...';
  double numericGoldPrice = 0.0;
  int selectedIndex = 4;

  final amountController = TextEditingController();
  final quantityController = TextEditingController();
  final amountFocus = FocusNode();
  final quantityFocus = FocusNode();

  @override
  void dispose() {
    amountController.dispose();
    quantityController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    getGoldPrice();
    super.initState();

    amountController.addListener(() {
      final text = amountController.text;

      if (!amountFocus.hasFocus) {
        return;
      }

      if (text.isNotEmpty) {
        final amount = double.parse(text);
        quantityController.text =
            (amount / numericGoldPrice).toStringAsFixed(2);
      }
    });

    quantityController.addListener(() {
      final text = quantityController.text;

      if (!quantityFocus.hasFocus) {
        return;
      }

      if (text.isNotEmpty) {
        final quantity = double.parse(text);
        amountController.text =
            (quantity * numericGoldPrice).toStringAsFixed(2);
      }
    });
  }

  Future<void> getGoldPrice() async {
    var headers = {'x-access-token': 'goldapi-jl5orllpjzg1a-io'};
    var request =
        http.Request('GET', Uri.parse('https://www.goldapi.io/api/XAU/INR'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(await response.stream.bytesToString());

      final unformattedPrice = jsonData['price_gram_24k'];
      final price = NumberFormat.currency(locale: 'en_IN', symbol: '')
          .format(unformattedPrice);

      setState(() {
        goldPrice = '₹ $price/gm';
        numericGoldPrice = unformattedPrice;
      });
    } else {
      print(response.reasonPhrase);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Buy Gold"),
        leading: const BackButton(),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            "Live Prices",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF676028),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Colors.yellow[600]!,
                width: 2,
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      goldPrice,
                      style: TextStyle(
                        color: Colors.yellow[600],
                        fontSize: 36,
                      ),
                    ),
                    const Text(
                      " + 3% GST",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 8), // spacing

                const Text(
                  "Gold Rates expires in 5 minutes",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            "Enter Amount or Quantity",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: TextField(
                  focusNode: amountFocus,
                  controller: amountController,
                  decoration: InputDecoration(
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    hintText: "Rs. 100",
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: TextField(
                  focusNode: quantityFocus,
                  controller: quantityController,
                  decoration: InputDecoration(
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    hintText: "0.10 g",
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Text(
            "Quick Buy",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: ToggleButtons(
              borderColor: Colors.yellow[600],
              fillColor: Colors.yellow[600],
              borderWidth: 2,
              selectedBorderColor: Colors.yellow[600],
              selectedColor: Colors.black,
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
              onPressed: (int index) {
                setState(() {
                  selectedIndex = index;
                });

                switch (index) {
                  case 0:
                    amountController.text = "100";
                    break;
                  case 1:
                    amountController.text = "500";
                    break;
                  case 2:
                    quantityController.text = "0.5";
                    break;
                  case 3:
                    quantityController.text = "1.0";
                    break;
                }
              },
              isSelected: [
                selectedIndex == 0,
                selectedIndex == 1,
                selectedIndex == 2,
                selectedIndex == 3,
              ],
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text("₹100"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text("₹500"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text("0.5 g"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text("1.0 g"),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => PaymentScreen(
                  price: double.parse(numericGoldPrice.toStringAsFixed(2)),
                  amount: double.parse(amountController.text),
                ),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFF0E47C),
            padding: const EdgeInsets.all(16),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(26)),
            foregroundColor: Colors.black,
            textStyle: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          child: const Text("Buy Now"),
        ),
      ),
    );
  }
}
