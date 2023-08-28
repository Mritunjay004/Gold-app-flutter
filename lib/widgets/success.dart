import 'package:first_app/screens/buy_main.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SuccessWidget extends StatefulWidget {
  const SuccessWidget({Key? key}) : super(key: key);

  @override
  _SuccessWidgetState createState() => _SuccessWidgetState();
}

class _SuccessWidgetState extends State<SuccessWidget>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 5))
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              Navigator.pop(context);

              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) => const GoldBuyScreen(),
                ),
              );
            }
          });
    // Play the animation automatically when the widget is built
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Lottie.network(
          'https://lottie.host/f02fbfad-ff64-40b6-8357-c13435851885/C77kLq3V24.json',
          controller: _controller,
          onLoaded: (composition) {
            _controller.duration = composition.duration;
          },
        ),
        const Text('Your order has been placed successfully!'),
      ],
    );
  }
}
