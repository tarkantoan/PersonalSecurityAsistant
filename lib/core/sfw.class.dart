import 'package:flutter/material.dart';

import 'swf.controller.class.dart';

/// Bu class bir stateful widget'tır. SFWController ile beraber kullanılmalıdır.
class SFW extends StatefulWidget with ChangeNotifier {
  List<Widget> activeRoutes = [];

  SFW({required this.controller, Key? key}) : super(key: key) {
    controller.view = this;
  }

  /// Bu widget'ın controller'ına erişmek için kullanılır.
  /// Widget oluşturulurken içine aktarılan  @controller parametresiyle otomatik tanımlanır.
  dynamic controller;

  /// controller'In SFWController'a cast edilmiş halidir. State üzerinde kullanılmıştır.
  SFWController get _getController => (controller as SFWController);

  /// Bu widget'ın state'i dir
  ///
  /// state.context ile context kullanılır.
  State state = SFWB();

  /// Build() fonksiyonunu çalıştırır geriye widget döndürür, state'e etkisi yoktur.
  Widget get getWidget => build();

  /// Build edildikten sonra isBuilded'ten sonra çalışmaktadır.
  /// * Dışarıdan atama yapılabilir.
  /// * @override edilebilir.
  Function isBuildedCallbackFunction = () {};

  /// widget'ınız build edildikten sonra çalışır
  /// * @override ediniz.
  isBuilded() {}

  /// state oluşturulduğunda çalışır
  /// * @override ediniz.
  initState() {}

  /// state oluşturur stateful widget'ın varsayılanıdır.
  @override
  State createState() => state;

  /// View'inizde gösterilecek widgetları döndürür. default olarak [_noWidgetAsigned] döndürülür.
  /// aşağıdaki fonksiyonu, sınıfınızda kullanarak view'inizde widgetlarınızı kullanabilirsiniz.
  ///
  /// * @override
  /// * Widget build() {
  /// * return Text("My Text widget");
  /// * }
  ///
  /// * @override ediniz.
  @override
  Widget build() {
    return _noWidgetAsigned();
  }

  /// widget ataması yapılmadığında view'inizde döndürülen hata widget'ıdır.
  Widget _noWidgetAsigned() {
    return Text("Widget not assigned" + " in " + this.runtimeType.toString());
  }
}

class SFWB extends State<SFW> {
  isBuilded(Duration duration) {
    widget.isBuilded();
    widget.isBuildedCallbackFunction();
    widget._getController.init();
  }

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback(isBuilded);
    widget.initState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("Build State");
    return widget.build();
  }
}
