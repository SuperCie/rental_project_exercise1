import 'package:balirental_project1/components/data/catalog.dart';
import 'package:balirental_project1/components/data/transportation.dart';
import 'package:balirental_project1/components/mybartab.dart';
import 'package:balirental_project1/components/mycardtile.dart';
import 'package:balirental_project1/components/mysliverappbar.dart';
import 'package:balirental_project1/pages/cartpage.dart';
import 'package:balirental_project1/pages/vehicle_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TextEditingController searchController = TextEditingController();
  late TabController _tabController;

  //search menu list
  List<Transportation> searchedMenu = [];

// untuk menginilisasi jumlah tabcontroller dan menghubungkan tabcontroller dengan tickerprovider untuk memastikan animasi bekerja dengan lancar
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: transportationCategory.values.length,
      vsync: this,
    );

    searchedMenu = context.read<Catalog>().menu;
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

//search
  void searchItems(String query, List<Transportation> fullMenu) {
    if (query.isEmpty) {
      setState(() {
        searchedMenu = fullMenu;
      });
    } else {
      setState(() {
        searchedMenu = fullMenu
            .where(
                (item) => item.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    }
  }

// list dari menu transportasi
  List<Widget> getFilterMenu(List<Transportation> fullMenu) {
    return transportationCategory.values.map(
      (category) {
        List<Transportation> categoryList =
            _filterMenuCategory(category, searchedMenu);

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
              ontap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VehiclePage(
                        transportation: transportation,
                      ),
                    ));
              },
            );
          },
        );
      },
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: AppBar(
            elevation: 0,
            backgroundColor: Theme.of(context).colorScheme.primary,
            actions: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        hintText: 'Search..',
                        prefixIcon: Icon(Icons.search),
                        filled: true,
                        fillColor: Theme.of(context).colorScheme.secondary),
                    onChanged: (value) {
                      searchItems(value, context.read<Catalog>().menu);
                    },
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: CircleAvatar(
                    radius: 25,
                    backgroundColor: Theme.of(context).colorScheme.surface,
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Cartpage(),
                            ));
                      },
                      icon: Icon(
                        Icons.shopping_cart,
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                    )),
              ),
            ],
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Consumer<Catalog>(
          builder: (context, catalogs, child) {
            if (searchedMenu.isEmpty) {
              searchedMenu = catalogs
                  .menu; // Menampilkan seluruh data jika belum ada filter
            }

            return NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) => [
                Mysliverappbar(),
                SliverPersistentHeader(
                  delegate: Mybartab(tabController: _tabController),
                ),
              ],
              body: TabBarView(
                controller: _tabController,
                children: getFilterMenu(catalogs.menu),
              ),
            );
          },
        ));
  }
}
