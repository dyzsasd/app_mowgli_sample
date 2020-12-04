class ListUtils {
  /// Convert a List of [object] to a List of another type
  static List<O> toListFromObject<I, O>(
      Iterable<I> object, ListItemBuilder<I, O> f,
      {ListError onError,
      bool returnNonNullList = false,
      bool acceptNullItems = false}) {
    try {
      if (object != null) {
        List<O> list = <O>[];

        for (I item in object) {
          if (acceptNullItems == true || item != null) {
            addNonNull(list, f(item));
          }
        }

        return list;
      }

      if (returnNonNullList == true) {
        return List<O>(0);
      } else {
        return null;
      }
    } catch (e, trace) {
      if (onError != null) {
        return onError(e, trace);
      } else {
        return null;
      }
    }
  }

  static void addNonNull<T>(List<T> list, T value) {
    if (value != null) {
      list.add(value);
    }
  }
}

typedef ListMapItemBuilder<T> = T Function(Map<String, Object> object);
typedef ListItemBuilder<I, O> = O Function(I object);
typedef ListError<O> = List<O> Function(Object e, StackTrace trace);

extension ListUtilsExtension<T> on List<T> {
  void addNonNull<T>(T value) {
    ListUtils.addNonNull(this, value);
  }

  void replace(int position, T element) {
    removeAt(position);
    insert(position, element);
  }
}
