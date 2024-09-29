import 'dart:io';

import 'package:onze_coffee_app/integrations/supabase/supabase_client.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

uploadImage({required int productId, required File image}) async {
  print("Iam at uploadImage");

  String imageName = DateTime.now().toIso8601String();
  try {
    await supabase.client.storage.from("Image").updateBinary(
        imageName, image.readAsBytesSync(),
        fileOptions: FileOptions(
            upsert: true, contentType: "image/${image.path.split(".").last}"));

    String imageUrl =
        supabase.client.storage.from("Image").getPublicUrl(imageName);

    await supabase.client.from("images").upsert({"image_url": imageUrl});
    return true;
  } catch (e) {
    throw (e.toString());
  }
}
