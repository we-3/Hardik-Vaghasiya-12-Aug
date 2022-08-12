import 'package:url_launcher/url_launcher.dart';

// ignore: unused_element
_launchURLApp() async {
const url = 'https://www.geeksforgeeks.org/';
if (await canLaunch(url)) {
	await launch(url, forceSafariVC: true, forceWebView: true);
} else {
	throw 'Could not launch $url';
}
}
