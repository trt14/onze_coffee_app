import 'dart:io';
import 'dart:typed_data';

import 'package:onze_coffee_app/data/repositories/image_repository.dart';
import 'package:onze_coffee_app/integrations/supabase/supabase_client.dart';
import 'package:onze_coffee_app/models/product_model.dart';
import 'package:onze_coffee_app/models/variants.dart';

Future<List<Map<String, dynamic>>> getUserProducts() async {
  return await supabase.client.rpc("get_product_details_v2");
}

createProduct(
    {required ProductModel product,
    required int categoryId,
    List<File>? images}) async {
  print("createProduct");
  try {
    print("insert new product");
    final data = await supabase.client
        .from("products")
        .upsert(product.toJson(categoryId: categoryId))
        .select();
    print(data);
    final id = data.first["id"];
    print("product ID :$id");
    for (Variants element in product.variants) {
      await supabase.client
          .from("product_variants")
          .upsert(element.toJson(productId: id));
    }
    if (images != null) {
      for (var element in images) {
        await uploadImage(productId: product.productId, image: element);
      }
    }
    return true;
  } catch (e) {
    print(e);
    return false;
  }
}
