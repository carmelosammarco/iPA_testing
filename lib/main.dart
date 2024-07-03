import 'package:flutter/material.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

void main() {
  runApp(const The3DBAY());
}

class The3DBAY extends StatelessWidget {
  const The3DBAY({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late WebViewControllerPlus _controler;

  @override
  void initState() {
    _controler = WebViewControllerPlus()
      ..loadFlutterAssetServer('assets/website/index.html')
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 29, 49, 225),
        title: const Text(''), 
        leadingWidth: 100,
        leading: IconButton(
          onPressed: () => {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MainPage()))
        }, 
            icon: const Icon(Icons.home, size: 40,),
            color: Colors.white),

        //leading: const Icon(Icons.menu),
        //leading: Image.asset('assets/website/3dbay.jpg'),

        //actions: [

          //IconButton(
            //onPressed: () => {}, 
            //icon: const Icon(Icons.star),
            //color: Colors.white),

          //IconButton(
            //onPressed: () => {}, 
            //icon: const Icon(Icons.exit_to_app),
            //color: Colors.white),
       // ],

      ),

      body: WebViewWidget(
              controller: _controler,
            ),
          );
  }

  @override
  void dispose() {
    _controler.server.close();
    super.dispose();
  }
}