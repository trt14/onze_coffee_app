import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:onze_coffee_app/data/repositories/category_repository.dart';
import 'package:onze_coffee_app/data_layer/category_layer.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  TextEditingController txtEditController = TextEditingController();
  final categoryLayer = GetIt.I.get<CategoryLayer>();
  int productCategory = 1;
  int userProductCategory = -1;
  CategoryCubit() : super(CategoryInitial()) {
    fetchCategoriesEvent();
  }

  addNewCategoryEvent() async {
    if (!isClosed) emit(LoadingCategoryState());
    try {
      final response = await CategoryRepository()
          .addNewCategory(name: txtEditController.text);
      print(response);
      if (!isClosed) emit(SuccessCategoryState(msg: "Done:)"));
      await fetchCategoriesEvent();
    } catch (e) {
      if (!isClosed) emit(ErrorCategoryState(msg: e.toString()));
    }
  }

  deleteCategoryEvent({required int categoryID}) {
    if (!isClosed) emit(LoadingCategoryState());
    try {
      final response = CategoryRepository().deleteCategory(id: categoryID);
      print(response);
      if (!isClosed) emit(SuccessCategoryState(msg: "Delete it Done:)"));
    } catch (e) {
      if (!isClosed) emit(ErrorCategoryState(msg: e.toString()));
    }
  }

  updateCategoryEvent({required int categoryID, required String name}) {
    if (!isClosed) emit(LoadingCategoryState());
    try {
      final response =
          CategoryRepository().updateCategory(id: categoryID, name: name);
      print(response);
      if (!isClosed) emit(SuccessCategoryState(msg: "Update it Done:)"));
    } catch (e) {
      if (!isClosed) emit(ErrorCategoryState(msg: e.toString()));
    }
  }

  fetchCategoriesEvent() async {
    Future.delayed(Duration.zero);
    print("fetchCategoriesEvent");
    if (!isClosed) emit(LoadingCategoryState());
    try {
      categoryLayer.userCategories =
          await CategoryRepository().getUserCategories();
      categoryLayer.categoryList =
          List.from(await CategoryRepository().getAllCategories());
      categoryLayer.userCategories.add({"id": -1, "name": "All Coffee"});
      categoryLayer.userCategories =
          categoryLayer.userCategories.reversed.toList();
      if (!isClosed) emit(SuccessCategoryState(msg: "msg"));
    } catch (e) {
      print(e);
      if (!isClosed) emit(ErrorCategoryState(msg: e.toString()));
    }
  }

  updateChips() {
    if (!isClosed) emit(SuccessCategoryState(msg: ""));
  }
}
