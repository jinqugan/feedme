import 'dart:async';

import 'package:feedme/screens/home/home_model.dart';
import 'package:feedme/utils/helpers.dart';
import 'package:get/get.dart';

enum CustomerType { normal, vip }

class HomeController extends GetxController {
  List<CustomerOrder> normals = [];
  List<CustomerOrder> vips = [];
  RxList<CustomerOrder> pending = <CustomerOrder>[].obs;
  RxList<CustomerOrder> completed = <CustomerOrder>[].obs;
  RxBool processing = false.obs;
  Timer? _timer;
  int orderNo = 0, vipNo = 0, customerNo = 0;

  void addItem(CustomerType type) {
    orderNo++;

    CustomerOrder order = CustomerOrder(orderNo: orderNo, type: type);

    try {
      if (type == CustomerType.normal) {
        order.name = 'Customer ${leadingNumber(++customerNo, 3)}';
        normals.add(order);
        pending.add(order);
      } else {
        order.name = 'VIP ${leadingNumber(++vipNo, 3)}';
        vips.add(order);
        pending.insert(vips.length - 1, order);
      }
    } catch (e) {
      //
    }
  }

  void removeItem(int index) {
    int orderNo = pending[index].orderNo;

    if (pending[index].type == CustomerType.normal) {
      int index = normals.indexWhere((i) => i.orderNo == orderNo);

      if (index >= 0) {
        normals.removeAt(index);
      }
    } else {
      int index = vips.indexWhere((i) => i.orderNo == orderNo);
      if (index >= 0) {
        vips.removeAt(index);
      }
    }

    pending.removeAt(index);
  }

  void cookingBot(bool enabled) {
    processing.value = enabled;

    if (enabled == true) {
      bool active = _timer?.isActive ?? false;

      if (!active) {
        _timer =
            Timer.periodic(const Duration(seconds: 5), (_) => processOrder());
      }
    } else {
      _timer?.cancel();
    }
  }

  void processOrder() {
    int firstOrder = 0;

    if (pending.isNotEmpty) {
      if (vips.isNotEmpty) {
        vips.removeAt(firstOrder);
      } else {
        normals.removeAt(firstOrder);
      }

      completed.add(pending[firstOrder]);
      pending.removeAt(firstOrder);
    }
  }
}
