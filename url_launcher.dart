import 'dart:io';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncherUtils {
  static void launchURL(url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  static launchSystemMap(double lat, double lng) async {
    var mapLaunchUrl;
    if (Platform.isAndroid) {
      mapLaunchUrl =
          'https://www.google.com/maps/search/?api=1&query=$lat,$lng';
    } else if (Platform.isIOS) {
      mapLaunchUrl = 'https://maps.apple.com/?q=$lat,$lng';
    }
    if (await canLaunchUrl(Uri.parse(mapLaunchUrl))) {
      await launchUrl(Uri.parse(mapLaunchUrl));
    } else {
      throw 'Could not launch ' + mapLaunchUrl;
    }
  }
}
