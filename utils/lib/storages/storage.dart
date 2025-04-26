abstract interface class Storage {
  void init();

  String? read({required String key});

  void write({required String key, required String value});

  void delete({required String key});

  void deleteAll();
}
