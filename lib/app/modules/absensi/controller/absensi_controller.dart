// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:solusi/app/widgets/pop_up_load.dart';

class AbsensiController extends GetxController {
  final showformabsence = false.obs;
  final listabsence = [].obs;
  final positionnow = "".obs;
  final locationnow = "".obs;
  final datenow = "".obs;

  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration.zero).then((value) => initialiaze(),);
  }

  void initialiaze() async {
    Get.dialog(PopUpLoad());
    datenow.value = DateFormat('EEEE, d MMMM yyyy', 'id').format(DateTime.now());
    var status = await Permission.location.status;
    if (status.isDenied) {
      var request = await Permission.location.request();
      if (request.isGranted) {
        var position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
        positionnow.value = "${position.latitude}, ${position.longitude}";
        List<Placemark> placemarks = await placemarkFromCoordinates(
          position.latitude,
          position.longitude,
        );

        if (placemarks.isNotEmpty) {
          debugPrint("tidak ksong");
          Placemark place = placemarks.first;
          locationnow.value = "${place.street}, ${place.subLocality}, ${place.locality}, ${place.administrativeArea}, ${place.postalCode}";
        } else {
          debugPrint("ksong");
          locationnow.value = "-";
        }
      } else {
        debugPrint("Permission denied");
      }
    } else {
      var position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      positionnow.value = "${position.latitude}, ${position.longitude}}";
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        print("tidak ksong");
        Placemark place = placemarks.first;
        locationnow.value = "${place.street}, ${place.subLocality}, ${place.locality}, ${place.administrativeArea}, ${place.postalCode}";
      } else {
        print("ksong");
      }
    }
    Get.back();
  }

  void refreshlocation() async {
    Get.dialog(PopUpLoad());
    var position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    positionnow.value = "${position.latitude}, ${position.longitude}";
    List<Placemark> placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );

    if (placemarks.isNotEmpty) {
      debugPrint("tidak ksong");
      Placemark place = placemarks.first;
      locationnow.value = "${place.street}, ${place.subLocality}, ${place.locality}, ${place.administrativeArea}, ${place.postalCode}";
    } else {
      debugPrint("ksong");
      locationnow.value = "-";
    }
    Get.back();
  }
}
