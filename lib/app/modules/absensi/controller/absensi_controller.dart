// ignore_for_file: deprecated_member_use, avoid_print

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter_android/google_maps_flutter_android.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:solusi/app/modules/absensi/model/absensi_model.dart';
import 'package:solusi/app/modules/absensi/model/absen_status_model.dart';
import 'package:solusi/app/modules/home/controllers/home_controller.dart';
import 'package:solusi/app/repositorys/scheduleabsence_repository.dart';
import 'package:solusi/app/widgets/pop_up_load.dart';
import 'package:solusi/app/widgets/pop_up_notifikasi.dart';

import '../../../../core/colors.dart';
import '../../../../core/helper.dart';
import '../../../../core/local_db.dart';

class AbsensiController extends GetxController {
  final showformabsence = false.obs;
  final listabsence = <AbsensiModel>[].obs;
  final positionnow = "".obs;
  final locationnow = "".obs;
  final lat = 0.0.obs;
  final long = 0.0.obs;
  final name = "".obs;
  final typeabsence = "".obs;
  final datenow = "".obs;
  final loading = false.obs;
  final scheduleabsenrepo = ScheduleAbsenceRepository();
  final locationdata = Rxn<LocationEntity>();
  final locationList = <DataLocation>[].obs;
  final markers = <Marker>{}.obs;
  final circles = <Circle>{}.obs;
  final photoPath = Rxn<String>();
  final absenStatus = Rxn<AbsenStatusModel>();

  @override
  void onInit() {
    super.onInit();
    initialiaze();
  }

  void disableformabsence() {
    showformabsence.value = false;
    markers.clear();
    circles.clear();
    lat.value = 0.0;
    long.value = 0.0;
    locationList.clear();
    locationdata.value = null;
    photoPath.value = null;
    name.value = "";
    typeabsence.value = "";
    datenow.value = "";
    positionnow.value = "";
    locationnow.value = "";
  }

  void initialiaze() async {
    loading.value = true;
    await scheduleabsenrepo.getAbsense().then((value) {
      listabsence.assignAll(value);
    });
    await fetchAbsenStatus();
    loading.value = false;
  }

  Future<void> fetchAbsenStatus() async {
    try {
      final status = await scheduleabsenrepo.getAbsenStatus();
      if (status != null) {
        absenStatus.value = status;
        debugPrint('Absen Status - ID: ${status.idAbsen}, IsIn: ${status.isIn}');
      }
    } catch (e) {
      debugPrint('Error fetching absen status: $e');
    }
  }

  Future<bool> verifyBiometric() async {
    try {
      final biometricInfo = await checkBiometricAvailability();
      final platform = biometricInfo['platform'] as String;
      final supportedTypes = biometricInfo['supportedTypes'] as List<String>;
      
      if (!biometricInfo['canCheckBiometrics'] && !biometricInfo['isDeviceSupported']) {
        Get.snackbar(
          "Biometrik Tidak Tersedia", 
          "Device $platform tidak mendukung autentikasi biometrik. Menggunakan foto sebagai verifikasi",
          backgroundColor: AppColors.orange,
          colorText: AppColors.white,
        );
        return await takePhotoForVerification();
      }
      
      if ((biometricInfo['availableBiometrics'] as List).isEmpty) {
        String message = platform == 'iOS' 
            ? "Tidak ada biometrik yang terdaftar. Menggunakan foto sebagai verifikasi"
            : "Tidak ada biometrik yang terdaftar. Menggunakan foto sebagai verifikasi";
        
        Get.snackbar(
          "Biometrik Tidak Terdaftar", 
          message,
          backgroundColor: AppColors.orange,
          colorText: AppColors.white,
        );
        return await takePhotoForVerification();
      }
      
      final success = await authenticate();
      
      if (success) {
        return true;
      } else {
        String failMessage = supportedTypes.isNotEmpty 
            ? "Verifikasi ${supportedTypes.join('/')} gagal atau dibatalkan"
            : "Verifikasi biometrik gagal atau dibatalkan";
        
        Get.snackbar(
          "Autentikasi Gagal", 
          failMessage,
          backgroundColor: AppColors.red,
          colorText: AppColors.white,
        );
        return false;
      }
      
    } catch (e) {
      String errorMessage = "Error tidak dikenal";
      
      if (e.toString().contains('Device tidak mendukung')) {
        errorMessage = "Device tidak mendukung autentikasi biometrik";
      } else if (e.toString().contains('Tidak ada biometrik')) {
        errorMessage = "Silakan daftarkan biometrik di pengaturan device";
      } else if (e.toString().contains('terkunci')) {
        errorMessage = "Autentikasi terkunci. Coba lagi nanti";
      } else if (e.toString().contains('dibatalkan')) {
        errorMessage = "Autentikasi dibatalkan oleh user";
      }
      
      Get.snackbar(
        "Error Autentikasi", 
        errorMessage,
        backgroundColor: AppColors.red,
        colorText: AppColors.white,
      );
      return false;
    }
  }

