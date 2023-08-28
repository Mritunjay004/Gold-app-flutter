import 'package:first_app/screens/buy_main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:intl/intl.dart';

final theme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.black,
  colorScheme: const ColorScheme.dark(
    primary: Colors.black,
    secondary: Colors.yellow,
  ),
);

class GoldPriceApp extends StatefulWidget {
  const GoldPriceApp({super.key});

  @override
  State<GoldPriceApp> createState() => _GoldPriceAppState();
}

class _GoldPriceAppState extends State<GoldPriceApp> {
  String goldPrice = 'Loading...';

  final List<String> imgList = [
    'https://images.unsplash.com/photo-1515709969750-23a5a6b47a5e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1974&q=80',
    'https://images.unsplash.com/photo-1513666639414-f795d25747a8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1936&q=80',
    'https://images.unsplash.com/photo-1518674660708-0e2c0473e68e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8Z29sZCUyMGJsb2dzfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60',
  ];

  @override
  void initState() {
    super.initState();
    getGoldPrice();
  }

  final apiUrl = 'https://www.goldapi.io/api/XAU/INR';

  Future<void> getGoldPrice() async {
    var headers = {'x-access-token': 'goldapi-jl5orllpjzg1a-io'};
    var request =
        http.Request('GET', Uri.parse('https://www.goldapi.io/api/XAU/INR'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(await response.stream.bytesToString());

      // Get price
      final unformattedPrice = jsonData['price_gram_24k'];
      final price = NumberFormat.currency(locale: 'en_IN', symbol: '')
          .format(unformattedPrice);
      // Update UI
      setState(() {
        goldPrice = '₹$price/gm';
      });
    } else {
      print(response.reasonPhrase);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  color: const Color(0xFF5E5729),
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Greeting and user image
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Greeting
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hello, Suraj!',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.yellow[800],
                                  ),
                                ),
                                const SizedBox(height: 8),
                                const Text(
                                  'Live Gold Price',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                            // User image
                            const CircleAvatar(
                              backgroundImage:
                                  NetworkImage('https://picsum.photos/200/300'),
                              radius: 32,
                            ),
                          ],
                        ),

                        // Gold price
                        Expanded(
                          child: Center(
                            child: Text(
                              goldPrice,
                              style: TextStyle(
                                fontSize: 48,
                                color: Colors.yellow[600],
                              ),
                            ),
                          ),
                        ),

                        // Buy button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const GoldBuyScreen(),
                                  ));
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.yellow[800],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            child: const Text('BUY GOLD'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: CarouselSlider(
                  options: CarouselOptions(
                    aspectRatio: 2.0,
                    enlargeCenterPage: true,
                    autoPlay: true,
                  ),
                  items: imgList
                      .map((item) => Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16)),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.network(item,
                                    fit: BoxFit.cover, width: 1000)),
                          ))
                      .toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
