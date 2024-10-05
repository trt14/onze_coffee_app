import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:onze_coffee_app/data/repositories/category_repository.dart';
import 'package:onze_coffee_app/data/repositories/product_repository.dart';
import 'package:onze_coffee_app/data_layer/category_layer.dart';
import 'package:onze_coffee_app/data_layer/product_layer.dart';
import 'package:onze_coffee_app/models/product_model.dart';

part 'user_home_state.dart';

class UserHomeCubit extends Cubit<UserHomeState> {
  List<ProductModel> products = [];
  final productLayer = GetIt.I.get<ProductLayer>();
  final categoryLayer = GetIt.I.get<CategoryLayer>();
  int productCategory = 1;
  int userProductCategory = -1;
  Future getProducts() async {
    await Future.delayed(Duration.zero);
    if (!isClosed) emit(ProductLoadingState());
    await Future.delayed(Duration.zero);

    await fetchCategoriesEvent();
    try {
      productLayer.products = await ProductRepository().getUserProducts();
      products = productLayer.products;
    } catch (e) {}

    if (!isClosed) emit(GetProductSuccessState());
  }

  UserHomeCubit() : super(UserHomeInitial()) {
    getProducts();
  }

  filterProduct(String productCategory) {
    if (productCategory != "All Coffee") {
      products = productLayer.products
          .where((product) => product.productCategory == productCategory)
          .toList();
    } else {
      products = productLayer.products;
    }
    if (!isClosed) emit(UpdateChipsState());
  }

  fetchCategoriesEvent() async {
    await Future.delayed(Duration.zero);

    try {
      categoryLayer.userCategories =
          await CategoryRepository().getUserCategories();
      categoryLayer.categoryList =
          List.from(await CategoryRepository().getAllCategories());
      categoryLayer.userCategories.add({"id": -1, "name": "All Coffee"});
      categoryLayer.userCategories =
          categoryLayer.userCategories.reversed.toList();
    } catch (e) {
    }
  }

  updateChips() {
    if (!isClosed) emit(UpdateChipsState());
  }
}
