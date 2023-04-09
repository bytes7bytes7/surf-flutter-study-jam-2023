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
  Future<void> download({
    required Uri uri,
    required String filename,
    required OnLoadProgressChanged onLoadProgressChanged,
  }) async {
    final dir = await getApplicationDocumentsDirectory();
    final path = join(dir.path, filename);

    final response = await _dio.downloadUri(
      uri,
      path,
      options: Options(responseType: ResponseType.bytes),
      onReceiveProgress: onLoadProgressChanged,
    );

    if (response.statusCode != 200) {
      throw Exception('Status code is not 200');
    }
  }
}

@test
@Singleton(as: TicketStorageProvider)
class TestTicketStorageProvider implements TicketStorageProvider {
  final _rand = Random();

  @override
  Future<void> download({
    required Uri uri,
    required String filename,
    required OnLoadProgressChanged onLoadProgressChanged,
  }) async {
    if (_rand.nextBool()) {
      var current = 0;
      final total = (_rand.nextInt(95) + 5) * 1000000;
      final part = total ~/ 4;

      while (current < total) {
        await Future.delayed(const Duration(milliseconds: 800), () {
          current += part;
          current = min(current, total);

          onLoadProgressChanged(current, total);
        });
      }

      return;
    }

    throw Exception('Can not load file');
  }
}
