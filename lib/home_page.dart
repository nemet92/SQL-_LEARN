import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class Kategoriler {
  int? id;
  String? ad;
  bool? aktif;
}

class Urunler {
  int? id;
  String? ad;
  int? kategoriId;
}

class _HomePageState extends State<HomePage> {
  List<Kategoriler> listKategori = [];
  List<Urunler> listUrunler = [];

  void kategoriEkle(int id, String kategoriAd) {
    Kategoriler kat = Kategoriler();
    kat.ad = kategoriAd;
    kat.id = id;
    kat.aktif = true;
    listKategori.add(kat);
  }

  void urunEkle(int id, String urunAd, int kategoriId) {
    Urunler urun = Urunler();
    urun.ad = urunAd;
    urun.id = id;
    urun.kategoriId = kategoriId;
    listUrunler.add(urun);
  }

  List<Widget> listTab = [];
  List<Widget> listLisviewWidget = [];
  @override
  void initState() {
    super.initState();
    kategoriEkle(1, "Yiycekler");
    kategoriEkle(2, "Icecekler");
    kategoriEkle(3, "Hamburgerler");

    urunEkle(1, "Ayran", 2);
    urunEkle(2, "Kola", 2);
    urunEkle(3, "Pizza", 1);
    urunEkle(4, "Doner", 1);
    urunEkle(5, "Hamburger", 3);

    for (var kategori in listKategori) {
      Widget tab = Tab(
        child: Text(kategori.ad!),
      );
      listTab.add(tab);

      List<Widget> urunWidget = [];

      List<Urunler> urunler =
          listUrunler.where((urun) => urun.kategoriId == kategori.id).toList();
      for (var urun in urunler) {
        Widget con = ListTile(
          title: Text(urun.ad ?? ""),
          leading: const Icon(Icons.add),
          trailing: const Icon(Icons.arrow_right_outlined),
          onTap: () {},
        );
        urunWidget.add(con);
      }
      Widget lisview = ListView(
        children: urunWidget,
      );
      listLisviewWidget.add(lisview);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: listKategori.length,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: listTab,
          ),
        ),
        body: TabBarView(children: listLisviewWidget),
      ),
    );
  }
}
