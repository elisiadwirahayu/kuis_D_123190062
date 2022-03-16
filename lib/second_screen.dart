import 'package:flutter/material.dart';
import 'package:kuis_d_123190062/app_store.dart';
import 'package:url_launcher/url_launcher.dart';

class SecondScreen extends StatefulWidget {
  final int idx;
  const SecondScreen({Key? key, required this.idx}) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    final AppStore app = appList[widget.idx];

    return Scaffold(
      appBar: AppBar(
        title: Text(app.name),
      ),
      body: Column(
        children: [
          Center(
            child: Card(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Image.network(
                          app.imageLogo[0],
                          width: MediaQuery.of(context).size.width / 3,
                        ),
                      ],
                    ),

                  ),
                  Text(app.name + "\n\n" + app.developer + "\n\n" + app.genre + "\n\n" + app.rating + "\n\n"),
                  SizedBox(height: 10),
                  Image.network(
                    app.imageUrls[0],
                    width: MediaQuery.of(context).size.width / 3,
                  ),
                  SizedBox(height: 10),
                  Text(app.description),
                ],
              ),

            ),

          ),

          Container(
            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size.fromHeight(40.0),
              ),
              onPressed: () async {
                if (!await launch(app.appLink[0])) throw 'Could not launch ${app.appLink[0]}';
              }, // Respon ketika button ditekan
              child: Text("Download"),
            ),
          ),
        ],

      ),
    );

    return Container();
  }
}
