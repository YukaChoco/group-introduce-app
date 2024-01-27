import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:group_introduce_project/domain/repository/firebase_storage.dart';

class FirebaseStorageRepositoy implements StorageRepository {
  FirebaseStorage storage = FirebaseStorage.instance;

  @override
  Future<String> downloadImage(String gsUrl) async {
    try {
      String filePath = gsUrl;
      String downloadUrl = await storage.refFromURL(filePath).getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print('Download image failed with error $e');
      rethrow; // re-throwing the exception to be handled by the caller
    }
  }
}

final storageRepositoryProvider = Provider<StorageRepository>((ref) {
  return FirebaseStorageRepositoy();
});
