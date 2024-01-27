import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:group_introduce_project/domain/usecase/firebase_storage.dart';

class FirebaseStorageImage extends ConsumerWidget {
  const FirebaseStorageImage({Key? key, required this.gsUrl}) : super(key: key);

  final String gsUrl;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageUrl = ref.watch(downloadImageUsecaseProvider(gsUrl));
    return imageUrl.when(
      data: (imageUrl) => Container(
        width: 50.0, //ここに適切なサイズを設定してください。
        height: 50.0, //ここに適切なサイズを設定してください。
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
          ),
          shape: BoxShape.rectangle,
        ),
      ),
      loading: () =>
          const CircularProgressIndicator(), // Show loading spinner while waiting
      error: (_, __) => const Icon(Icons.error), // Show some error state
    );
  }
}
