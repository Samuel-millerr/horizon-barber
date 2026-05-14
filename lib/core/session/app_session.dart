import "package:flutter/foundation.dart";

// Classe para permitir o armazenamento em cache de algumas informações importantes
class AppSession {
  AppSession._();

  static final ValueNotifier<String?> username = ValueNotifier<String?>(null);

  static String? get currentUsername => username.value;

  static void saveUserName(String name) {
    username.value = name.trim();
  }

  static void clear() {
    username.value = null;
  }
}
