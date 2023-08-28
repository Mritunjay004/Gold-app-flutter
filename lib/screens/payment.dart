import 'dart:async';

import 'package:flutter/material.dart';
import 'package:first_app/widgets/success.dart';

class PaymentScreen extends StatefulWidget {
  final double amount;
  final double price;

  const PaymentScreen({
    Key? key,
    required this.amount,
    required this.price,
  }) : super(key: key);

  @override
  State<PaymentScreen> createState() {
    return _PaymentScreenState();
  }
}

class _PaymentScreenState extends State<PaymentScreen> {
  int _timeRemaining = 300; // 5 minutes

  double get quantity => widget.amount / widget.price;

  @override
  void initState() {
    super.initState();

    // Start timer
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_timeRemaining > 0) {
          _timeRemaining--;
        } else {
          timer.cancel();
          // Timeout action
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment Preview"),
        leading: const BackButton(),
      ),
      body: Column(
        children: [
          // Progress bar
          SizedBox(
            height: 48,
            child: Stack(
              children: [
                LinearProgressIndicator(
                  value: _timeRemaining / 300,
                  backgroundColor: Colors.grey[300],
                  valueColor: AlwaysStoppedAnimation(Colors.yellow[700]!),
                  minHeight: 40,
                ),
                Center(
                  child: Text(
                    "₹${widget.price}  |  Valid for ${_timeRemaining ~/ 60} minutes and ${_timeRemaining % 60} seconds",
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),

          // Payment details
          Container(
            margin: const EdgeInsets.all(32),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(color: Colors.yellow[800]!, width: 2),
                borderRadius: BorderRadius.circular(8)),
            child: Column(
              children: [
                // Header
                Row(
                  children: [
                    Icon(Icons.payment, color: Colors.yellow[800]),
                    const SizedBox(width: 12),
                    Text(
                      "Payment Breakdown",
                      style: TextStyle(
                          color: Colors.yellow[800],
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),

                // Details
                Text(
                  "Price per gram: ${widget.price}",
                  style: const TextStyle(color: Colors.white),
                ),

                Text("Grams: ${quantity.toStringAsFixed(2)}",
                    style: const TextStyle(color: Colors.white)),

                Text("Total amount: ${widget.amount}",
                    style: const TextStyle(color: Colors.white)),

                Text("3% GST: ${0.03 * widget.amount}",
                    style: const TextStyle(color: Colors.white)),
                const Divider(),

                Text(
                  "Final amount: ₹${1.03 * widget.amount}",
                  style: TextStyle(
                      color: Colors.yellow[800],
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),

          // Spacer
          const Spacer(),

          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.security,
                  color: Colors.green[700],
                ),
                const SizedBox(width: 8),
                Text(
                  "100% Safe and Secure",
                  style: TextStyle(
                    color: Colors.green[700],
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => SuccessWidget(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.yellow[800],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.all(16),
            ),
            child: const SizedBox(
              width: double.infinity,
              child: Text(
                "PAY NOW",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
