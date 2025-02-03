import 'package:balirental_project1/components/data/catalog.dart';
import 'package:balirental_project1/components/data/transportation.dart';
import 'package:balirental_project1/components/mybartab.dart';
import 'package:balirental_project1/components/mycardtile.dart';
import 'package:balirental_project1/components/mysliverappbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

// untuk menginilisasi jumlah tabcontroller dan menghubungkan tabcontroller dengan tickerprovider untuk memastikan animasi bekerja dengan lancar
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: transportationCategory.values.length,
      vsync: this,
    );
  }

// membersihkan cache animasi saat widget tidak dipakai agar tidak terjadi memory leaks
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // bikin list kedalam katalog
  List<Transportation> _filterMenuCategory(
      transportationCategory category, List<Transportation> fullMenu) {
    return fullMenu
        .where((transportation) => transportation.category == category)
        .toList();
  }

// list dari menu transportasi
  List<Widget> getFilterMenu(List<Transportation> fullMenu) {
    return transportationCategory.values.map(
      (category) {
        List<Transportation> categoryList =
            _filterMenuCategory(category, fullMenu);

        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
          scrollDirection: Axis.vertical,
          itemCount: categoryList.length,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            //panggil widget tile
            final transportation = categoryList[index];
            return Mycardtile(
              transportation: transportation,
              ontap: () {},
            );
          },
        );
      },
    ).toList();
  }

  // untuk perpindahan page

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: NestedScrollView(
          headerSliverBuilder:
              (BuildContext context, bool innerBoxIsScrolled) => [
                    Mysliverappbar(),
                    SliverPersistentHeader(
                        delegate: Mybartab(tabController: _tabController))
                  ],
          body: Consumer<Catalog>(
            builder: (context, catalogs, child) => TabBarView(
              controller: _tabController,
              children: getFilterMenu(catalogs.menu),
            ),
          )),
    );
  }
}
