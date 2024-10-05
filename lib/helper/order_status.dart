import 'package:onze_coffee_app/helper/custom_colors.dart';

statusColor(String status) {
  if (status == "holding") return AppColor.forth;
  if (status == "processing") return AppColor.forth;
  if (status == "rejected") return AppColor.secondary;
  return AppColor.primary;
}
