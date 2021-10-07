import 'package:scoped_model/scoped_model.dart';
import '../scoped-model/user_scoped_model.dart';
import '../scoped-model/food_model.dart';

class MainModel extends Model with FoodModel, UserModel {
  void fetchAll() {
    fetchFoods();
    fetchUserInfos();
  }
}
