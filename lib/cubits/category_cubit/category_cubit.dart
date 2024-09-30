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
    emit(LoadingCategoryState());
    try {
      final response = await CategoryRepository()
          .addNewCategory(name: txtEditController.text);
      print(response);
      emit(SuccessCategoryState(msg: "Done:)"));
      await fetchCategoriesEvent();
    } catch (e) {
      emit(ErrorCategoryState(msg: e.toString()));
    }
  }

  deleteCategoryEvent({required int categoryID}) {
    emit(LoadingCategoryState());
    try {
      final response = CategoryRepository().deleteCategory(id: categoryID);
      print(response);
      emit(SuccessCategoryState(msg: "Delete it Done:)"));
    } catch (e) {
      emit(ErrorCategoryState(msg: e.toString()));
    }
  }

  updateCategoryEvent({required int categoryID, required String name}) {
    emit(LoadingCategoryState());
    try {
      final response =
          CategoryRepository().updateCategory(id: categoryID, name: name);
      print(response);
      emit(SuccessCategoryState(msg: "Update it Done:)"));
    } catch (e) {
      emit(ErrorCategoryState(msg: e.toString()));
    }
  }

  fetchCategoriesEvent() async {
    Future.delayed(Duration.zero);
    emit(LoadingCategoryState());
    try {
      categoryLayer.userCategories =
          await CategoryRepository().getUserCategories();
      categoryLayer.categoryList =
          List.from(await CategoryRepository().getAllCategories());
      categoryLayer.userCategories.add({"id": -1, "name": "All Coffee"});
      categoryLayer.userCategories =
          categoryLayer.userCategories.reversed.toList();
      print(categoryLayer.categoryList);
      emit(SuccessCategoryState(msg: "msg"));
    } catch (e) {
      print(e);
      emit(ErrorCategoryState(msg: e.toString()));
    }
  }

  updateChips() {
    emit(SuccessCategoryState(msg: ""));
  }
}
