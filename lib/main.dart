import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

String baseUrl = 'https://flutter.io';

Future main() async => runApp(MyApp());

class MyApp extends StatelessWidget {
  final flutterWebViewPlugin = FlutterWebviewPlugin();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter WebView Demo',
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      routes: {
        '/': (_) {
          return WebviewScaffold(
            url: baseUrl,
            appBar: AppBar(
              title: const Text('My WebView'),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.power_settings_new),
                  onPressed: () {
                    flutterWebViewPlugin.goBack()?? SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                  },
                ),
              ],
            ),
            withZoom: true,
            withLocalStorage: true,
            hidden: true,
            initialChild: Container(
              color: Colors.blueAccent,
              child: const Center(
                child: Text('Loading.....'),
              ),
            ),
            bottomNavigationBar: BottomAppBar(
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      flutterWebViewPlugin.goBack();
                    },
                  ),
                  new Spacer(),
                  IconButton(
                    icon: const Icon(Icons.autorenew),
                    onPressed: () {
                      flutterWebViewPlugin.reload();
                    },
                  ),
                  new Spacer(),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward_ios),
                    onPressed: () {
                      flutterWebViewPlugin.goForward();
                    },
                  ),
                ],
              ),
            ),
          );
        },
      },
    );
  }
}
