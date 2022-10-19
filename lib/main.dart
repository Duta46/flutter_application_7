import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Animal> animals = [];

  @override
  void initState() {
    //adding item to list, you can add using json from network
    animals.add(Animal(
        id: "1",
        merk: "Whiskas",
        jenis: "Kucing",
        ukuran: "Besar",
        jumlah: "500",
        harga: "20.000"));

    animals.add(Animal(
        id: "2",
        merk: "Meo",
        jenis: "Kucing",
        ukuran: "Besar",
        jumlah: "200",
        harga: "25.000"));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Penjualan Makanan Hewan"),
          backgroundColor: Colors.redAccent,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: animals.map((personone) {
                return Container(
                  child: Card(
                    child: ListTile(
                      title: Text(personone.merk),
                      subtitle: Text(personone.jenis +
                          "\n" +
                          personone.ukuran +
                          "\n" +
                          personone.jumlah +
                          "\n" +
                          personone.harga),
                      trailing: ElevatedButton(
                        style:
                            ElevatedButton.styleFrom(primary: Colors.redAccent),
                        child: Icon(Icons.delete),
                        onPressed: () {
                          //delete action for this button
                          animals.removeWhere((element) {
                            return element.id == personone.id;
                          }); //go through the loop and match content to delete from list
                          setState(() {
                            //refresh UI after deleting element from list
                          });
                        },
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ));
  }
}

class Animal {
  //modal class for Person object
  String id, merk, jenis, ukuran, jumlah, harga;
  Animal(
      {required this.id,
      required this.merk,
      required this.jenis,
      required this.ukuran,
      required this.jumlah,
      required this.harga});
}
