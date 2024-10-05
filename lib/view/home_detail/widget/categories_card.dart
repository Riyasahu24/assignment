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
            image: 'https://cdn-icons-png.flaticon.com/512/12772/12772533.png',
          ),
          _CategoryDesign(
            title: 'Retail',
            image: 'https://cdn-icons-png.flaticon.com/512/8539/8539117.png',
          ),
          _CategoryDesign(
            title: 'Malls',
            image: 'https://cdn-icons-png.flaticon.com/512/998/998718.png',
          ),
          _CategoryDesign(
            title: 'Gym',
            image:
                'https://www.drawhipo.com/wp-content/uploads/2023/03/Gym-Color-2-Dumbbells-Curved.png',
          ),
          _CategoryDesign(
            title: 'Restaurant',
            image: 'https://cdn-icons-png.flaticon.com/128/2944/2944515.png',
          ),
          _CategoryDesign(
            title: 'Grocery',
            image: 'https://cdn-icons-png.flaticon.com/128/1261/1261163.png',
          ),
          _CategoryDesign(
            title: 'Saloon',
            image: 'https://cdn-icons-png.flaticon.com/512/12772/12772533.png',
          ),
          _CategoryDesign(
            title: 'Retail',
            image: 'https://cdn-icons-png.flaticon.com/512/8539/8539117.png',
          ),
          _CategoryDesign(
            title: 'Malls',
            image: 'https://cdn-icons-png.flaticon.com/512/998/998718.png',
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
          Image.network(
            image,
            height: 40,
            width: 100,
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
