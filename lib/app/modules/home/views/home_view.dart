// ignore_for_file: use_key_in_widget_constructors,

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:shimmer/shimmer.dart';
import 'package:solusi/app/modules/home/controllers/home_controller.dart';
import 'package:solusi/core/colors.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height ,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bg_home.jpg'),
                fit: BoxFit.fill
            ),
          ),
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[
                        Text(
                          "Selamat Datang,",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: 'Medium',
                            color: AppColors.white
                          ),
                        ),
                        Obx(() => Text(
                          controller.name.value,
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontFamily: 'Bold',
                            color: AppColors.white
                          ),
                        )),
                      ],
                    ),
                    CircleAvatar(
                      radius: 24,
                      backgroundColor: AppColors.white,
                      child: Icon(
                        IconsaxPlusLinear.notification,
                        color: AppColors.black2,
                        size: 24,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.sp),
                      topRight: Radius.circular(20.sp),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(vertical: controller.loading.isTrue ? 30 : 40, horizontal: controller.loading.isTrue ? 5 : 15),
                  child: FadeIn(
                    duration: Duration(milliseconds: 550),
                    child: controller.loading.isTrue ? 
                    buildloading() :
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Absensi",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontFamily: 'SemiBold',
                                color: AppColors.black
                              ), 
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 5.w, horizontal: 10.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(999),
                                color: AppColors.grey6
                              ),
                              child: Text(
                                controller.datenow.value,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: 'Medium',
                                  color: AppColors.black2
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: 25),
                          child: Column(
                            spacing: 15,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(controller.absensi.length, (index) {
                              final item = controller.absensi[index];
                              return builditemresume(
                                icon: IconData(int.parse(item.codeIcon), fontFamily: item.fontFamily, fontPackage: item.fontPackage), 
                                title: item.label, 
                                subtitle: item.value
                              );
                            },),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Resume",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontFamily: 'SemiBold',
                                color: AppColors.black
                              ), 
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 5.w, horizontal: 10.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(999),
                                color: AppColors.grey6
                              ),
                              child: Text(
                                controller.monthnow.value,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: 'Medium',
                                  color: AppColors.black2
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Expanded(
                          child: GridView.builder(
                            physics: const BouncingScrollPhysics(),
                            padding: const EdgeInsets.only(top: 10),
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 15,
                              crossAxisSpacing: 15,
                              childAspectRatio: 3, // kamu bisa sesuaikan tinggi/lebar grid item
                            ),
                            itemCount: controller.resume.length, // ganti dengan datamu
                            itemBuilder: (context, index) {
                              final item = controller.resume[index];
                              return builditemresume(
                                icon: IconData(int.parse(item.codeIcon), fontFamily: item.fontFamily, fontPackage: item.fontPackage),
                                title: item.label,
                                subtitle: item.value.replaceAll(' Data',''),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },);
  }

  Widget buildloading() {
    return Shimmer.fromColors(
      baseColor: AppColors.grey6,
      highlightColor: AppColors.white,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 12,),
          child: Column(
            spacing: 15,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Container(
                  height: 45,
                  width: 125,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColors.grey6
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Container(
                  height: 180,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColors.grey6
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Container(
                  height: 55,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColors.grey6
                  ),
                ),
              ),
              SizedBox(
                height: 350, // atau tinggi yang kamu sesuaikan
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(top: 10),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    childAspectRatio: 2,
                  ),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.grey6,
                      ),
                    );
                  },
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget builditemresume({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Column(
      spacing: 5,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 14.sp,
            fontFamily: 'Medium',
            color: AppColors.grey7
          ),
        ),
        Row(
          spacing: 10,
          children: [
            ShaderMask(
              shaderCallback: (bounds) => LinearGradient(
                colors: [
                  AppColors.gradient5,
                  AppColors.gradient6
                ], // Ganti dengan gradient kamu
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ).createShader(bounds),
              blendMode: BlendMode.srcIn,
              child: Icon(
                icon,
                size: 24,
                color: Colors.white, // harus ada, tapi warnanya akan ditimpa oleh ShaderMask
              ),
            ),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 16.sp,
                fontFamily: 'Bold',
                color: subtitle == "-" ? AppColors.grey : AppColors.black
              ),
            )
          ],
        ),
      ],
    );
  }

  
}
