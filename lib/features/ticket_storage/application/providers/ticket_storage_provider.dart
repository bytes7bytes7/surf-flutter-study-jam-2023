typedef OnLoadProgressChanged = void Function(int current, int total);

abstract class TicketStorageProvider {
  Future<void> download({
    required Uri uri,
    required String filename,
    required OnLoadProgressChanged onLoadProgressChanged,
  });
}
