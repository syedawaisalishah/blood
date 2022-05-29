import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../common/assets.dart';
import '../common/colors.dart';
import '../widgets/all_blood_requests.dart';
import '../widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  static const route = 'home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(title: const Text('Blood Requests')),
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                child: Card(
                  margin: EdgeInsets.zero,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Container(width: 180, height: 180, child: Image.asset('assets/icons/blood.png')),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Center(
                            child: Text(
                              'Save Life,\nBlood Donation',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: MainColors.primary, fontSize: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SliverAppBar(
              title: Text(
                'Current Requests',
                style: Theme.of(context).textTheme.headline5!.copyWith(color: MainColors.primary),
              ),
              primary: false,
              pinned: true,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              automaticallyImplyLeading: false,
            ),
            const AllBloodRequests(),
          ],
        ),
      ),
    );
  }
}
