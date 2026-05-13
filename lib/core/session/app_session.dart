import "package:flutter/foundation.dart";

// Classe para permitir o armazenamento em cache de algumas informações importantes
class AppSession {
  AppSession._();

  static final ValueNotifier<String?> userName = ValueNotifier<String?>(null);

  static String? get currentUserName => userName.value;

  static void saveUserName(String name) {
    userName.value = name.trim();
  }

  static void clear() {
    userName.value = null;
  }
}
