import 'package:flutter/material.dart';

class SubscriptionCard extends StatelessWidget {
  const SubscriptionCard({
    required this.duration,
  });

  final String duration;

  @override
  Widget build(BuildContext context) {
    String _title = '';
    String _description = '';
    String _price = '';

    if (duration == 'monthly') {
      _title = 'Suscripción Mensual';
      _description = '30 días';
      _price = '5.00';
    } else if (duration == 'quarterly') {
      _title = '3 Meses de Suscripción';
      _description = '91 días';
      _price = '15.00';
    } else if (duration == 'yearly') {
      _title = 'Suscripción Anual';
      _description = '365 días';
      _price = '45.00';
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: InkWell(
        onTap: () {},
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: Color.fromRGBO(61, 80, 101, 1),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$_title',
                      style: TextStyle(
                        color: Color.fromRGBO(61, 231, 157, 1),
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 5.0, 0, 0),
                      child: Text(
                        'Llamadas y funcionalidad ilimitada\npor $_description.',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color.fromRGBO(164, 202, 243, 1),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        'usd',
                        style: TextStyle(
                          color: Color.fromRGBO(61, 231, 157, 1),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '$_price',
                        style: TextStyle(
                          color: Color.fromRGBO(61, 231, 157, 1),
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
