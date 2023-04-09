import 'dart:math';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import '../../application/providers/ticket_storage_provider.dart';

@prod
@Singleton(as: TicketStorageProvider)
class ProdTicketStorageProvider implements TicketStorageProvider {
  const ProdTicketStorageProvider(this._dio);

  final Dio _dio;

  @override
  Future<List<int>> download({
    required Uri uri,
    required String filename,
  }) async {
    final dir = await getApplicationDocumentsDirectory();
    final path = join(dir.path, filename);
    final response = await _dio.downloadUri(
      uri,
      path,
      options: Options(responseType: ResponseType.bytes),
    );

    if (response.statusCode == 200) {
      return response.data;
    }

    throw Exception('Status code is not 200');
  }
}

@test
@Singleton(as: TicketStorageProvider)
class TestTicketStorageProvider implements TicketStorageProvider {
  final _rand = Random();

  @override
  Future<List<int>> download({
    required Uri uri,
    required String filename,
  }) async {
    if (_rand.nextBool()) {
      return [1];
    }

    throw Exception('Can not load file');
  }
}
