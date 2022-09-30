import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ShareLinkDemo extends StatefulWidget {
  const ShareLinkDemo({Key? key}) : super(key: key);

  @override
  State<ShareLinkDemo> createState() => _ShareLinkDemoState();
}

class _ShareLinkDemoState extends State<ShareLinkDemo> {
  TextEditingController link = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              TextField(
                controller: link,
              ),
              SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () {
                    if (link.text.isEmpty) {
                      print('link is empty');
                    } else {
                      Share.share(link.text);
                    }
                  },
                  child: Center(child: Text('Share')))
            ],
          ),
        ),
      ),
    );
  }
}
