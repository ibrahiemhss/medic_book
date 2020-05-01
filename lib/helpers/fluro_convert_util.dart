import 'dart:convert';

/// fluro Parameter encoding and decoding tools
class FluroConvertUtils {
  /// fluroBefore passing AR parameters, convert first, fluro does not support Chinese passing
  static String fluroCnParamsEncode(String originalCn) {
    StringBuffer sb = StringBuffer();
    var encoded = Utf8Encoder().convert(originalCn);
    encoded.forEach((val) => sb.write('$val,'));
    return sb.toString().substring(0, sb.length - 1).toString();
  }

  /// fluro After passing, the parameters are taken out and parsed
  static String fluroCnParamsDecode(String encodedCn) {
    var decoded = encodedCn.split('[').last.split(']').first.split(',');
    var list = <int>[];
    decoded.forEach((s) => list.add(int.parse(s.trim())));
    return Utf8Decoder().convert(list);
  }
}
