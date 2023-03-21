import 'package:flutter/material.dart';

import 'service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with UdemyOrnekService{

  @override
  void initState() {
    super.initState();
    kisiEkle("Elif", "pilot");
    kisileriGoster();
    kisiGuncelle(2, "eee", "tırnak makası");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.orange.shade400,
          onPressed: (){
            kisiSil(2);
          },
          child: Icon(Icons.delete),
        ),
    );
  }
}
