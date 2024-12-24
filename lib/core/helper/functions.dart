import 'dart:convert';

import 'package:fruity/constants.dart';
import 'package:fruity/core/services/shared_prefs_service.dart';
import 'package:fruity/features/auth/data/models/user_model.dart';
import 'package:fruity/features/auth/domain/entities/user_entity.dart';
import 'package:intl/intl.dart';

//localization helper
bool isArabic() {
  return Intl.getCurrentLocale() == 'ar';
}

//func to fetch stored user data eg. name, email, uId
UserEntity getUser() {
  var jsonString = PrefsService.getString(kUserData);
  var userEntity = UserModel.fromMap(jsonDecode(jsonString));
  return userEntity;
}
