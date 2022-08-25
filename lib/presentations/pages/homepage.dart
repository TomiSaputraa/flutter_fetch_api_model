import 'package:fetch_api/datas/model/users_model.dart';
import 'package:fetch_api/datas/repositories/users_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Repository repository = Repository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fetch api"),
      ),
      body: FutureBuilder(
        future: repository.getData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Image(
                      image:
                          NetworkImage(snapshot.data[index].avatar.toString()),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 1,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          width: double.infinity,
                          child: Column(
                            children: [
                              Text(
                                "Id :  ${snapshot.data[index].id}",
                              ),
                              Text(
                                "Name : ${snapshot.data[index].name}",
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          }

          return const Center(
              child: CupertinoActivityIndicator(
            animating: true,
            radius: 15,
          ));
        },
      ),
    );
  }
}
