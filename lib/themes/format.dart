import 'package:intl/intl.dart';

extension IntX on int {
  // 整数をカンマ区切りの形式でフォーマットする
  String formatNumber() {
    final formatter = NumberFormat('#,###');
    return formatter.format(this);
  }

  /// 整数を固定小数点形式でフォーマットし、1000以上の場合は「k」を付加
  String formatNumberAsFixed({
    int fractionDigits = 1,
  }) {
    if (this >= 1000) {
      return '${(this / 1000).toStringAsFixed(fractionDigits)}k';
    }
    return toString();
  }
}
