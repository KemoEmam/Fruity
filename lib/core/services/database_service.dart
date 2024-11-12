abstract class DatabaseService {
  Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
      String? docId});

  //fetch data
  Future<Map<String, dynamic>> getData(
      {required String path, required String docId});

//check if data exists
  Future<bool> checkIfDataExists({required String path, required String docId});
}
