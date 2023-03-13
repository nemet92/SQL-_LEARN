import 'package:flutter/material.dart';

class Gridview1 extends StatefulWidget {
  const Gridview1({super.key});

  @override
  State<Gridview1> createState() => _Gridview1State();
}

class _Gridview1State extends State<Gridview1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
        ),
        body: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                mainAxisExtent: 150,
                crossAxisCount: 2),
            itemBuilder: (BuildContext context, index) {
              return Column(
                children: [
                  Container(
                    child: const Text("dadad"),
                  )
                ],
              );
            }));
  }
}
