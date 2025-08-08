import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:solusi/app/modules/biodata/controller/biodata_controller.dart';
import 'package:solusi/app/modules/biodata/view/biodata_views.dart';
import 'package:solusi/app/modules/sp/view/sp_views.dart';
import '../../../../core/colors.dart';
import '../../pkwt/view/pkwt_views.dart';
import '../controller/employee_controller.dart';

class EmployeeViews extends GetView<EmployeeController> {
  const EmployeeViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          return Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/bg_pegawai2.png'),
                  fit: BoxFit.fill),
            ),
            child: Column(
              children: [
                // Header
                Padding(
                  padding: const EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () => Get.back(),
                        overlayColor:
                            WidgetStateProperty.all(Colors.transparent),
                        child: Icon(
                          IconsaxPlusLinear.arrow_left_1,
                          color: AppColors.white,
                          size: 24.sp,
                        ),
                      ),
                      Text(
                        controller.currentpage.value == 1
                            ? "Biodata Pegawai"
                            : controller.currentpage.value == 2
                                ? "PKWT Pegawai"
                                : "Surat Peringatan",
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontFamily: 'SemiBold',
                            color: AppColors.white),
                      ),
                      InkWell(
                        onTap: () {
                          showGeneralDialog(
                            context: context,
                            barrierDismissible: true,
                            barrierLabel: "Sidebar",
                            transitionDuration:
                                const Duration(milliseconds: 300),
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    itemRightDrawer(context),
                            transitionBuilder: (_, anim, __, child) {
                              return SlideTransition(
                                position: Tween(
                                        begin: const Offset(1, 0),
                                        end: Offset.zero)
                                    .animate(anim),
                                child: child,
                              );
                            },
                          );
                        },
                        overlayColor:
                            WidgetStateProperty.all(Colors.transparent),
                        child: Icon(
                          IconsaxPlusLinear.menu,
                          color: AppColors.white,
                          size: 24.sp,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 35),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.gradient,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.sp),
                        topRight: Radius.circular(25.sp),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric( vertical: 10, horizontal: 10),
                    child: controller.currentpage.value == 1
                        ? BiodataViews()
                        : controller.currentpage.value == 2
                        ? PkwtViews()
                        : SpViews()
                    ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget itemRightDrawer(BuildContext context) {
    return SafeArea(
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.7,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.gradientnavbar, AppColors.gradientnavbar2],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
          ),
          child: Material(
            color: Colors.transparent, // penting agar gradient terlihat
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Data Kepegawaian",
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontFamily: 'SemiBold',
                            color: Colors.white
                          )
                        ),
                        Icon(
                          Icons.close,
                          size: 24,
                          color: AppColors.white,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  builditemdrawer(
                    title: "Biodata Pegawai", 
                    icon: controller.currentpage.value == 1 ? IconsaxPlusBold.profile : IconsaxPlusLinear.profile, 
                    isSelected: (controller.currentpage.value == 1).obs,
                    onTap: () {
                      final c = Get.find<BiodataController>();
                      c.currentindex.value = 0;
                      Get.back();
                      controller.currentpage.value = 1;
                    }
                  ),
                  builditemdrawer(
                    title: "PKWT Pegawai", 
                    icon: controller.currentpage.value == 2 ? IconsaxPlusBold.teacher : IconsaxPlusLinear.teacher, 
                    isSelected: (controller.currentpage.value == 2).obs,
                    onTap: () {
                      Get.back();
                      controller.currentpage.value = 2;
                    }
                  ),
                  builditemdrawer(
                    title: "Surat Peringatan", 
                    isSelected: (controller.currentpage.value == 3).obs,
                    icon: controller.currentpage.value == 3 ? IconsaxPlusBold.briefcase : IconsaxPlusLinear.briefcase, 
                    onTap: () {
                      Get.back();
                      controller.currentpage.value = 3;
                    }
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget builditemdrawer({ 
    required String title,
    required IconData icon,
    required RxBool isSelected,
    VoidCallback? onTap,
  }) {
    return Obx(() => InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color : isSelected.isTrue ? AppColors.white : Colors.transparent,
          ),
          child: Row(
            children: [
              Icon(
                icon,
                size: 20.sp,
                color: isSelected.isTrue ? AppColors.black2 : AppColors.white,
              ),
              const SizedBox(width: 10),
              Text(
                title,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: isSelected.isTrue ? AppColors.black2 : AppColors.white,
                  fontFamily: 'Medium',
                ),
              ),
            ],
          ),
        ),
      ),
    ),);
  }
}
