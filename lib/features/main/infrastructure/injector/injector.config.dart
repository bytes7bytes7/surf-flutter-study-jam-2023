// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../ticket_storage/application/blocs/ticket_storage/ticket_storage_bloc.dart'
    as _i6;
import '../../../ticket_storage/application/providers/ticket_storage_provider.dart'
    as _i4;
import '../../../ticket_storage/infrastructure/app_providers/ticket_storage_provider.dart'
    as _i5;
import '../third_party/dio_module.dart' as _i7;

const String _prod = 'prod';
const String _test = 'test';

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final dioModule = _$DioModule();
  gh.singleton<_i3.Dio>(dioModule.dio);
  gh.singleton<_i4.TicketStorageProvider>(
    _i5.ProdTicketStorageProvider(gh<_i3.Dio>()),
    registerFor: {_prod},
  );
  gh.singleton<_i4.TicketStorageProvider>(
    _i5.TestTicketStorageProvider(),
    registerFor: {_test},
  );
  gh.factory<_i6.TicketStorageBloc>(
      () => _i6.TicketStorageBloc(gh<_i4.TicketStorageProvider>()));
  return getIt;
}

class _$DioModule extends _i7.DioModule {}
