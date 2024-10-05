import 'package:flutter/material.dart';

class MyQr extends StatelessWidget {
  const MyQr({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.network(
          'https://miro.medium.com/v2/resize:fit:789/1*A9YcoX1YxBUsTg7p-P6GBQ.png'),
    );
  }
}
