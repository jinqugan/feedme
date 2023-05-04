import 'package:feedme/screens/home/home_controller.dart';

class CustomerOrder {
  int orderNo;
  String name;
  CustomerType type;

  CustomerOrder({
    this.orderNo = 0,
    this.name = '',
    this.type = CustomerType.normal,
  });

  @override
  String toString() {
    return '{order_no: $orderNo, name: $name, type: $type}';
  }
}
