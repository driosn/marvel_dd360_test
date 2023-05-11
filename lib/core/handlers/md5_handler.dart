import 'dart:convert';

import 'package:crypto/crypto.dart';

import '../env/env.dart';

class MD5Handler {
  MD5CryptResult encryptForApiUse() {
    final timeStamp = '${DateTime.now().millisecondsSinceEpoch ~/ 1000}';
    final result = md5
        .convert(
          utf8.encode('$timeStamp${Env.privateKey}${Env.publicKey}'),
        )
        .toString();
    return MD5CryptResult(
      timeStamp: timeStamp,
      result: result,
    );
  }
}

class MD5CryptResult {
  const MD5CryptResult({
    required this.timeStamp,
    required this.result,
  });

  final String timeStamp;
  final String result;
}
