// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart' as _i6;
import 'package:firebase_auth/firebase_auth.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i7;
import 'package:injectable/injectable.dart' as _i2;

import 'data/datasources/auth_datasource.dart' as _i11;
import 'data/datasources/category_datasource.dart' as _i3;
import 'data/datasources/user_datasource.dart' as _i8;
import 'data/repositories/auth_repository.dart' as _i12;
import 'data/repositories/category_repository.dart' as _i4;
import 'data/repositories/user_repository.dart' as _i9;
import 'injection.dart' as _i13;
import 'utils/vadidator.dart' as _i10; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final mainModule = _$MainModule();
  gh.lazySingleton<_i3.CategoryDataSource>(() => _i3.CategoryDataSource());
  gh.lazySingleton<_i4.CategoryRepository>(
      () => _i4.CategoryRepository(get<_i3.CategoryDataSource>()));
  gh.factory<_i5.FirebaseAuth>(() => mainModule.getFirebaseAuth());
  gh.factory<_i6.FirebaseFirestore>(() => mainModule.getFirebaseFirestore());
  gh.factory<_i7.GoogleSignIn>(() => mainModule.getGoogleSignIn());
  gh.lazySingleton<_i8.UserDataSource>(
      () => _i8.UserDataSource(get<_i5.FirebaseAuth>()));
  gh.lazySingleton<_i9.UserRepository>(
      () => _i9.UserRepository(get<_i8.UserDataSource>()));
  gh.lazySingleton<_i10.Validator>(() => _i10.Validator());
  gh.lazySingleton<_i11.AuthDataSource>(() =>
      _i11.AuthDataSource(get<_i5.FirebaseAuth>(), get<_i7.GoogleSignIn>()));
  gh.lazySingleton<_i12.AuthRepository>(
      () => _i12.AuthRepository(get<_i11.AuthDataSource>()));
  return get;
}

class _$MainModule extends _i13.MainModule {}
