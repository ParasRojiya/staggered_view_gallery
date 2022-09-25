import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../global/global.dart';
import '../modals/modal.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Photos> photosData = [];

  loadJsonData() async {
    String jsonData = await rootBundle.loadString("json/jsonData.json");

    List res = jsonDecode(jsonData);

    setState(() {
      photosData = res.map((e) => Photos.fromJSON(e)).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    loadJsonData();
    print(photosData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomePage"),
        centerTitle: true,
      ),
      backgroundColor: Colors.white.withOpacity(0.8),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: StaggeredGrid.count(
            crossAxisCount: 10,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: photosData.map((e) {
              return StaggeredGridTile.count(
                crossAxisCellCount: e.crossAxisCellCount,
                mainAxisCellCount: e.mainAxisCellCount,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed('photos_page', arguments: e);
                  },
                  child: Container(
                    // color: Colors.lightBlue,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                          image: AssetImage("${e.image}"), fit: BoxFit.cover),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            e.category,
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w800,
                              color: Colors.white.withOpacity(0.9),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
