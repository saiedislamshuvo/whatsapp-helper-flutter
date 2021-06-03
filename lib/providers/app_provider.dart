import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

class AppProvider extends ChangeNotifier {

  TextEditingController _whatsAppNumberCtrl = TextEditingController();
  TextEditingController get whatsAppNumberCtrl => _whatsAppNumberCtrl;
}