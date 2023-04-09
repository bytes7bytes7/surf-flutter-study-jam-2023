abstract class TicketStorageProvider {
  Future<List<int>> download({
    required Uri uri,
    required String filename,
  });
}
