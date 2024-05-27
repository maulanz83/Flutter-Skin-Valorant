import 'package:flutter/material.dart';
import '../models/weapon_skin.dart';

class WeaponSkinDetail extends StatefulWidget {
  final WeaponSkin weaponSkin;

  WeaponSkinDetail({Key? key, required this.weaponSkin}) : super(key: key);

  @override
  State<WeaponSkinDetail> createState() => _WeaponSkinDetailState();
}

class _WeaponSkinDetailState extends State<WeaponSkinDetail> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.weaponSkin.displayName!),
          backgroundColor: Colors.blueGrey[300],
        ),
        body: ListView.builder(
          shrinkWrap: true,
          itemCount: widget.weaponSkin.chromas!.length,
          itemBuilder: (context, index) {
            return Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                margin: EdgeInsets.symmetric(vertical: 16),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Description for Chroma ${index + 1}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Category: ${widget.weaponSkin.category ?? 'Unknown'}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Theme UUID: ${widget.weaponSkin.themeUuid ?? 'Unknown'}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 16),
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height / 3,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(widget.weaponSkin.chromas![index]['fullRender']),
                            fit: BoxFit.contain,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
