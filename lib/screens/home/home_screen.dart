import 'package:feedme/screens/home/customer_widget.dart';
import 'package:feedme/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order System'),
        elevation: 0.2,
        backgroundColor: scaffoldBackgroundColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15),
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Pending',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                          const SizedBox(height: 15),
                          GetX<HomeController>(
                            builder: (homeController) {
                              return Expanded(
                                child: ListView.builder(
                                  itemCount: homeController.pending.length,
                                  itemBuilder: (context, index) {
                                    final item = homeController.pending[index];

                                    return CustomerInfo(
                                        item: item, index: index);
                                  },
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Completed',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                          const SizedBox(height: 15),
                          GetX<HomeController>(
                            builder: (homeController) {
                              return Expanded(
                                child: ListView.builder(
                                  itemCount: homeController.completed.length,
                                  itemBuilder: (context, index) {
                                    final item =
                                        homeController.completed[index];

                                    return CustomerInfo(
                                        item: item, index: index);
                                  },
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const OrderAction(),
            ],
          ),
        ),
      ),
    );
  }
}
