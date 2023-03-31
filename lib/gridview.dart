import 'package:flutter/material.dart';
import 'package:loginsql/KatagorilerModel.dart';

import 'katagorilerApi.dart';

class Gridview1 extends StatefulWidget {
  const Gridview1({super.key});

  @override
  State<Gridview1> createState() => _Gridview1State();
}

class _Gridview1State extends State<Gridview1> {
  List<KatagoriModel> modelim = [];
  // List<KatagorilerApi> modelli = [];
  KatagorilerApi api = KatagorilerApi();

  @override
  void initState() {
    super.initState();
    // KatagorilerApi api = KatagorilerApi();
    // // api.getKategoriler();
    // api.getKatagoriler();

    // print("api print$api");
    // String jsonText =
    //     "[ { \"id\": 2, \"ad\": \"Icecekler\", \"aktif\": true }, { \"id\": 5, \"ad\": \"Yiyeceler\", \"aktif\": true }, { \"id\": 6, \"ad\": \"Yiyecelerd\", \"aktif\": true } ]";

    // modelim = (jsonDecode(jsonText) as List)
    //     .map((e) => KatagoriModel.fromJson(e))
    //     .toList();
    // for (var element in modelim) {
    //   print("${element.ad!}***");
    // }

    // KatagorilerApi api = KatagorilerApi();
    // api.getKatagoriler().then((value) {
    //   // ignore: avoid_function_literals_in_foreach_calls
    //   value.forEach((element) {
    //     print("${element.ad!}+*");
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          toolbarHeight: 0,
        ),
        body: FutureBuilder<List<KatagoriModel>>(
            future: api.getKatagoriler(),
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                List<KatagoriModel>? modelim = snapshot.data;
                return _getKatagoriler(modelim);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.blue,
                  strokeWidth: 2,
                ),
              );
            }));
  }

  GridView _getKatagoriler(modelim) {
    return GridView.builder(
        itemCount: modelim.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            mainAxisExtent: 150,
            crossAxisCount: 2),
        itemBuilder: (BuildContext context, index) {
          KatagoriModel model = modelim[index];

          return Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Center(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(right: 10, top: 5),
                    child: const Align(
                      alignment: Alignment.centerRight,
                      child: Icon(Icons.favorite),
                    ),
                  ),
                  Expanded(
                    flex: 70,
                    child: SizedBox(
                        height: 150,
                        width: 80,
                        child: Image.asset("assets/download.jpg")),
                  ),
                  Expanded(
                    flex: 30,
                    child: Text("${modelim[index].ad} $index"),
                  ),
                  Expanded(
                    flex: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              KatagorilerApi api = KatagorilerApi();
                              KatagoriModel modelim = KatagoriModel();
                              modelim.ad = "denemeTest1ssss";
                              modelim.aktif = true;
                              modelim.id = 0;
                              // model.id = 0;
                              api.addKategoriler(modelim);
                              // then((value) {
                              //   print("veri eklendi$value");
                              // setState(() {});
                              // });
                            },
                            child: const Text("Sebete ekle")),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ))
                      ],
                    ),
                  ),
                  const SizedBox(height: 10)
                ],
              ),
            ),
          );
        });
  }
}
