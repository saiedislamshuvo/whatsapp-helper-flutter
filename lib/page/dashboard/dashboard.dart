import 'package:carrot/config/color.dart';
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
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> _formkey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (BuildContext context, AppProvider appProvider, Widget? child) {
        return Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: [
              TextButton(
                onPressed: () => AppDialog.showExitAlert(context),
                child: Text(
                  "Edit",
                  style: TextStyle(
                    fontSize: 18
                  ),
                ),
              )
            ],
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
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
                    Form(
                      key: _formkey,
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: TextFormField(
                              controller: appProvider.whatsAppNumberCtrl,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(left: 10, top: 15),
                                border: InputBorder.none,
                                hintText: "WhatsApp number...",
                                suffixIcon: IconButton(
                                  onPressed: () => appProvider.whatsAppNumberCtrl.clear(),
                                  icon: Icon(Icons.refresh),
                                )
                              ),
                              onTap: () => appProvider.setTyping(true),
                              validator: (String? value) {
                                if(value?.length != 11) return "Phone number must be 11 digit.";
                              },
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 45,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if(_formkey.currentState!.validate()) {
                                        _formkey.currentState?.save();
                                        appProvider.launchWhatsApp(context);
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: context.watch<AppProvider>().isTyping ? AppColor().primary : Colors.black87,
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
                  ],
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}
