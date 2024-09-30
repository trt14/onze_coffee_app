import 'dart:io';

import 'package:onze_coffee_app/data/repositories/image_repository.dart';
import 'package:onze_coffee_app/integrations/supabase/supabase_client.dart';
import 'package:onze_coffee_app/models/product_model.dart';
import 'package:onze_coffee_app/models/variants_model.dart';

Future<List<ProductModel>> getUserProducts() async {
  List<Map<String, dynamic>> data =
      await supabase.client.rpc("get_product_details_v2");
  return data.map((e) => ProductModel.fromJson(e)).toList();
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
    for (VariantsModel element in product.variants) {
      await supabase.client
          .from("product_variants")
          .upsert(element.toJson(productId: id));
    }
    if (images != null || images!.isNotEmpty) {
      for (File element in images) {
        await uploadImage(productId: id, image: element);
      }
    }
    return true;
  } catch (e) {
    print("iam at create product catch");
    print(e);
    return false;
  }



}



