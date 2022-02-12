import 'sfw.router.dart';

/// SFWConroller, SFW widget'ların yönetilmesi için kullanılmaktadır.
class SFWController
//  extends SFWRouter
{
  SFWController();

  /// view değişkeni [SWF] sınıfı tarafından tanımlanmaktadır.
  /// view değişkenine tanımlanan veri, [SWF] sıfının alt sınıfı olması gerekmektedir.
  dynamic view;

  /// Bu fonksiyon view'iniz build edildikten sonra çalışmaktadır.
  /// * @override ediniz.
  init() {}
}
