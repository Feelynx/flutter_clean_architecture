class Validator<T> {
  final List<String? Function(T)> _validators;

  Validator(this._validators);

  String? validate(T value) {
    for (var validator in _validators) {
      final result = validator(value);
      if (result != null) {
        return result;
      }
    }
    return null;
  }
}
