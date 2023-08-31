import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:tellus_web/RouteNames.dart';
import 'package:tellus_web/privacy_page.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const Color brandColor = Color.fromRGBO(0, 137, 123, 1);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tellus',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
          useMaterial3: true, primaryColor: brandColor, fontFamily: 'Euclid'),
      initialRoute: RoutesName.homePageRoute,
      routes: {
        RoutesName.homePageRoute : (context) => const MyHomePage(title: "tellus"),
        RoutesName.privacyPageRoute: (context) => const PrivacyPage()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(
              height: 40,
              width: 40,
              child: Image(image: AssetImage('images/tellus.png')),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                widget.title,
                style: const TextStyle(
                    color: Colors.white, fontFamily: "Euclid", fontSize: 28),
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(RoutesName.privacyPageRoute);
                },
                child: const Text(
                  "Privacy policies",
                  style: TextStyle(color: Colors.white),
                )),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      const Text(
                        'Tellus',
                        style: TextStyle(fontSize: 50),
                      ),
                      const Text(
                        'Earthquake detector',
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          html.window.open(
                              'https://play.google.com/store/apps/details?id=com.salvatore.devita.earthquakesafe',
                              'new tab');
                        },
                        child: const SizedBox(
                          height: 100,
                          width: 300,
                          child: Image(
                            image: AssetImage('images/google_play_badge.png'),
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(
                        width: 200,
                        child: Image(
                          image: AssetImage('images/tellus_frame.png'),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Row(
        children: const [],
      ),
    );
  }
}
