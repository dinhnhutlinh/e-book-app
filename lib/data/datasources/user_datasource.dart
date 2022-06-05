import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_book_app/configs/defind.dart';
import 'package:e_book_app/domain/entities/user_profile.dart';
import 'package:e_book_app/utils/exception.dart';

class UserDataSource {
  final CollectionReference _userProfiles =
      FirebaseFirestore.instance.collection(Defind.USER_COLLECTIONS);

  Future creatUser(UserProfile userProfile) async {
    await _userProfiles
        .add(userProfile.toUserModel().toJson())
        .catchError((error) {
      throw UserException('Không tạo được tài khoản');
    });
  }
}
