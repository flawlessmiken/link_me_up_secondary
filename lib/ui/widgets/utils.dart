import 'package:intl/intl.dart';

String capitalizeFirstText(String value) {
  var result = value[0].toUpperCase();
  for (int i = 1; i < value.length; i++) {
    if (value[i - 1] == " ") {
      result = result + value[i].toUpperCase();
    } else {
      result = result + value[i];
    }
  }
  return result;
}



String convertStringToCurrency(String balanceString) {
  // Parse the balance string as a double
  double balance = double.tryParse(balanceString) ?? 0.0;

  // Create a NumberFormat instance with comma-separated thousands
  NumberFormat formatter = NumberFormat("#,##0.00", "en_US");

  // Format the balance as a string with the thousands separator
  String formattedBalance = formatter.format(balance);

  return "\$$formattedBalance";
}