class TextUIUtils {
  const TextUIUtils._();

  static String formatPrice(num price) {
    if (price == null) {
      return '-';
    } else if (price is int) {
      return price.toString();
    } else {
      return price.round().toString();
    }
  }

  static String addSuffix(String location, bool isSuffix) {
    if (location == null) {
      return null;
    } else if (!isSuffix) {
      return location;
    } else {
      return location + '*';
    }
  }

  static String formatPriceWithCurrency(num price, String currency) {
    return '${formatPrice(price)}${currency ?? '€'}';
  }
}
