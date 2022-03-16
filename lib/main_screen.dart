import 'package:flutter/material.dart';
import 'package:kuis_d_123190062/app_store.dart';
import 'package:kuis_d_123190062/second_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("IF Play Store"),
      ),
      body: ListView.builder(
          itemCount: appList.length,
          itemBuilder: (context, index) {
            final AppStore app = appList[index];
            return InkWell(
                onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SecondScreen(idx: index);
                }));
                },
                child: Card(
                  child: Row(
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
                      Text(app.name + "\n\n" + app.genre + "\n\n" + app.rating),
                      //Text),
                    ],
                  ),
                ),
            );
          }
      ),
    );
  }
}
