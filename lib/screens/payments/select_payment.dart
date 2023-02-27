import 'package:apple_store/components/payment_method_option.dart';
// import 'package:apple_store/screens/payments/card_payment.dart';
import 'package:flutter/material.dart';

class PaymentMethodSelectionScreen extends StatefulWidget {
  @override
  _PaymentMethodSelectionScreenState createState() =>
      _PaymentMethodSelectionScreenState();
}

class _PaymentMethodSelectionScreenState
    extends State<PaymentMethodSelectionScreen> {
  int _selectedOptionIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select a Payment Method'),
      ),
      body: Column(
        children: [
          PaymentMethodOption(
            title: 'Credit Card',
            subtitle: 'Pay with your Visa or MasterCard',
            icon: Icons.credit_card,
            isSelected: _selectedOptionIndex == 0,
            onTap: () {
              setState(() {
                _selectedOptionIndex = 0;
              });
            },
          ),
          const Divider(
            thickness: 1,
          ),
          PaymentMethodOption(
            title: 'PayPal',
            subtitle: 'Pay with your PayPal account',
            icon: Icons.payments,
            isSelected: _selectedOptionIndex == 1,
            onTap: () {
              setState(() {
                _selectedOptionIndex = 1;
              });
            },
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed:
              //    Navigator.push(
              // context,
              // MaterialPageRoute(
              //   builder: (context) => CardForm(),
              // ));
              // },
              _selectedOptionIndex != -1
                  ? () => _onPaymentMethodSelected(context)
                  : null,
          child: const Text('Proceed to Payment'),
        ),
      ),
    );
  }

  void _onPaymentMethodSelected(BuildContext context) {
    // Handle the selected payment method
    // if (_selectedOptionIndex == 0) {
    //   Navigator.push(
    //       context,
    //       MaterialPageRoute(
    //         builder: (context) => CardForm(),
    //       ));
    // }
  }
}
