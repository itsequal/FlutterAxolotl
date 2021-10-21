import 'package:asd/services/api_manager.dart';
import 'package:flutter/material.dart';

import '../model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<Api> _apiModel;

  @override
  void initState() {
    _apiModel = API_Manager().getAxo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API en Flutter'),
      ),
      body: FutureBuilder<Api>(
        future: _apiModel,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(itemBuilder: (context, index) {
              var article = snapshot.data;
              return Card(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                child: InkWell(
                  child: Column(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0),
                        ),
                        child: Image.network(
                          article!.url,
                          width: 300,
                          height: 250,
                          fit: BoxFit.fill,
                        ),
                      ),
                      ListTile(
                          title: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: article.facts,
                          style:
                              const TextStyle(color: Colors.blue, fontSize: 20),
                        ),
                      )),
                    ],
                  ),
                ),
              );
            });
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
