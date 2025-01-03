import 'package:intl/intl.dart';

String formatCurrency(num amount,
    {String locale = 'id', String symbol = 'Rp'}) {
  final formatter =
      NumberFormat.currency(locale: locale, symbol: symbol, decimalDigits: 0);
  return formatter.format(amount);
}
