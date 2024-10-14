class Validators {
  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$',
  );

  static String? validateEmail(dynamic value) {
  
    if (value.isNotEmpty && !_emailRegExp.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }
}
