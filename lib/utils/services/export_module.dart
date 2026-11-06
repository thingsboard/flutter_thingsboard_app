// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:intl/intl.dart';
import 'package:mime/mime.dart';

class TbDashboardExportModule {
  /// Reads a `blob:` download as the page clicks its link. The web UI
  /// revokes the URL right after the click (TB 4.2.1+), before
  /// [onDownloadStarting] could fetch it.
  static final blobDownloadScript = UserScript(
    injectionTime: UserScriptInjectionTime.AT_DOCUMENT_START,
    source: '''
(function () {
  const click = HTMLAnchorElement.prototype.click;
  HTMLAnchorElement.prototype.click = function () {
    if (!this.hasAttribute('download') || !this.href.startsWith('blob:')) {
      return click.call(this);
    }
    const filename = this.download;
    fetch(this.href)
      .then((response) => response.blob())
      .then((blob) => new Promise((resolve, reject) => {
        const reader = new FileReader();
        reader.onloadend = () => resolve([reader.result.split(',')[1], blob.type]);
        reader.onerror = reject;
        reader.readAsDataURL(blob);
      }))
      .then(([base64, type]) => window.flutter_inappwebview.callHandler(
        'downloadBase64', filename, base64, type || ''))
      .catch((error) => console.error('Error downloading blob:', error));
  };
})();
''',
  );

  void injectFileDownloadHandler(InAppWebViewController controller) {
    controller.addJavaScriptHandler(
      handlerName: 'downloadBase64',
      callback: (List<dynamic> args) {
        if (args.length >= 2 && args[0] is String && args[1] is String) {
          final String filename = args[0] as String;
          final String base64 = args[1] as String;
          final String? mimeType = args.length > 2 ? args[2] as String? : null;

          _downloadToDevice(filename, base64, mimeType);
        }
      },
    );
  }

  Future<void> _downloadToDevice(
    String filename,
    String base64, [
    String? mimeType,
  ]) async {
    final Uint8List data = await compute(base64Decode, base64);

    String finalFileName = filename.isNotEmpty
        ? filename
        : 'tb-file-export-${DateFormat('dd-MM-yyyy HH-mm-ss').format(DateTime.now())}';
    // Enhanced file extension handling
    if (!finalFileName.contains('.')) {
      String? extension;

      // First try to use provided MIME type
      if (mimeType != null && mimeType.isNotEmpty) {
        extension = _getExtensionFromMimeType(mimeType);
      }
      extension ??= 'bin';

      finalFileName = '$finalFileName.$extension';
    }

    saveWithFilePicker(finalFileName, data);
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
    final found = extensionFromMime(mimeType);
    if (found == mimeType) {
      return null; // No specific extension found
    }
    return found;
  }

  static Future<void> saveWithFilePicker(
    String filename,
    Uint8List bytes,
  ) async {
    await FilePicker.saveFile(
      dialogTitle: 'Please select an output file:',
      fileName: filename,
      bytes: bytes,
    );
  }

  /// Returns null: the response only configures the Windows download UI.
  DownloadStartResponse? onDownloadStarting(
    InAppWebViewController controller,
    DownloadStartRequest downloadStartRequest,
  ) {
    final downloadURL = downloadStartRequest.url.toString();
    if (downloadURL.startsWith('blob')) {
      controller.evaluateJavascript(
        source:
            '''
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
      return null;
    } else {
      throw UnimplementedError(
        'Download from URL $downloadURL is not supported.',
      );
    }
  }
}
