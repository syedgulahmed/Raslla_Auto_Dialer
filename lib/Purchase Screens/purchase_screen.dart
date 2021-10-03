import 'package:raslla_call/Purchase%20Screens/feed_form_screen.dart';
import 'package:raslla_call/Custom%20Widgets/subscription_card.dart';
import 'package:flutter/material.dart';

class Purchase extends StatelessWidget {
  const Purchase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(28, 40, 55, 1),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(164, 202, 243, 1),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FeedbackFormScreen(),
            ),
          );
        },
        child: Icon(
          Icons.info,
          color: Color.fromRGBO(28, 40, 55, 1),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(61, 80, 101, 1),
        title: Text(
          'Selecciona tu plan de suscripción',
          style: TextStyle(
            color: Color.fromRGBO(164, 202, 243, 1),
            fontWeight: FontWeight.normal,
            fontSize: 18,
          ),
        ),
      ),
      body: Column(
        children: [
          SubscriptionCard(duration: 'monthly'),
          SubscriptionCard(duration: 'quarterly'),
          SubscriptionCard(duration: 'yearly'),
        ],
      ),
    );
  }
}
