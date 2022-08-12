import 'package:google_sign_in/google_sign_in.dart';
import 'package:rbkei/Home_Page.dart';


class GoogleSignInApi {
  static  final _googleSignIn = GoogleSignIn();

  static Future<GoogleSignInAccount?> Home_Page() => _googleSignIn.signIn();

}