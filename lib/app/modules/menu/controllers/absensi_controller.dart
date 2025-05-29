// ignore_for_file: avoid_print, deprecated_member_use

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class AbsensiController extends GetxController {
  Position? currentPosition;
  final loading = false.obs;
  final mapController = Rxn<GoogleMapController>();
  final currentMarker = Rx<Set<Marker>>({});
  RxString address = "".obs;

  @override
  void onInit() {
    initialiaze();
    super.onInit();
  }

  @override
  void onClose() {
    mapController.close();
    loading.close();
    super.onClose();
  }

  void initialiaze() async {
    await permission();
    loading.value = true;
    currentPosition = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    final placemarks = await placemarkFromCoordinates(
        currentPosition!.latitude, currentPosition!.longitude);
    final listData = [
      placemarks.first.street,
      placemarks.first.thoroughfare,
      placemarks.first.subThoroughfare,
      placemarks.first.subLocality,
      placemarks.first.locality,
      placemarks.first.subAdministrativeArea,
      placemarks.first.administrativeArea,
      placemarks.first.country
    ];

    for (int i = 0; i < listData.length; i++) {
      address.value += '${listData[i]}, ';
    }

    address.value = address.substring(0, address.value.length - 2);

    currentMarker.value.assign(Marker(
        markerId: const MarkerId('0'),
        position:
            LatLng(currentPosition!.latitude, currentPosition!.longitude)));
    loading.value = false;
    print(placemarks.first.street);
  }

  Future permission() async {
    var locationStatus = await Permission.location.status;
    if (locationStatus.isDenied) {
      await Permission.location.request();
    }
  }

  void onMapCreated(GoogleMapController controller, LatLng latLng) {
    currentMarker.value
        .assign(Marker(markerId: const MarkerId('0'), position: latLng));
    mapController.value = controller
      ..animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            zoom: 18,
            target: latLng,
          ),
        ),
      );
  }
}
