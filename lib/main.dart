import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // CookieRequest dari versi paketan yang kamu gunakan tidak menerima baseUrl pada konstruktor.
    // Jadi buat instance tanpa argumen dan gunakan URL penuh langsung di login/register.
    CookieRequest request = CookieRequest();

    return Provider<CookieRequest>.value(
      value: request,
      child: MaterialApp(
        title: 'Endorphins',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
              .copyWith(secondary: Colors.blueAccent[400]),
        ),
        home: const LoginPage(),
      ),
    );
  }
}
