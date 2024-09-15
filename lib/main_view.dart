import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wishbunny/view/login/email_login_view.dart';
import 'package:wishbunny/view/login/join_mail_view.dart';
import 'package:wishbunny/view/login/join_profile_view.dart';
import 'package:wishbunny/view/login/login_view.dart';
import 'package:wishbunny/view/splash/splash_view.dart';
import 'package:wishbunny/view/tab/tab_view.dart';
import 'package:wishbunny/viewmodel/home/home_viewmodel.dart';
import 'package:wishbunny/viewmodel/login/join_viewmodel.dart';
import 'package:wishbunny/viewmodel/login/login_viewmodel.dart';
import 'package:wishbunny/viewmodel/login/mail_login_viewmodel.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final rootNavigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ///Login
        ChangeNotifierProvider(create: (context) => LoginViewModel()),
        ChangeNotifierProvider(create: (context) => MailLoginViewModel()),
        ChangeNotifierProvider(create: (context) => JoinViewModel()),

        /// Home
        ChangeNotifierProvider(create: (context) => HomeViewModel()),
      ],
      child: Stack(
        alignment: Alignment.center,
        children: [
          MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: '/',
            navigatorKey: rootNavigatorKey,
            navigatorObservers: [routeObserver],
            routes: {
              '/tabView': (context) => const TabView(),
              '/loginView': (context) => const LoginView(),
              '/mailLoginView': (context) => const MailLoginView(),
              '/joinMailView': (context) => const JoinMailView(),
              '/joinProfileView': (context) => const JoinProfileView(),
            },
            home: const SplashView(),
            builder: (context, child) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  textScaler: const TextScaler.linear(1.0),
                  boldText: false,
                ),
                child: child!,
              );
            },
          ),
        ],
      ),
    );
  }
}