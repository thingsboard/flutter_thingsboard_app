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
  /// Hands `blob:` downloads to the downloadBase64 handler. The web UI
  /// revokes a blob URL right after clicking its link (TB 4.2.1+), so those
  /// clicks are read at once; other blob downloads come via
  /// [onDownloadStarting].
  static final blobDownloadScript = UserScript(
    injectionTime: UserScriptInjectionTime.AT_DOCUMENT_START,
    source: '''
(function () {
  window.tbDownloadBlob = function (url, filename) {
    fetch(url)
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
  const click = HTMLAnchorElement.prototype.click;
  HTMLAnchorElement.prototype.click = function () {
    if (!this.hasAttribute('download') || !this.href.startsWith('blob:')) {
      return click.call(this);
    }
    window.tbDownloadBlob(this.href, this.download);
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
            'window.tbDownloadBlob(${jsonEncode(downloadURL)}, '
            '${jsonEncode(downloadStartRequest.suggestedFilename ?? '')});',
      );
      return null;
    } else {
      throw UnimplementedError(
        'Download from URL $downloadURL is not supported.',
      );
    }
  }
}
