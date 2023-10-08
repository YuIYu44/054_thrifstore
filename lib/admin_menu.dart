import 'package:ayu054_thriftstore/admin_add.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ayu054_thriftstore/functions.dart';
import 'package:csv/csv.dart';
import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

List<List<dynamic>> data = [[]];
Directory documentsDirectory = Directory("");

class admin_menu extends StatefulWidget {
  @override
  State<admin_menu> createState() => _menu();
}

class _menu extends State<admin_menu> {
  Widget show_pic(BuildContext context) {
    if (data.isNotEmpty && data[0].isNotEmpty) {
      return Container(
        width: MediaQuery.of(context).size.width * 0.85,
        height: MediaQuery.of(context).size.height * 0.85,
        child: GridView.count(
          childAspectRatio: MediaQuery.of(context).size.width /
              (MediaQuery.of(context).size.height / 2),
          shrinkWrap: true,
          crossAxisCount: 2,
          scrollDirection: Axis.vertical,
          children: List.generate(data.length, (index) {
            return Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.05,
                  ),
                  color: Colors.grey,
                  width: MediaQuery.of(context).size.width * 0.38,
                  height: MediaQuery.of(context).size.width * 0.3,
                  child: Image.file(
                    File(data[index].elementAt(0)),
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(top: 5, left: 10),
                  child: Text(
                    "Tags: ${data[index].elementAt(2).toString()}",
                    style: GoogleFonts.inika(
                      color: Colors.black,
                      fontSize: MediaQuery.of(context).size.width * 0.03,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      );
    }
    return Container();
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    await dir();
    getvaluecsv();
    setState(() {});
  }

  Future<void> dir() async {
    documentsDirectory = await getApplicationDocumentsDirectory();
  }

  void getvaluecsv() async {
    final file = File('${documentsDirectory.path}/data.csv');
    if (file.existsSync()) {
      data = CsvToListConverter().convert(
        file.readAsStringSync(encoding: utf8),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar_(context),
      body: Center(
        child: Stack(
          children: [
            show_pic(context),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.7,
              left: MediaQuery.of(context).size.width * 0.4,
              child: RawMaterialButton(
                onPressed: () {
                  navigateToNext(context, admin_add());
                },
                child: Icon(Icons.add_circle,
                    size: MediaQuery.of(context).size.width * 0.15,
                    color: Colors.white),
                fillColor: Color(0XffFFD600),
                shape: CircleBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
