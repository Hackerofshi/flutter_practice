


import 'package:simple_rsa/simple_rsa.dart';

class Encrypt {

    static Future<String> encrypt(String text) async {
      final PUBLIC_KEY =
          "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDWKR9UVOW9xRM/zNkfFPhXpZHL4XJ7Vyr9iYpBYaox9EyPNhLApFiY1SWyn9v8yJO/"
          "dnTjAXZF8mIkyheaz7m7wIb7TsOU8TriJBII5mVDh4KwW1vM6N9HGNzSGfL2Hi0hL3vEa6fJ1e0n4JDAWSaPF1Ddu/1MHgAVasSnPmhYoQIDAQAB";
      final tmp = await encryptString(
          text, PUBLIC_KEY);
      return tmp;
    }

}
