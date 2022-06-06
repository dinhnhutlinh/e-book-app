// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart' as _i4;
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i5;
import 'package:injectable/injectable.dart' as _i2;

import 'data/datasources/auth_datasource.dart' as _i8;
import 'data/datasources/user_datasource.dart' as _i6;
import 'data/repositories/auth_repository.dart' as _i9;
import 'data/repositories/user_repository.dart' as _i7;
import 'domain/usecases/get_user_usecase.dart' as _i10;
import 'domain/usecases/google_sign_in_usecae.dart' as _i12;
import 'domain/usecases/sign_in_usecase.dart' as _i11;
import 'domain/usecases/sign_up_usecase.dart' as _i13;
import 'injection.dart' as _i14; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final mainModule = _$MainModule();
  gh.factory<_i3.FirebaseAuth>(() => mainModule.getFirebaseAuth());
  gh.factory<_i4.FirebaseFirestore>(() => mainModule.getFirebaseFirestore());
  gh.factory<_i5.GoogleSignIn>(() => mainModule.getGoogleSignIn());
  gh.lazySingleton<_i6.UserDataSource>(
      () => _i6.UserDataSource(get<_i3.FirebaseAuth>()));
  gh.lazySingleton<_i7.UserRepository>(
      () => _i7.UserRepository(get<_i6.UserDataSource>()));
  gh.lazySingleton<_i8.AuthDataSource>(() =>
      _i8.AuthDataSource(get<_i3.FirebaseAuth>(), get<_i5.GoogleSignIn>()));
  gh.lazySingleton<_i9.AuthRepository>(
      () => _i9.AuthRepository(get<_i8.AuthDataSource>()));
  gh.factory<_i10.GetUserUserCase>(
      () => _i10.GetUserUserCase(get<_i7.UserRepository>()));
  gh.factory<_i11.SignInUsecase>(
      () => _i11.SignInUsecase(get<_i9.AuthRepository>()));
  gh.factory<_i12.SignInWithGoogleUseCase>(
      () => _i12.SignInWithGoogleUseCase(get<_i9.AuthRepository>()));
  gh.factory<_i13.SignUpUsecase>(
      () => _i13.SignUpUsecase(get<_i9.AuthRepository>()));
  return get;
}

class _$MainModule extends _i14.MainModule {}
