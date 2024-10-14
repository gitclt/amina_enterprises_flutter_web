bool isModelValuesNullOrEmpty(dynamic model) {
  if (model == null) {
    return true;
  }

  if (model is Map<String, dynamic>) {
    return model.values.any((value) => value == null || value == "");
  }

  if (model is Iterable<dynamic>) {
    return model.any((item) => isModelValuesNullOrEmpty(item));
  }

  if (model is String) {
    return model.isEmpty;
  }

  return false;
}