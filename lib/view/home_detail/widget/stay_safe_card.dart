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
              _buildColumn('assets/images/vector_smart_object_3.png',
                  'Always wear a mask'),
              _buildColumn(
                  'assets/images/vector_smart_object_2.png', 'Wash hand'),
              _buildColumn('assets/images/vector_smart_object_1.png',
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
          Image.asset(
            image,
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
