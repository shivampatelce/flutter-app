import 'package:flutter/material.dart';
import 'package:flutterprjgroup3/cart_db.dart';
import 'package:flutterprjgroup3/order_confirmation_screen.dart';

class CheckoutScreen extends StatelessWidget {
  final streetController = TextEditingController();
  final cityController = TextEditingController();
  final provinceController = TextEditingController();
  final postalCodeController = TextEditingController();
  final cardHolderController = TextEditingController();
  final cardNumberController = TextEditingController();
  final expiryDateController = TextEditingController();
  final cvvController = TextEditingController();

  void showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }

  void validateAndSubmit(BuildContext context) {
    String? error = _getValidationError();
    if (error != null) {
      showMessage(context, error);
    } else {
      CartDb.resetCart();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => OrderConfirmationScreen()),
      );
    }
  }

  String? _getValidationError() {
    final postalCodeRegEx = RegExp(r'^[A-Za-z]\d[A-Za-z][ -]?\d[A-Za-z]\d$');
    final expiryDateRegEx = RegExp(r'^(0[1-9]|1[0-2])\/\d{2}$');

    if (streetController.text.trim().isEmpty) {
      return 'Enter a valid street address.';
    }
    if (cityController.text.trim().isEmpty) {
      return 'Enter a valid city.';
    }
    if (provinceController.text.trim().isEmpty) {
      return 'Enter a valid province.';
    }
    if (!postalCodeRegEx.hasMatch(postalCodeController.text.trim())) {
      return 'Enter a valid postal code (e.g., K1A 0B1).';
    }
    if (cardHolderController.text.trim().isEmpty) {
      return 'Enter the card holder name.';
    }
    if (cardNumberController.text.trim().length != 16) {
      return 'Card number must be 16 digits.';
    }

    String expiry = expiryDateController.text.trim();
    if (!expiryDateRegEx.hasMatch(expiry)) {
      return 'Expiry date must be in MM/YY format.';
    } else {
      final parts = expiry.split('/');
      final enteredMonth = int.tryParse(parts[0]) ?? 0;
      final enteredYear = int.tryParse('20${parts[1]}') ?? 0;

      final now = DateTime.now();
      final lastValidDay = DateTime(enteredYear, enteredMonth + 1, 0);

      if (lastValidDay.isBefore(now)) {
        return 'Card has already expired.';
      }
    }

    if (cvvController.text.trim().length != 3) return 'CVV must be 3 digits.';

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Check out",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
        elevation: 4,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Shipping Address",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),

            TextField(
              controller: streetController,
              decoration: InputDecoration(
                labelText: 'Street Address',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),

            TextField(
              controller: cityController,
              decoration: InputDecoration(
                labelText: 'City',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),

            TextField(
              controller: provinceController,
              decoration: InputDecoration(
                labelText: 'Province',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),

            TextField(
              controller: postalCodeController,
              decoration: InputDecoration(
                labelText: 'Postal Code',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),

            Text(
              "Card Information",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),

            TextField(
              controller: cardHolderController,
              decoration: InputDecoration(
                labelText: 'Card Holder Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),

            TextField(
              controller: cardNumberController,
              keyboardType: TextInputType.number,
              maxLength: 16,
              decoration: InputDecoration(
                labelText: 'Card Number',
                border: OutlineInputBorder(),
                counterText: '', // Hide character counter
              ),
            ),
            SizedBox(height: 10),

            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: expiryDateController,
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                      labelText: 'Expiry Date (MM/YY)',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: cvvController,
                    keyboardType: TextInputType.number,
                    maxLength: 3,
                    decoration: InputDecoration(
                      labelText: 'CVV',
                      border: OutlineInputBorder(),
                      counterText: '', // Hide character counter
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            Center(
              child: ElevatedButton(
                onPressed: () => validateAndSubmit(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: Text(
                  "Place Order",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
