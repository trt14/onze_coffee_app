import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:onze_coffee_app/data_layer/category_layer.dart';
import 'package:onze_coffee_app/data_layer/order_layer.dart';
import 'package:onze_coffee_app/data_layer/product_layer.dart';
import 'package:onze_coffee_app/data_layer/user_layer.dart';

void setup() {
  AwesomeNotifications().initialize(
      // set the icon to null if you want to use the default app icon
      'resource://drawable/res_app_icon',
      [
        NotificationChannel(
            channelGroupKey: 'onze',
            channelKey: 'onze',
            channelName: 'onze',
            channelDescription: 'order',
            defaultColor: const Color(0xFF9D50DD),
            ledColor: Colors.white)
      ],
      // Channel groups are only visual and are not required
      channelGroups: [
        NotificationChannelGroup(
            channelGroupKey: 'onze', channelGroupName: 'onze')
      ],
      debug: true);

  AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
    if (!isAllowed) {
      AwesomeNotifications().requestPermissionToSendNotifications();
    }
  });
  GetIt.I.registerSingleton<UserLayer>(UserLayer());
  GetIt.I.registerSingleton<CategoryLayer>(CategoryLayer());
  GetIt.I.registerSingleton<ProductLayer>(ProductLayer());
  GetIt.I.registerSingleton<OrderLayer>(OrderLayer());
}
