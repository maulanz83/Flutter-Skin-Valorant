// weapon_skins_list.dart

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/weapon_skin.dart';
import 'weaponskin_detail.dart';

class WeaponSkinsList extends StatefulWidget {
  @override
  _WeaponSkinsListState createState() => _WeaponSkinsListState();
}

class _WeaponSkinsListState extends State<WeaponSkinsList> {
  List<dynamic> weaponSkins = [];
  List<dynamic> filteredWeaponSkins = []; // List to store filtered weapon skins
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchWeaponSkins();
  }

  Future<void> fetchWeaponSkins() async {
    var url = Uri.parse('https://valorant-api.com/v1/weapons/skins');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      setState(() {
        weaponSkins = jsonData['data'];
        filteredWeaponSkins = weaponSkins; // Initialize filtered list with all weapon skins
      });
    } else {
      print('Error: ${response.statusCode}');
    }
  }

  // Function to filter weapon skins based on search query
  void filterWeaponSkins(String query) {
    List<dynamic> _searchResult = [];
    _searchResult.addAll(weaponSkins);
    if (query.isNotEmpty) {
      List<dynamic> _searchListData = [];
      _searchResult.forEach((item) {
        if (item['displayName'].toLowerCase().contains(query.toLowerCase())) {
          _searchListData.add(item);
        }
      });
      setState(() {
        filteredWeaponSkins.clear();
        filteredWeaponSkins.addAll(_searchListData);
      });
      return;
    } else {
      setState(() {
        filteredWeaponSkins.clear();
        filteredWeaponSkins.addAll(weaponSkins);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Valorant Weapon Skins'),
        backgroundColor: Colors.blueGrey[300],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              onChanged: (value) {
                filterWeaponSkins(value);
              },
              decoration: InputDecoration(
                labelText: "Search",
                hintText: "Search weapon skins",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0))),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
              ),
              itemCount: filteredWeaponSkins.length,
              itemBuilder: (context, index) {
                if (filteredWeaponSkins[index]['displayIcon'] != null) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WeaponSkinDetail(
                            weaponSkin: WeaponSkin(
                              displayName: filteredWeaponSkins[index]['displayName'],
                              displayIcon: filteredWeaponSkins[index]['displayIcon'],
                              chromas: filteredWeaponSkins[index]['chromas'],
                            ),
                          ),
                        ),
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(
                          color: Colors.grey.withOpacity(0.5),
                          width: 1,
                        ),
                      ),
                      elevation: 5,
                      margin: EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 150,
                            child: Image.network(
                              filteredWeaponSkins[index]['displayIcon'],
                              fit: BoxFit.contain,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              filteredWeaponSkins[index]['displayName'],
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return SizedBox.shrink();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
