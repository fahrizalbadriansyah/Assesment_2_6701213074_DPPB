import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wireframe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController viewPertamaController = TextEditingController();
  TextEditingController viewKeduaController = TextEditingController();
  TextEditingController viewKetigaController = TextEditingController();
  bool switchValue = false;

  String namaBarang = '';
  String deskripsi = '';
  String harga = '';
  String jenisBarang = '';
  String pengirimanDalamKota = '';
  String menerimaRetur = '';
  String dikerjakanOleh = '6701213074 - Mohammad Fahrizal Badrian';

  void publishData() {
    setState(() {
      namaBarang = viewPertamaController.text;
      deskripsi = viewKeduaController.text;
      harga = viewKetigaController.text;
      jenisBarang = switchValue ? 'Baru' : 'Bekas';
      pengirimanDalamKota = switchValue ? 'Ya' : 'Tidak';
      menerimaRetur = switchValue ? 'Ya' : 'Tidak';

    });

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SecondPage(
          namaBarang: namaBarang,
          deskripsi: deskripsi,
          harga: harga,
          jenisBarang: jenisBarang,
          pengirimanDalamKota: pengirimanDalamKota,
          menerimaRetur: menerimaRetur,
          dikerjakanOleh: dikerjakanOleh,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wireframe'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: viewPertamaController,
              decoration: InputDecoration(
                labelText: 'Nama Barang',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: viewKeduaController,
              maxLines: 4,
              decoration: InputDecoration(
                labelText: 'Deskripsi',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: viewKetigaController,
              decoration: InputDecoration(
                labelText: 'Harga',
              ),
            ),
            SizedBox(height: 16.0),
            SizedBox(height: 16.0),
            Text('Jenis Barang'),
            RadioListTile(
              title: Text('Baru'),
              value: 1,
              groupValue: null,
              onChanged: (value) {},
            ),
            RadioListTile(
              title: Text('Bekas'),
              value: 2,
              groupValue: null,
              onChanged: (value) {},
            ),
            Text('Pengiriman Dalam Kota'),
             Switch(
              value: switchValue,
              onChanged: (value) {
                setState(() {
                  switchValue = value;
                });
              },
            ),
            SizedBox(height: 16.0),
            Text('Menerima Retur'),
            Switch(
              value: switchValue,
              onChanged: (value) {
                setState(() {
                  switchValue = value;
                });
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: publishData,
              child: Text('PUBLIKASIKAN'),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  final String namaBarang;
  final String deskripsi;
  final String harga;
  final String jenisBarang;
  final String pengirimanDalamKota;
  final String menerimaRetur;
  final String dikerjakanOleh;

  SecondPage({
    required this.namaBarang,
    required this.deskripsi,
    required this.harga,
    required this.jenisBarang,
    required this.pengirimanDalamKota,
    required this.menerimaRetur,
    required this.dikerjakanOleh,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Barang'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nama barang: $namaBarang'),
            SizedBox(height: 8.0),
            Text('Deskripsi: $deskripsi'),
            SizedBox(height: 8.0),
            Text('Harga: $harga'),
            SizedBox(height: 8.0),
            Text('Jenis barang: $jenisBarang'),
            SizedBox(height: 8.0),
            Text('Pengiriman dalam kota saja: $pengirimanDalamKota'),
            SizedBox(height: 8.0),
            Text('Menerima retur: $menerimaRetur'),
            SizedBox(height: 8.0),
            Text('Dikerjakan oleh: $dikerjakanOleh'),
          ],
        ),
      ),
    );
  }
}