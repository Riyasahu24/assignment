import 'package:assignment/view/home_detail/widget/categories_card.dart';
import 'package:assignment/view/home_detail/widget/stay_safe_card.dart';
import 'package:flutter/material.dart';

class HomeCard extends StatefulWidget {
  const HomeCard({super.key});

  @override
  State<HomeCard> createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> with TickerProviderStateMixin {
  late PageController _pageViewController;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
    _tabController.dispose();
  }

  _handlePageViewChanged(int currentPageIndex) {
    _tabController.index = currentPageIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.lightBlue.withOpacity(.1)),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .2,
              width: double.infinity,
              child: PageView(
                controller: _pageViewController,
                onPageChanged: _handlePageViewChanged,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      'assets/images/offer.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      'assets/images/offer.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      'assets/images/offer.png',
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            TabPageSelector(
              controller: _tabController,
              color: Colors.white,
              selectedColor: Colors.lightBlue,
              indicatorSize: 10,
            ),
            const SizedBox(
              height: 20,
            ),
            const CategoryCard(),
            const SizedBox(
              height: 20,
            ),
            const StaySafeCard(),
            SizedBox(
              height: MediaQuery.of(context).size.height * .12,
            ),
          ],
        ),
      ),
    );
  }
}
