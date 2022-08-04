import 'package:whatsapp_helper/config/config.dart';
import 'package:whatsapp_helper/utils/dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

class AppProvider extends ChangeNotifier {

  TextEditingController _whatsAppNumberCtrl = TextEditingController();
  TextEditingController get whatsAppNumberCtrl => _whatsAppNumberCtrl;

  TextEditingController _countryCodeCtrl = TextEditingController(text: '88');
  TextEditingController get countryCodeCtrl => _countryCodeCtrl;

  launchWhatsApp(BuildContext context) async {
    String str = Config.whatsappEndpoint + _countryCodeCtrl.text + _whatsAppNumberCtrl.text;
    if (await canLaunch(str)) {
      await launch(str);
    } else {
      AppDialog.showWhatsAppFailedAlert(context);
    }
  }
}
