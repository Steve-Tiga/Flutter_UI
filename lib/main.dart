import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'index.dart';
import 'package:oktoast/oktoast.dart';
import 'provider/locale_provider.dart';
import 'provider/theme_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return OKToast(
        child: MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => LocaleProvider())],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: IndexPage(),
          ),
        ),
        /// Toast 配置
        backgroundColor: Colors.black54,
        textPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        radius: 20.0,
        position: ToastPosition.top);
  }
}
