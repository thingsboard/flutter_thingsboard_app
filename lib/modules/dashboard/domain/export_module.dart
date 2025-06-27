import 'dart:convert';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:intl/intl.dart';
import 'package:mime/mime.dart';

class TbDashboardExportModule {
  void injectFileDownloadHandler(InAppWebViewController controller) {
    controller.addJavaScriptHandler(
      handlerName: 'downloadBase64',
      callback: (List<dynamic> args) {
        if (args.length >= 2 && args[0] is String && args[1] is String) {
          final String filename = args[0] as String;
          final String base64 = args[1] as String;
          final String? mimeType = args.length > 2 ? args[2] as String? : null;

          // Here you can use what you want to download the file.
          _downloadToDevice(filename, base64, mimeType);
        }
      },
    );
  }

  Future<void> _downloadToDevice(String filename, String base64,
      [String? mimeType,]) async {
    final Uint8List data = await compute(base64Decode, base64);

    String finalFileName = 'tb-file-export-${DateFormat('dd-MM-yyyy HH-mm-ss').format(DateTime.now()) }';
if(finalFileName.contains('.') && mimeType != null && mimeType.isNotEmpty) {
      finalFileName = finalFileName.split('.').first;
    }
    // Enhanced file extension handling
    if (!finalFileName.contains('.')) {
      String? extension;

      // First try to use provided MIME type
      if (mimeType != null && mimeType.isNotEmpty) {
        extension = _getExtensionFromMimeType(mimeType);
      }

      // If still no extension, try content-based detection
      extension ??= 'bin';

      finalFileName = '$finalFileName.$extension';
    }

    _saveWithFilePicker(finalFileName, data);
  }

  // Helper method to get extension from MIME type
  String? _getExtensionFromMimeType(String mimeType) {
    final csvTypes = [
      'text/csv',
      'attachament/csv',
      'attachment/csv',
      'application/csv',
    ];
    if (csvTypes.contains(mimeType.toLowerCase())) {
      return 'csv';
    }
    final found =  extensionFromMime(mimeType);
    if (found == mimeType) {
      return null; // No specific extension found
    }
    return found;
    
  }

  Future<void> _saveWithFilePicker(String filename, Uint8List bytes) async {
    final String? outputFile = await FilePicker.platform.saveFile(
        dialogTitle: 'Please select an output file:',
        fileName: filename,
        bytes: bytes,);

    if (outputFile == null) {
      // User canceled the picker
    }
  }

  void onDownloadStartRequest(
    InAppWebViewController controller,
    DownloadStartRequest downloadStartRequest,
  ) {
    final downloadURL = downloadStartRequest.url.toString();
    if (downloadURL.startsWith('blob')) {
      controller.evaluateJavascript(
        source: '''
        function flutterBlobToBase64(blob) {
          return new Promise((resolve, reject) => {
            const reader = new FileReader();
            reader.onloadend = () => {
              const base64data = reader.result.split(',')[1];
              resolve(base64data);
            };
            reader.onerror = reject;
            reader.readAsDataURL(blob);
          });
        }
        
        async function flutterBlobDownload(filename, blobUrl) {
          try {
            const response = await fetch(blobUrl);
            const blob = await response.blob();
            
            const base64 = await flutterBlobToBase64(blob);
            
            // Get the MIME type from the blob
            const mimeType = blob.type || '';
            
            window.flutter_inappwebview.callHandler(
              'downloadBase64',
              filename,
              base64,
              mimeType
            );
          } catch (error) {
            console.error('Error downloading blob:', error);
          }
        }
        flutterBlobDownload("${downloadStartRequest.suggestedFilename ?? ''}", "$downloadURL");
      ''',
      );
    } else {
      throw UnimplementedError(
        'Download from URL $downloadURL is not supported.',
      );
    }
  }
}
