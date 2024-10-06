import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      width: double.infinity,
      child: GridView(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, crossAxisSpacing: 10, mainAxisSpacing: 10),
        children: const [
          _CategoryDesign(
            title: 'Saloon',
            image: 'assets/images/saloon.png',
          ),
          _CategoryDesign(
            title: 'Retail',
            image: 'assets/images/ic_retail.png',
          ),
          _CategoryDesign(
            title: 'Malls',
            image: 'assets/images/mall.png',
          ),
          _CategoryDesign(
            title: 'Gym',
            image: 'assets/images/vector_smart_object_1_2.png',
          ),
          _CategoryDesign(
            title: 'Restaurant',
            image: 'assets/images/vector_smart_object_copy_3.png',
          ),
          _CategoryDesign(
            title: 'Grocery',
            image: 'assets/images/vector_smart_object_4.png',
          ),
          _CategoryDesign(
            title: 'Saloon',
            image: 'assets/images/saloon.png',
          ),
          _CategoryDesign(
            title: 'Retail',
            image: 'assets/images/ic_retail.png',
          ),
          _CategoryDesign(
            title: 'Malls',
            image: 'assets/images/mall.png',
          ),
        ],
      ),
    );
  }
}

class _CategoryDesign extends StatelessWidget {
  const _CategoryDesign({required this.title, required this.image});

  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.lightBlue.shade100,
              blurRadius: 4,
            ),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
