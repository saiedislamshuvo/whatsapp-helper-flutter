import 'package:carrot/config/config.dart';
import 'package:carrot/providers/app_provider.dart';
import 'package:carrot/utils/dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  TextEditingController _whatsAppNumberCtrl = TextEditingController();

  launchWhatsApp(BuildContext context) async {
    if(await canLaunch(Config().whatsappEndpoint + _whatsAppNumberCtrl.text)) {
      await launch(Config().whatsappEndpoint + _whatsAppNumberCtrl.text);
    } else {
      AppDialog.showWhatsAppFailedAlert(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50),
                Container(
                  child: Text(
                    "Carrot",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: TextFormField(
                    controller: _whatsAppNumberCtrl,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(left: 10, top: 15),
                      border: InputBorder.none,
                      hintText: "WhatsApp number...",
                      suffixIcon: IconButton(
                        onPressed: () => _whatsAppNumberCtrl.clear(),
                        icon: Icon(Icons.refresh),
                      )
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 45,
                        child: ElevatedButton(
                          onPressed: () => launchWhatsApp(context),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.amberAccent,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            )
                          ),
                          child: Text(
                            "WhatsApp Now",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
