import 'package:flutter/material.dart';

class StaySafeCard extends StatelessWidget {
  const StaySafeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
      decoration: BoxDecoration(
          color: Colors.lightBlue.withOpacity(.1),
          borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    'Stay Safe',
                    style: TextStyle(color: Colors.lightBlue, fontSize: 16),
                  ),
                ),
              ),
              Icon(
                Icons.close,
                color: Colors.grey,
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildColumn(
                  'https://cdn-icons-png.flaticon.com/128/5756/5756931.png',
                  'Always wear a mask'),
              _buildColumn(
                  'https://cdn-icons-png.flaticon.com/128/3017/3017492.png',
                  'Wash hand'),
              _buildColumn(
                  'https://cdn-icons-png.flaticon.com/128/2949/2949694.png',
                  'Keep distance with other person'),
            ],
          ),
        ],
      ),
    );
  }

  _buildColumn(image, title) {
    return Expanded(
      child: Column(
        children: [
          Image.network(
            image,
            height: 40,
            width: 100,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
