import 'package:flutter/material.dart';

/// Rota sınıfı
class cRouter {
  /// Main context'i tutar. Rota için kullanılır.
  static BuildContext? context;

  /// İçine gönderilen widget'i ekrana getirir
  /// [Navigator] ve [MaterialPageRoute] ile yönlendirme yapar.
  static push(Widget widget) {
    if (context == null) {}
    Navigator.of(context!).push(
      MaterialPageRoute(
        builder: (_) => widget,
      ),
    );
  }

  /// İçine gönderilen widget'i ekrana getirir
  /// [Navigator] ve [MaterialPageRoute] ile yönlendirme yapar.
  /// Önceki widget'a dönmeyi engeller ve stackten siler
  static pushAndRemoveUntil(Widget widget) {
    Navigator.of(context!).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (_) => widget,
        ),
        (route) => false);
  }

  /// Bir önceki widget'a geri dönmeyi sağlar.
  static pop() {
    Navigator.of(context!).pop();
  }
}
