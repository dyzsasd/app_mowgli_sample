class IterableUtils {
  static bool isListOfStrings<T>(List<T> list, [bool acceptNull = false]) {
    if (list == null) {
      return false;
    } else if (list.length == 0) {
      return true;
    } else {
      for (T item in list) {
        if (item == null) {
          if (!acceptNull) {
            return false;
          } else {
            continue;
          }
        } else if (item is! String) {
          return false;
        }
      }

      return true;
    }
  }

  static int length<T>(Iterable<T> it) {
    if (isEmpty(it)) {
      return 0;
    } else {
      return it.length;
    }
  }

  static bool isListOfMaps(Object obj) {
    if (obj == null) {
      return false;
    } else if (obj is List) {
      return obj.where((Object item) {
            return item is! Map;
          }).length ==
          0;
    }
    return false;
  }

  static bool startsWith(List<String> list, String value) {
    for (String item in list) {
      if (item.startsWith(value)) {
        return true;
      }
    }
    return false;
  }

  static bool isEmpty<T>(Iterable<T> list) {
    return list == null || list.isEmpty;
  }

  static bool isNotEmpty<T>(Iterable<T> list) {
    return list != null && list.isNotEmpty;
  }

  static bool containsAtLeastOneElement<T>(Iterable<T> it1, Iterable<T> it2) {
    if (it1 == null || it2 == null) {
      return false;
    }

    return it1.firstWhere((T element) => it2.contains(element),
            orElse: () => null) !=
        null;
  }
}

extension IterableExtensions<E> on Iterable<E> {
  int position(E element) {
    int position = 0;

    for (E item in this) {
      if (item == element) {
        return position;
      }

      position++;
    }

    return -1;
  }

  bool containsWhere(bool test(E element)) {
    return firstWhere(test, orElse: () => null) != null;
  }
}

extension IterableIterableExtensions<E> on Iterable<Iterable<E>> {
  bool containsElement(E element) {
    for (Iterable<E> iterable in this) {
      if (iterable?.contains(element) ?? false) {
        return true;
      }
    }
    return false;
  }

  bool containsWhere(bool test(E element)) {
    for (Iterable<E> iterable in this) {
      if (iterable?.containsWhere(test) ?? false) {
        return true;
      }
    }
    return false;
  }
}
