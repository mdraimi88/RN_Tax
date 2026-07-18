import 'package:intl/intl.dart';

class AppFormatter {
  AppFormatter._();

  static final NumberFormat _currency = NumberFormat.currency(
    locale: 'en_MY',
    symbol: 'RM ',
    decimalDigits: 2,
  );

  static final NumberFormat _number = NumberFormat.decimalPattern('en_MY');

  static final DateFormat _date = DateFormat('dd/MM/yyyy');

  static final DateFormat _dateTime = DateFormat('dd/MM/yyyy HH:mm');

  static String currency(double value) {
    return _currency.format(value);
  }

  static String number(num value) {
    return _number.format(value);
  }

  static String date(DateTime value) {
    return _date.format(value);
  }

  static String dateTime(DateTime value) {
    return _dateTime.format(value);
  }

  static String percentage(double value) {
    return '${(value * 100).toStringAsFixed(1)}%';
  }
}