  Future<bool> takePhotoForVerification() async {
    try {
      // Request camera permission first
      final cameraPermissionGranted = await requestCameraPermission();
      if (!cameraPermissionGranted) {
        Get.snackbar(
          "Izin Kamera Diperlukan", 
          "Aplikasi membutuhkan akses kamera untuk verifikasi foto",
          backgroundColor: AppColors.red,
          colorText: AppColors.white,
        );
        return false;
      }
      
      final ImagePicker picker = ImagePicker();
      final XFile? photo = await picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 80,
        maxWidth: 1024,
        maxHeight: 1024,
      );
      
      if (photo != null) {
        photoPath.value = photo.path;
        return true;
      } else {
        return false;
      }
    } catch (e) {
      Get.snackbar(
        "Error Kamera", 
        "Gagal mengambil foto: ${e.toString()}",
        backgroundColor: AppColors.red,
        colorText: AppColors.white,
      );
      return false;
    }
  }

  Future<bool> requestCameraPermission() async {
    try {
      if (Platform.isIOS) {
        // iOS camera permission
        var status = await Permission.camera.status;
        if (status.isDenied || status.isRestricted) {
          status = await Permission.camera.request();
        }
        return status.isGranted;
      } else {
        // Android camera permission
        var status = await Permission.camera.status;
        if (status.isDenied) {
          status = await Permission.camera.request();
        }
        return status.isGranted;
      }
    } catch (e) {
      debugPrint("Error requesting camera permission: $e");
      return false;
    }
  }

  void doAbsence() async {
    
    final biometricSuccess = await verifyBiometric();
    
    if (biometricSuccess) {
      if (listabsence.isNotEmpty) {
        await submitAbsenceOutData();
      } else {
        await submitAbsenceData();
      }
    }
  }

  Future<void> submitAbsenceData() async {
    Get.dialog(PopUpLoad());
    
    try {
      final success = await scheduleabsenrepo.saveAbsence(
        lat: lat.value,
        lng: long.value,
        type: typeabsence.value == "Absensi Masuk" ? "1" : "2",
        location: locationnow.value,
        isFree: locationdata.value!.freeGeo,
        photoPath: photoPath.value,
      );
      
      
      if (success) {
        Get.back();
        Get.dialog(
          PopUpNotifikasi(
            status: false.obs, 
            title: "Berhasil melakukan absensi!", 
            msg: "Data Anda telah berhasil disimpan ke dalam sistem dengan aman.",
            onTap: () {
              Navigator.pop(Get.context!);
              disableformabsence();
              initialiaze();
              final c = Get.find<HomeController>();
              c.refreshdata();
            },
          )
        );
      } else {
        Get.back();
        Get.dialog(
          PopUpNotifikasi(
            status: true.obs, 
            title: "Gagal melakukan absensi!", 
            msg: scheduleabsenrepo.msgfail,
            onTap: () {
              Navigator.pop(Get.context!);
            },
          )
        );
      }
      
    } catch (e) {
      Get.back();
      Get.dialog(
          PopUpNotifikasi(
            status: false.obs, 
            title: "Terjadi Kesalahan!", 
            msg: "${e.toString()}.",
            onTap: () {
              Navigator.pop(Get.context!);
            },
          )
        );
    }
  }

  Future<void> submitAbsenceOutData() async {
    Get.dialog(PopUpLoad());
    
    try {
      await fetchAbsenStatus();
      if (absenStatus.value != null) {
        final success = await scheduleabsenrepo.saveAbsenceOut(
          lat: lat.value,
          lng: long.value,
          type: typeabsence.value == "Absensi Masuk" ? "1" : "2",
          location: locationnow.value,
          isFree: locationdata.value!.freeGeo,
          photoPath: photoPath.value,
          absenceId: absenStatus.value!.idAbsen,
        );
        
        
        if (success) {
          Get.back();
          Get.dialog(
            PopUpNotifikasi(
              status: false.obs, 
              title: "Berhasil melakukan absensi!", 
              msg: "Data Anda telah berhasil disimpan ke dalam sistem dengan aman.",
              onTap: () {
                Navigator.pop(Get.context!);
                disableformabsence();
                initialiaze();
                final c = Get.find<HomeController>();
                c.refreshdata();
              },
            )
          );
        } else {
          Get.back();
          Get.dialog(
            PopUpNotifikasi(
              status: true.obs, 
              title: "Gagal melakukan absensi!", 
              msg: scheduleabsenrepo.msgfail,
              onTap: () {
                Navigator.pop(Get.context!);
              },
            )
          );
        }
      } else {
        Get.back();
        Get.dialog(
          PopUpNotifikasi(
            status: false.obs, 
            title: "Gagal melakukan absensi!", 
            msg: scheduleabsenrepo.msgfail,
            onTap: () {
              Navigator.pop(Get.context!);
            },
          )
        );
      }
    } catch (e) {
      Get.back();
      Get.dialog(
          PopUpNotifikasi(
            status: false.obs, 
            title: "Terjadi Kesalahan!", 
            msg: "${e.toString()}.",
            onTap: () {
              Navigator.pop(Get.context!);
            },
          )
        );
    }
  }

  Future<void> fetchLocationData() async {
    try {
      final locations = await scheduleabsenrepo.getLocationAbsence();
      print('Fetched locations: $locations');
      
      if (locations != null) {
        locationdata.value = locations;
        locationList.assignAll(locations.data);
        print('Fetched ${locations.data.length} locations');
        
        for (var loc in locations.data) {
          print('Location: ${loc.name} - Lat: ${loc.lat}, Lng: ${loc.lng}, Distance: ${loc.distance}');
        }
        
        updateMarkersAndCircles();
      } else {
        print('No location data received');
      }
    } catch (e) {
      print('Error fetching location data: $e');
    }
  }

  void updateMarkersAndCircles() async {
    Set<Marker> newMarkers = {};
    Set<Circle> newCircles = {};
    
    print('Updating markers and circles...');
    print('Location list count: ${locationList.length}');
    
    var position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    lat.value = position.latitude;
    long.value = position.longitude;
    
    print('Current location: ${lat.value}, ${long.value}');
    print(locationList);

    // Add current location marker
    if (lat.value != 0.0 && long.value != 0.0) {
      newMarkers.add(
        Marker(
          markerId: MarkerId('current_location'),
          position: LatLng(lat.value, long.value),
          infoWindow: InfoWindow(
            title: 'Lokasi Anda',
            snippet: 'Posisi saat ini',
          ),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        ),
      );
      print('Added current location marker');
    }

    // Add location markers and circles
    for (var location in locationList) {
      try {
        final lat = double.parse(location.lat);
        final lng = double.parse(location.lng);
        final radius = double.parse(location.distance);
        
        newMarkers.add(
          Marker(
            markerId: MarkerId('location_${location.id}'),
            position: LatLng(lat, lng),
            infoWindow: InfoWindow(
              title: location.name,
              snippet: 'Area Absensi - Radius ${radius}m',
            ),
            icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          ),
        );

        newCircles.add(
          Circle(
            circleId: CircleId('circle_${location.id}'),
            center: LatLng(lat, lng),
            radius: radius,
            fillColor: AppColors.red.withOpacity(0.2),
            strokeColor: AppColors.red,
            strokeWidth: 2,
          ),
        );
        
        print('Added marker and circle for ${location.name} at $lat, $lng with radius $radius');
      } catch (e) {
        print('Error parsing location ${location.name}: $e');
      }
    }

    print('Total markers: ${newMarkers.length}');
    print('Total circles: ${newCircles.length}');
    
    markers.assignAll(newMarkers);
    circles.assignAll(newCircles);
  }

  void enableabsenceform() async {
    Get.dialog(PopUpLoad());
    datenow.value = DateFormat('EEEE, d MMMM yyyy', 'id').format(DateTime.now());
    name.value = LocalDB.user!.activeEmployee.nameEmployee;
    typeabsence.value = listabsence.isNotEmpty && listabsence.length == 1 ? "Absen Pulang" : "Absensi Masuk";
    final GoogleMapsFlutterPlatform mapsImplementation = GoogleMapsFlutterPlatform.instance;
    if (mapsImplementation is GoogleMapsFlutterAndroid) {
      mapsImplementation.useAndroidViewSurface = true;
      mapsImplementation.initializeWithRenderer(AndroidMapRenderer.latest);
    }
    fetchLocationData();
    if(Platform.isIOS){
      final locationGranted = await requestIOSLocationPermission();
      final preciseLocationGranted = await requestIOSPreciseLocationPermission();
      final trackingGranted = await requestIOSTrackingPermission();
      
      debugPrint("iOS Location Permission: $locationGranted");
      debugPrint("iOS Precise Location Permission: $preciseLocationGranted");
      debugPrint("iOS Tracking Permission: $trackingGranted");
      
      if (locationGranted) {
        await _getCurrentLocationAndAddress();
      } else {
        debugPrint("iOS Location permission denied");
        locationnow.value = "Izin lokasi diperlukan";
      }
    } else {
      final locationGranted = await requestAndroidLocationPermission();
      
      if (locationGranted) {
        await _getCurrentLocationAndAddress();
      } else {
        debugPrint("Android Location permission denied");
        locationnow.value = "Izin lokasi diperlukan";
      }
    }
    updateMarkersAndCircles();
    showformabsence.value = true;
    Get.back();
  }

  Future<void> _getCurrentLocationAndAddress() async {
    try {
      var position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      lat.value = position.latitude;
      long.value = position.longitude;
      positionnow.value = "${position.latitude}, ${position.longitude}";
      
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;
        locationnow.value = "${place.street}, ${place.subLocality}, ${place.locality}, ${place.administrativeArea}, ${place.postalCode}";
      } else {
        locationnow.value = "-";
      }
    } catch (e) {
      debugPrint("Error getting location: $e");
      locationnow.value = "Error mendapatkan lokasi";
    }
  }

  void refreshlocation() async {
    Get.dialog(PopUpLoad());
    var position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    lat.value = position.latitude;
    long.value = position.longitude;
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
    updateMarkersAndCircles();
    Get.back();
  }
}
