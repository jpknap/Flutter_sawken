import 'package:sawken/Model/User.dart';
import 'package:sawken/Store/ModelStore.dart';

class UserStore extends ModelStore {
  User user;

  @override
  void loadData({User user}) {
      this.user = user;
      isLoad = true;
      super.callSuscribe();
  }

  @override
  User loadFromJson(dynamic jsonObject) {
    dynamic _jsonUser = jsonObject;
    User _user =  new User.fromJson(_jsonUser);
    this.loadData(user:_user);
    return _user;
  }
}