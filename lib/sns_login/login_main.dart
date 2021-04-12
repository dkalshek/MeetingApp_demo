import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;

class LoginWidget extends StatelessWidget {
  const LoginWidget({Key key}) : super(key: key);

  // Flutterfire 부분(Google)
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    // Create a new credential
    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  // Flutterfire 부분(Facebook)
  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult result = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final FacebookAuthCredential facebookAuthCredential =
    FacebookAuthProvider.credential(result.accessToken.token);

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  // Glitch 서버인증 부분(Kakao)
  Future<UserCredential> signInWithKakao() async {
    final clientState = Uuid().v4();
    final url = Uri.https('kauth.kakao.com', '/oauth/authorize', {
      'response_type': 'code',
      'client_id': "ca24489b1bea699caaf6f4604b5c29de",
      'response_mode': 'form_post',
      'redirect_uri':
          'https://peppered-wooded-dilophosaurus.glitch.me/callbacks/kakao/sign_in',
      'state': clientState,
    });

    final result = await FlutterWebAuth.authenticate(
        url: url.toString(), callbackUrlScheme: "webauthcallback");

    final body = Uri.parse(result).queryParameters;
    //print(body);

    final tokenUrl = Uri.https('kauth.kakao.com', '/oauth/token', {
      'grant_type': 'authorization_code',
      'client_id': "ca24489b1bea699caaf6f4604b5c29de",
      'redirect_uri':
        'https://peppered-wooded-dilophosaurus.glitch.me/callbacks/kakao/sign_in',
      'code': body['code'],
    });
    var response = await http.post(tokenUrl);
    Map<String,dynamic> accessTokenResult = json.decode(response.body);
    print(accessTokenResult['accees_token']);
    var responseCustomToken = await http.post(
        Uri.parse('https://peppered-wooded-dilophosaurus.glitch.me/callbacks/kakao/token'), // string -> Uri
        body: {'accessToken':accessTokenResult['access_token']});  // access token

  return await FirebaseAuth.instance.
      signInWithCustomToken(responseCustomToken.body);
  }

  // Glitch 서버인증 부분(Naver)
  Future<UserCredential> signInWithNaver() async {
    final clientState = Uuid().v4();
    final url = Uri.https('nid.naver.com', '/oauth2.0/authorize', {
      'response_type': 'code',
      'client_id': "1ALvGtYAixLNVBP7n2gA",
      'response_mode': 'form_post',
      'redirect_uri':
      'https://peppered-wooded-dilophosaurus.glitch.me/callbacks/naver/sign_in',
      'state': clientState,
    });

    final result = await FlutterWebAuth.authenticate(
        url: url.toString(), callbackUrlScheme: "webauthcallback");

    final body = Uri.parse(result).queryParameters;
    //print(body);

    final tokenUrl = Uri.https('nid.naver.com', '/oauth2.0/token', {
      'grant_type': 'authorization_code',
      'client_id': "1ALvGtYAixLNVBP7n2gA",
      'client_secret': "Yot36BwcE4",
      'state': clientState,
      'code': body['code'],
    });
    var response = await http.post(tokenUrl);
    Map<String,dynamic> accessTokenResult = json.decode(response.body);
    print(accessTokenResult['accees_token']);
    var responseCustomToken = await http.post(
        Uri.parse('https://peppered-wooded-dilophosaurus.glitch.me/callbacks/naver/token'), // string -> Uri
        body: {'accessToken':accessTokenResult['access_token']});  // access token

    return await FirebaseAuth.instance.
    signInWithCustomToken(responseCustomToken.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SNS Login")
        ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton(
              color: Colors.grey.withOpacity(0.3),
              child: Text("Google Login"),
              onPressed: signInWithGoogle, // Flutterfire 참조
            ),
            FlatButton(
              color: Colors.grey.withOpacity(0.3),
              child: Text("Facebook Login"),
              onPressed: signInWithFacebook, // Flutterfire 참조
            ),
            FlatButton(
              color: Colors.grey.withOpacity(0.3),
              child: Text("Kakao Login"),
              onPressed: signInWithKakao, // Flutterfire 참조
            ),
            FlatButton(
              color: Colors.grey.withOpacity(0.3),
              child: Text("Naver Login"),
              onPressed: signInWithNaver, // Flutterfire 참조
            ),
           ],
         ),
       ),
      );
    }
}