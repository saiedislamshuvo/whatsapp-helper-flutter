import 'package:carrot/config/config.dart';
import 'package:carrot/utils/dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class AppProvider extends ChangeNotifier {

  bool _isTyping = false;
  bool get isTyping => _isTyping;
  
  void setTyping(bool value) {
    this._isTyping = value;
    notifyListeners();
  }

  TextEditingController _whatsAppNumberCtrl = TextEditingController();
  TextEditingController get whatsAppNumberCtrl => _whatsAppNumberCtrl;

  launchWhatsApp(BuildContext context) async {
    if(await canLaunch(Config().whatsappEndpoint + _whatsAppNumberCtrl.text)) {
      await launch(Config().whatsappEndpoint + _whatsAppNumberCtrl.text);
    } else {
      AppDialog.showWhatsAppFailedAlert(context);
    }
  }
}