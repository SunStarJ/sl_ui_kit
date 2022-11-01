
import 'package:flutter/foundation.dart';

import '../data/user_entity.dart';
import '../model/user_repository.dart';

class UserViewModel with ChangeNotifier, DiagnosticableTreeMixin {

  UserData? user;

  UserViewModel(){
    print("UserViewModel create");
  }


  getUserData(jsonString) async {
    UserEntity entity =
    await UserRepository.getUserData(jsonString: jsonString);
    user = entity.data;
    notifyListeners();
  }
}