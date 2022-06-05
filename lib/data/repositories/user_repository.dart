import 'package:e_book_app/data/datasources/user_datasource.dart';
import 'package:e_book_app/domain/entities/user_profile.dart';
import 'package:e_book_app/domain/repositories/user_repository.dart';

class UserRepositoryIml extends UserRepository {

  final UserDataSource _dataSource;

  UserRepositoryIml(this._dataSource);


  @override
  Future createUserProfile(UserProfile userProfile) => _dataSource.creatUser(userProfile);
  
}
