class ObjectUtils {
  const ObjectUtils._();

  static O extract<I, O>(I object, ObjectBuilder<I, O> f,
      [ObjectError<O> err]) {
    try {
      return f(object);
    } catch (e) {
      if (err != null) {
        return err(e);
      }
      return null;
    }
  }
}

typedef ObjectBuilder<A, B> = B Function(A object);
typedef ObjectError<O> = O Function(Object e);
