import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

import 'main_view.dart';

void main() {

  Future<void> setKakaoSDK() async {
    // 웹 환경에서 카카오 로그인을 정상적으로 완료하려면 runApp() 호출 전 아래 메서드 호출 필요
    WidgetsFlutterBinding.ensureInitialized();

    // runApp() 호출 전 Kakao SDK 초기화
    KakaoSdk.init(
      nativeAppKey: '${"ae432b6640162c59d720dd2f60bff8f4"}',
      javaScriptAppKey: '${"b5372ae818230755352250310d418b06"}',
    );
  }

  /// 초기 환경 셋팅
  setKakaoSDK();

  runApp(
      MyApp()
  );
}

