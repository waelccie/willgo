import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:latlong2/latlong.dart';
import 'package:willgo/app/modules/all_offers/bindings/all_offers_binding.dart';

import '../../environment/controllers/environment_controller.dart';



class mapWuidgetfull_Address extends StatelessWidget {
 final LatLng myLocation;
  const mapWuidgetfull_Address({super.key,required this.myLocation});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12)

      ),
      height: 123.h,
      width: MediaQuery.of(context).size.width,
      child:   Padding(
        padding: const EdgeInsets.all(2.0),
        child: FlutterMap(
          options: MapOptions(
            center: Get.find<EnvironmentController>().latLng,
            zoom: 12.0,
            maxZoom: 18,
            onTap: (_, __) {

            },
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}{r}.png',
              subdomains: const ['a', 'b', 'c'],
              backgroundColor: Colors.white,
              additionalOptions: const {
                'type': 'light_all',
                'language': 'ar',
              },
            ),
            MarkerLayer(
              markers: [
                 Marker(
                  width: 40,
                  height: 40,
                  point: myLocation,
                  builder: (context) => GestureDetector(
                    onTap: () {

                    },
                    child: Icon(Icons.location_history,size: 50,)
                  ),
                )
              ]
            ),

          ],
        ),
      ),
    );
  }
}


class mapWuidget extends StatelessWidget {
  const mapWuidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12)

      ),
      height: 448.h,
      width: MediaQuery.of(context).size.width,
      child:   FlutterMap(
        options: MapOptions(
          center: const LatLng(24.6911, 46.7268),
          zoom: 12.0,
          maxZoom: 18,
          onTap: (_, __) {

          },
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}{r}.png',
            subdomains: const ['a', 'b', 'c'],
            backgroundColor: Colors.white,
            additionalOptions: const {
              'type': 'light_all',
              'language': 'ar',
            },
          ),
          // MarkerLayer(
          //   markers: mosques.map((mosque) {
          //     return Marker(
          //       width: 40,
          //       height: 40,
          //       point: mosque.location,
          //       builder: (context) => GestureDetector(
          //         onTap: () {
          //           setState(() {
          //             selectedMosque = mosque;
          //           });
          //         },
          //         child: SvgPicture.asset(
          //           'Assets/images/marker.svg',
          //           width: 40,
          //           height: 40,
          //         ),
          //       ),
          //     );
          //   }).toList(),
          // ),
          // إظهار معلومات المسجد المحدد

        ],
      ),
    );
  }
}

