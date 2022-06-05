import 'package:e_book_app/data/datasources/auth_datasource.dart';
import 'package:e_book_app/data/repositories/auth_repository.dart';
import 'package:e_book_app/domain/usecases/google_sign_in_usecae.dart';
import 'package:e_book_app/domain/usecases/sign_in_usecase.dart';
import 'package:e_book_app/presetations/auth/controllers/auth_controller.dart';
import 'package:get/get.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthDataSource());
    Get.lazyPut(
      () => AuthRepositoryImp(Get.find()),
    );
    Get.lazyPut(() => SignInUsecase(Get.find()));
    Get.lazyPut(() => SignInWithGoogleUseCase(Get.find()));
    Get.put(AuthController());
  }
}
