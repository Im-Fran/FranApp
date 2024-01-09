import 'dart:io';
import 'dart:math';

Future<bool> checkConnection() async {
  try {
    final result = await InternetAddress.lookup('google.com');
    return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
  } catch (e) {
    return false;
  }
}

T randomFromList<T>(List<T> list) {
  list.shuffle();
  return list[Random().nextInt(list.length)];
}

extension LetExtension<T> on T? {
  R let<R>(R Function(T) block) {
    if (this != null) {
      return block(this as T);
    }
    throw Exception('Object is null');
  }
}

extension SafeExtension<T> on T? {
  R? safe<R>(R Function(T) block) {
    if (this != null) {
      return block(this as T);
    }
    return null;
  }
}

