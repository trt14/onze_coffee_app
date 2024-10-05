import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:onze_coffee_app/data/repositories/order_repository.dart';
import 'package:onze_coffee_app/helper/notificationController.dart';
import 'package:onze_coffee_app/integrations/supabase/supabase_client.dart';
import 'package:onze_coffee_app/models/bill_model.dart';
import 'package:onze_coffee_app/screen/employee/emp_home_screen.dart';
import 'package:onze_coffee_app/screen/employee/emp_products_screen.dart';
import 'package:onze_coffee_app/screen/shared/orders_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'admin_nav_state.dart';

class AdminNavCubit extends Cubit<AdminNavState> {
  List<Widget> screens = const [
    EmpHomeScreen(),
    EmpProductsScreen(),
    OrdersScreen()
  ];

  List<PreferredSizeWidget> appBars = [
    AppBar(
      title: const Center(child: Text("New Orders")),
    ),
    AppBar(
      title: const Center(child: Text("Products")),
    ),
    AppBar(
      title: const Center(child: Text("Orders")),
    ),
  ];
  int index = 0;

  AdminNavCubit() : super(AdminNavInitial()) {
    AwesomeNotifications().setListeners(
        onActionReceivedMethod: NotificationController.onActionReceivedMethod,
        onNotificationCreatedMethod:
            NotificationController.onNotificationCreatedMethod,
        onNotificationDisplayedMethod:
            NotificationController.onNotificationDisplayedMethod,
        onDismissActionReceivedMethod:
            NotificationController.onDismissActionReceivedMethod);
    orderNotification();
  }

  orderNotification() async {
    await Future.delayed(Duration.zero);

    supabase.client
        .channel('notification')
        .onPostgresChanges(
            event: PostgresChangeEvent.update,
            schema: 'public',
            table: 'orders',
            callback: (value) async {

              if (value.newRecord["status"] == "holding") {
                BillModel order =
                    await OrderRepository().getOrderById(value.newRecord["id"]);

                AwesomeNotifications().createNotification(
                  content: NotificationContent(
                    id: order.billId,
                    channelKey: 'onze',
                    actionType: ActionType.Default,
                    title: '${order.billId}',
                    body: 'New order has arrive ',
                    icon: "resource://drawable/onze_logo",
                  ),
                );
              }
            })
        .subscribe();
  }

  update() {
    if (!isClosed) emit(Navigate());
  }
}
