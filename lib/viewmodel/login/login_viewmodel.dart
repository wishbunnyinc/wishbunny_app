import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';

class LoginViewModel with ChangeNotifier {

  Future<void> kakaoLogin() async {
    /// 카카오 로그인
    if (await isKakaoTalkInstalled()) { // 카카오 앱 설치된 상태 -> 앱 실행
      try {
        await UserApi.instance.loginWithKakaoTalk();
        AccessTokenInfo tokenInfo = await UserApi.instance.accessTokenInfo();
        print("kakao-token-$tokenInfo");
      } catch (error) {
        // 사용자가 카카오톡 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우,
        // 의도적인 로그인 취소로 보고 카카오계정으로 로그인 시도 없이 로그인 취소로 처리 (예: 뒤로 가기)
        if (error is PlatformException && error.code == 'CANCELED') {
          print("kakao-error-$error");
          return;
        }
        try {
          await UserApi.instance.loginWithKakaoAccount();
          AccessTokenInfo tokenInfo = await UserApi.instance.accessTokenInfo();
          print("kakao-token-$tokenInfo");
        } catch (error) {
          print("kakao-error-$error");
        }
      }
    } else { // 카카오 앱 설치되지 않은 상태 -> 웹뷰 실행
      try {
        await UserApi.instance.loginWithKakaoAccount();
        AccessTokenInfo tokenInfo = await UserApi.instance.accessTokenInfo();
        print("kakao-token-$tokenInfo");
      } catch (error) {
        print("kakao-error-$error");
      }
    }
  }

  Future<void> naverLogin() async {
    try {
      final NaverLoginResult result = await FlutterNaverLogin.logIn();
      if (result.status == NaverLoginStatus.loggedIn) {
        print("naver-token-$result");
      } else {
        print("naver-error-invalid");
      }
    } catch (error) {
      print("naver-error-$error");
    }
  }

  Future<void> facebookLogin() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login(permissions: ["public_profile"]);
      if (result.status == LoginStatus.success) {
        print("facebook-token-${result.accessToken?.userId}");
        print("facebook-token-${result.accessToken?.applicationId}");
        print("facebook-token-${result.accessToken?.token}");
      } else {
        print("facebook-error-${result.message}");
      }
    } catch (error) {
      print("facebook-error-$error");
    }
  }
}
