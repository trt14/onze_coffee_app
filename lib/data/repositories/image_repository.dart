import 'dart:io';

import 'package:onze_coffee_app/integrations/supabase/supabase_client.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ImageRepository {
  uploadImage({required int productId, required File image}) async {
    print("Iam at uploadImage");

    //?-- change date formate
    String imageName = DateTime.now().toIso8601String();
    imageName = imageName.replaceAll("-", "_");
    imageName = imageName.replaceAll(".", "_");
    imageName = imageName.replaceAll(":", "_");
    print(imageName);
    //?-- check image type for insert
    print("image/${image.path.split(".").last}");
    final imageAsByte = await image.readAsBytes();
    try {
      print("upload to storage");
      //?--upload image to bucket
      await supabase.client.storage.from("image_backet").uploadBinary(
          imageName, imageAsByte,
          fileOptions: FileOptions(
              contentType: "image/${image.path.split(".").last}",
              upsert: true));
      print("get url from storage");
      //?-- upload image url to image table
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
}
