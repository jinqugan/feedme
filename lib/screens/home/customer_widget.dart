import 'package:feedme/screens/home/home_controller.dart';
import 'package:feedme/screens/home/home_model.dart';
import 'package:feedme/theme/colors.dart';
import 'package:feedme/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

HomeController controller = Get.find<HomeController>();

class OrderAction extends StatelessWidget {
  const OrderAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    controller.addItem(CustomerType.normal);
                  },
                  child: const Text('Add Normal Order'),
                ),
              ),
              const SizedBox(width: 15.0),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    controller.addItem(CustomerType.vip);
                  },
                  child: const Text('Add VIP Order'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Obx(
            () => ElevatedButton(
              onPressed: () {
                controller.cookingBot(!controller.processing.value);
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
                backgroundColor: controller.processing.value == true
                    ? warningColor
                    : primaryColor,
              ),
              child: Text(
                controller.processing.value == false ? '+ Bots' : '- Bots',
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(color: Colors.white, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomerInfo extends StatelessWidget {
  final CustomerOrder item;
  final int index;

  const CustomerInfo({super.key, required this.item, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: [
          Text(
            leadingNumber(item.orderNo, 5),
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(width: 15),
          Text(item.name),
        ],
      ),
    );
  }
}
