import 'dart:typed_data';
import 'dart:async';
import 'package:file_picker/file_picker.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:path/path.dart' as path;

class StorageService {
  static Future<String?> uploadJustification({String? apogee}) async {
    try {
      // Sélection du fichier
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'jpg', 'png'],
        withReadStream: true, // important pour Web
      );
      if (result == null) return null;

      final platformFile = result.files.single;

      // Apogee sécurisé
      String safeApogee = (apogee ?? "user").replaceAll(RegExp(r'[^a-zA-Z0-9_-]'), '_');

      // Extension du fichier
      String extension = path.extension(platformFile.name);

      // Clé S3 courte et sûre
      String key = 'public/justifications/${safeApogee}_${DateTime.now().millisecondsSinceEpoch}$extension';

      // Créer un stream pour AWSFile (fonctionne sur Web et Mobile)
      late Stream<List<int>> fileStream;
      int fileSize = 0;

      if (platformFile.bytes != null) {
        // Web: utiliser bytes pour créer le stream
        fileSize = platformFile.bytes!.length;
        fileStream = Stream.fromIterable([platformFile.bytes!]);
      } else if (platformFile.readStream != null) {
        // Mobile: utiliser readStream directement
        fileStream = platformFile.readStream!;
        fileSize = platformFile.size;
      } else {
        throw Exception("Impossible d'accéder au fichier pour l'upload");
      }

      final uploadOp = Amplify.Storage.uploadFile(
        localFile: AWSFile.fromStream(fileStream, size: fileSize),
        path: StoragePath.fromString(key),
        onProgress: (progress) {
          safePrint('📤 Progression : ${(progress.fractionCompleted * 100).toStringAsFixed(2)}%');
        },
      );

      final uploadResult = await uploadOp.result;

      // URL finale
      final getUrlOp = Amplify.Storage.getUrl(
        path: StoragePath.fromString(uploadResult.uploadedItem.path),
      );
      final getUrlResult = await getUrlOp.result;

      final fileUrl = getUrlResult.url.toString();
      safePrint("✅ Upload réussi : $fileUrl");

      return fileUrl;
    } on StorageException catch (e) {
      safePrint('❌ Erreur lors de l’upload : ${e.message}');
      return null;
    }
  }
}
