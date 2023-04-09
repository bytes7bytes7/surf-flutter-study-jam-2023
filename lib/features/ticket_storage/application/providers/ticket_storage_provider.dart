typedef OnLoadProgressChanged = void Function(int current, int total);

abstract class TicketStorageProvider {
  Future<List<int>> download({
    required Uri uri,
    required String filename,
    required OnLoadProgressChanged onLoadProgressChanged,
  });
}
