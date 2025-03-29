import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Check out")),
      body: Center(
        child: Column(
          children: [
            Text("Check out form"),
            TextButton(onPressed: () {}, child: Text("Pay")),
          ],
        ),
      ),
    );
  }
}
