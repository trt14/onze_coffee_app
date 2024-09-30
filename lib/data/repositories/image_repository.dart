import 'dart:io';

import 'package:onze_coffee_app/integrations/supabase/supabase_client.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

uploadImage({required int productId, required File image}) async {
  print("Iam at uploadImage");

  String imageName = DateTime.now().toIso8601String();
  imageName = imageName.replaceAll("-", "_");
  imageName = imageName.replaceAll(".", "_");
  imageName = imageName.replaceAll(":", "_");
  print(imageName);
  print("image/${image.path.split(".").last}");
  final imageAsByte = await image.readAsBytes();
  try {
    print("upload to storage");
    await supabase.client.storage.from("image_backet").updateBinary(
        imageName, imageAsByte,
        fileOptions: FileOptions(upsert: true, contentType: "image/jpg"));
    print("get url from storage");
    String imageUrl = await supabase.client.storage
        .from("image_backet")
        .getPublicUrl(imageName);
    print("upload to table");
    await supabase.client
        .from("images")
        .upsert({"image_url": imageUrl, "product_id": productId});
    return true;
  } catch (e) {
    print("iam at catch");
    print(e);
  }
  return false;
}
