import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

class ConnectivityUtils {
  static showNoNetworkDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("No internet available"),
            actions: <Widget>[
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text("Close"),
              ),
            ],
          );
        });
  }

  static Future<bool> isConnectedToInternet(BuildContext context) async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      return true;
    } else {
      showNoNetworkDialog(context);
      return false;
    }
  }
}
