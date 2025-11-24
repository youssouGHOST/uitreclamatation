import 'package:file_picker/file_picker.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';

class StorageService {
  /// Sélectionne un fichier (image ou PDF) et l’upload vers S3 (Storage v2)
  static Future<String?> uploadJustification() async {
    try {
      // Ouvre le sélecteur de fichiers
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'jpg', 'png'],
        withReadStream: true, // requis pour Storage v2
      );

      if (result == null) {
        safePrint("❌ Aucun fichier sélectionné");
        return null;
      }

      final platformFile = result.files.single;

      // ✅ Crée un StoragePath valide pour Storage v2
      final storagePath = StoragePath.fromString(
        'public/justifications/${DateTime.now().millisecondsSinceEpoch}_${platformFile.name}',
      );

      // ✅ Upload vers S3
      final uploadOp = Amplify.Storage.uploadFile(
        localFile: AWSFile.fromStream(
          platformFile.readStream!,
          size: platformFile.size,
        ),
        path: storagePath,
        onProgress: (progress) {
          safePrint(
              '📤 Progression : ${(progress.fractionCompleted * 100).toStringAsFixed(2)}%');
        },
      );

      final uploadResult = await uploadOp.result;

      // ✅ Récupère l’URL publique (convertir String → StoragePath)
      final getUrlOp = Amplify.Storage.getUrl(
        path: StoragePath.fromString(uploadResult.uploadedItem.path),
      );

      final getUrlResult = await getUrlOp.result;

      final fileUrl = getUrlResult.url.toString(); // Uri → String

      safePrint("✅ Upload réussi : $fileUrl");
      return fileUrl;
    } on StorageException catch (e) {
      safePrint('❌ Erreur lors de l’upload : ${e.message}');
      return null;
    }
  }
}  