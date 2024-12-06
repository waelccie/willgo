import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:get/get.dart';
import 'package:willgo/app/modules/environment/controllers/environment_controller.dart';

class MapWidgetFullAddress extends StatefulWidget {
  LatLng myLocation;
  final Function getLocationAndAddress;

  MapWidgetFullAddress({
    super.key,
    required this.myLocation,
    required this.getLocationAndAddress,
  });

  @override
  _MapWidgetFullAddressState createState() => _MapWidgetFullAddressState();
}

class _MapWidgetFullAddressState extends State<MapWidgetFullAddress> {
  Timer? _debounceTimer;
  late LatLng _currentLocation;
  late MapController _mapController; // MapController لتحريك الخريطة

  @override
  void initState() {
    super.initState();
    _currentLocation = widget.myLocation;
    _mapController = MapController(); // تهيئة MapController
  }

  // ميثود لتحديث موقع الماركر
  void updateMarkerLocation(LatLng newLocation) {
    setState(() {
      _currentLocation = newLocation;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          height: 450,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: FlutterMap(
              mapController: _mapController, // ربط MapController بالخريطة
              options: MapOptions(
                center: _currentLocation,
                zoom: 12.0,
                maxZoom: 18,
                onPositionChanged: (position, hasGesture) {
                  if (_debounceTimer?.isActive ?? false) _debounceTimer?.cancel();

                  if (hasGesture && position.center != null) {
                    setState(() {
                      _currentLocation = LatLng(
                        position.center!.latitude,
                        position.center!.longitude,
                      );
                    });
                  }

                  _debounceTimer = Timer(const Duration(milliseconds: 500), () {
                    widget.getLocationAndAddress(_currentLocation);
                  });
                },
              ),
              children: [
                TileLayer(
                  urlTemplate:
                  'https://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}{r}.png',
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
                      point: _currentLocation, // الماركر يحتفظ بموقعه
                      builder: (context) => const Icon(
                        Icons.location_history,
                        size: 50,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 10,
          right: 20,
          child: GestureDetector(
            onTap: () {
              // الحصول على الموقع الحالي من EnvironmentController
              LatLng currentPosition = Get.find<EnvironmentController>().latLng!;

              // تحريك الخريطة إلى الموقع الجديد
              _mapController.move(currentPosition, 12.0);

              // الاحتفاظ بالماركر في موقعه الحالي أو تحديثه إذا لزم الأمر
              setState(() {
                _currentLocation = currentPosition;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.my_location),
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    super.dispose();
  }
}
