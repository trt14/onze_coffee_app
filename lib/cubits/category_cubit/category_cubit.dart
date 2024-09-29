import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:onze_coffee_app/data/repositories/category_repository.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  TextEditingController txtEditController = TextEditingController();

  CategoryCubit() : super(CategoryInitial());

  addNewCategoryEvent() {
    emit(LoadingCategoryState());
    try {
      final response =
          CategoryRepository().addNewCategory(name: txtEditController.text);
      print(response);
      emit(SuccessCategoryState(msg: "Done:)"));
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

  fetchCategoriesEvent() {
    emit(LoadingCategoryState());
    try {
      final response = CategoryRepository().getAllCategories();
      print(response);
    } catch (e) {
      emit(ErrorCategoryState(msg: e.toString()));
    }
  }
}
