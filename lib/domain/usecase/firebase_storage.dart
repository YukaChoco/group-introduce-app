import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:group_introduce_project/data/repository/firebase_storage.dart';
import 'package:group_introduce_project/domain/repository/firebase_storage.dart';

class DownloadImageUsecase {
  final StorageRepository _repository;

  DownloadImageUsecase(this._repository);

  Future<String> call(String path) async {
    return await _repository.downloadImage(path);
  }
}

final downloadImageUsecaseProvider =
    FutureProvider.family<String, String>((ref, gsUrl) {
  final repository = ref.read(storageRepositoryProvider);
  return DownloadImageUsecase(repository).call(gsUrl);
});
