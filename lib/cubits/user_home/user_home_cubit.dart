import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:onze_coffee_app/cubits/add_product/add_product_cubit.dart';
import 'package:onze_coffee_app/data/repositories/product_repository.dart';
import 'package:onze_coffee_app/data_layer/product_layer.dart';
import 'package:onze_coffee_app/models/product_model.dart';

part 'user_home_state.dart';

class UserHomeCubit extends Cubit<UserHomeState> {
  List<ProductModel> products = [];
  final productLayer = GetIt.I.get<ProductLayer>();
  Future getProducts() async {
    print("iam at getProducts");
    if (!isClosed) emit(LoadingState());
    productLayer.products = await ProductRepository().getUserProducts();
    products = productLayer.products;
    print("end");
    if (!isClosed) emit(GetProductSuccessState());
  }

  UserHomeCubit() : super(UserHomeInitial()) {
    getProducts();
  }

  getCategoryProducts(
      {required List<ProductModel> customProduct, required String category}) {
    if (!isClosed) emit(LoadingState());
    try {
      for (var element in customProduct) {
        if (category == element.productCategory) {
          print(element);
        }
      }
    } catch (e) {}
  }

  filterProduct(String productCategory) {
    if (productCategory != "All Coffee") {
      products = productLayer.products
          .where((product) => product.productCategory == productCategory)
          .toList();
    } else {
      products = productLayer.products;
    }
    if (!isClosed) emit(GetProductSuccessState());
  }
}
