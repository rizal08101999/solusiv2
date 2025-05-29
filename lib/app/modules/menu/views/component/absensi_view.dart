// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:solusi/app/modules/menu/controllers/absensi_controller.dart';
import 'package:solusi/core/colors.dart';

class AbsensiView extends GetView<AbsensiController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.loading.isTrue ||
            controller.currentPosition == null
        ? SafeArea(
            child: Scaffold(
              body: Center(
                  child: CircularProgressIndicator(
                color: DataColors.grey,
              )),
            ),
          )
        : SafeArea(
            child: Scaffold(
              body: Stack(
                children: [
                  Obx(
                    () => GoogleMap(
                      mapType: MapType.normal,
                      zoomControlsEnabled: false,
                      markers: controller.currentMarker.value,
                      initialCameraPosition: CameraPosition(
                          zoom: 18,
                          target: LatLng(controller.currentPosition!.latitude,
                              controller.currentPosition!.longitude)),
                    ),
                  ),
                  Align(
                    alignment: const Alignment(0, .9),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Material(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(18)),
                        color: DataColors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(18),
                          child: SizedBox(
                            height: 220.sp,
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding: EdgeInsets.only(left: 5.sp, right: 5.sp),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Lokasi Sekarang",
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                        color: DataColors.black),
                                  ),
                                  SizedBox(
                                    height: 5.sp,
                                  ),
                                  Text(
                                    controller.address.value,
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                        color: DataColors.black),
                                  ),
                                  SizedBox(
                                    height: 10.sp,
                                  ),
                                  Text(
                                    "Koordinat",
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                        color: DataColors.black),
                                  ),
                                  SizedBox(
                                    height: 5.sp,
                                  ),
                                  StreamBuilder(
                                    stream: Geolocator.getPositionStream(),
                                    builder: (context, snapshot) {
                                      return Text(
                                        snapshot.data == null
                                            ? ""
                                            : "${snapshot.data!.latitude}, ${snapshot.data!.longitude}",
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w500,
                                            color: DataColors.black),
                                      );
                                    },
                                  ),
                                  SizedBox(
                                    height: 20.sp,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 100.sp),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 45.sp,
                                          width: 110.sp,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8.sp),
                                              color: Colors.red[700]),
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: 11.sp),
                                                child: Icon(
                                                  Icons.logout_rounded,
                                                  size: 24.sp,
                                                  color: DataColors.white,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 8.sp),
                                                child: Text(
                                                  "Pulang",
                                                  style: TextStyle(
                                                      fontSize: 16.sp,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: DataColors.white),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10.sp,
                                        ),
                                        Container(
                                          height: 45.sp,
                                          width: 110.sp,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8.sp),
                                              color: Colors.green[600]),
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: 11.sp),
                                                child: Icon(
                                                  Icons.login_rounded,
                                                  size: 24.sp,
                                                  color: DataColors.white,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 8.sp),
                                                child: Text(
                                                  "Masuk",
                                                  style: TextStyle(
                                                      fontSize: 16.sp,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: DataColors.white),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const Alignment(-1, -.9),
                    child: Material(
                      color: DataColors.white,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(90),
                        bottomRight: Radius.circular(90),
                      ),
                      elevation: 1,
                      child: InkWell(
                        onTap: () {
                          Get.back();
                        },
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(90),
                          bottomRight: Radius.circular(90),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.chevron_left,
                                color: DataColors.black,
                              ),
                            ),
                            const SizedBox(width: 18),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ));
  }
}
