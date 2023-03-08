import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(
                child: Text("Yiyecekler"),
              ),
              Tab(child: Text("Icecekler")),
            ],
          ),
        ),
        body: TabBarView(children: [
          ListView(children: [
            Container(
              child: const Text("doner"),
            ),
            Container(
              child: const Text("Piza"),
            ),
            Container(
              child: const Text("Piza2"),
            )
          ]),
          ListView(children: [
            Container(
              child: const Text("Ayran"),
            ),
            Container(
              child: const Text("kola"),
            )
          ]),
        ]),
      ),
    );
  }
}
