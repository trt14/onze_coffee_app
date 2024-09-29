import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:onze_coffee_app/data/repositories/product_repository.dart';
import 'package:onze_coffee_app/models/product_model.dart';

part 'user_home_state.dart';

class UserHomeCubit extends Cubit<UserHomeState> {
  List<ProductModel> products = [];

  Future getProducts() async {
    print("iam at getProducts");
    emit(LoadingState());
    products = await getUserProducts();
    for (var element in products) {
      for (var y in element.imageUrls) {
     
        print(y.toString());
      }
    }
    print("end");
    emit(GetProductSuccessState());
  }

  UserHomeCubit() : super(UserHomeInitial()) {
    getProducts();
  }
}
