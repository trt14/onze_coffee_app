import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:onze_coffee_app/data/repositories/order_repository.dart';
import 'package:onze_coffee_app/data_layer/user_layer.dart';
import 'package:onze_coffee_app/integrations/supabase/supabase_client.dart';
import 'package:onze_coffee_app/models/bill_model.dart';
import 'package:onze_coffee_app/screen/shared/orders_screen.dart';
import 'package:onze_coffee_app/screen/user/user_cart_screen.dart';
import 'package:onze_coffee_app/screen/user/user_home_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'nav_bar_state.dart';

class NavBarCubit extends Cubit<NavBarState> {
  final userLayer = GetIt.I.get<UserLayer>();
  List<Widget> screens = const [
    UserHomeScreen(),
    OrdersScreen(),
    UserCartScreen(),
  ];
  int index = 0;
  NavBarCubit() : super(NavBarInitial()) {
    orderNotification();
  }

  update() {
    if (!isClosed) emit(Navigate());
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
              print("look here");
              print(value.newRecord);
              print(userLayer.user.id);
              if (value.newRecord["user_id"] == userLayer.user.id) {
                print("show notification");
                BillModel order =
                    await OrderRepository().getOrderById(value.newRecord["id"]);

                AwesomeNotifications().createNotification(
                  content: NotificationContent(
                    id: order.billId,
                    channelKey: 'onze',
                    actionType: ActionType.Default,
                    title: '${order.billId}',
                    body: message(order.status),
                    icon: "resource://drawable/onze_logo",
                  ),
                );
              }
            })
        .subscribe();
  }
}

message(String status) {
  switch (status) {
    case == "holding":
      return "waiting to accept order";
    case == "processing":
      return "your order under processing";
    case == "completed":
      return "come and take your order";
    case == "rejected":
      return "your order was reject come and take your money";

    default:
  }
}
