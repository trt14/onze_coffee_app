import 'dart:io';

import 'package:onze_coffee_app/integrations/supabase/supabase_client.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ImageRepository {
  uploadImage({required int productId, required File image}) async {
    //?-- change date formate
    String imageName = DateTime.now().toIso8601String();
    imageName = imageName.replaceAll("-", "_");
    imageName = imageName.replaceAll(".", "_");
    imageName = imageName.replaceAll(":", "_");
    //?-- check image type for insert
    final imageAsByte = await image.readAsBytes();
    try {
      //?--upload image to bucket
      await supabase.client.storage.from("image_backet").uploadBinary(
          imageName, imageAsByte,
          fileOptions: FileOptions(
              contentType: "image/${image.path.split(".").last}",
              upsert: true));
      //?-- upload image url to image table
      String imageUrl = supabase.client.storage
          .from("image_backet")
          .getPublicUrl(imageName);
      await supabase.client
          .from("images")
          .upsert({"image_url": imageUrl, "product_id": productId});
      return true;
    } catch (e) {}
    return false;
  }
}
