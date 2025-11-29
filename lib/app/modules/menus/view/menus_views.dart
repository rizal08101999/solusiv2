import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:solusi/app/modules/biodata/controller/biodata_controller.dart';
import 'package:solusi/app/modules/pkwt/controller/pkwt_controller.dart';
import 'package:solusi/app/routes/app_pages.dart';
import 'package:solusi/core/colors.dart';
import '../../sp/controller/sp_controller.dart';
import '../controller/menus_controller.dart';

class MenusViews extends GetView<MenusController> {
  const MenusViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        spacing: 15,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Main Menu',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontFamily: 'Bold',
                  color: AppColors.black2,
                ),
              ),
              InkWell(
                onTap: () => Get.back(),
                overlayColor: WidgetStateProperty.all(Colors.transparent),
                child: Icon(
                  Icons.close,
                  size: 24.sp,
                  color: AppColors.grey,
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: buildsection(
              titlemenu: "Data Kepegawaian", 
              listmenu: [
                buildMenuItem(
                  title: 'Biodata',
                  icon: 'ic_biodata',
                  onTap: () async {
                    Get.back();
                    Get.toNamed(Routes.EMPLOYEE, arguments: "1");
                    await Future.delayed(const Duration(milliseconds: 500));
                    final c = Get.find<BiodataController>();
                    c.getPersonalData();
                  },
                  color: [
                    AppColors.gradientbrown,
                    AppColors.gradientbrown2,
                  ],
                ),
                buildMenuItem(
                  title: 'PKWT',
                  icon: 'ic_pkwt',
                  onTap: () async {
                    Get.back();
                    Get.toNamed(Routes.EMPLOYEE, arguments: "2");
                    await Future.delayed(const Duration(milliseconds: 500));
                    final c = Get.find<PkwtController>();
                    c.getPkwtData();
                  },
                  color: [
                    AppColors.gradientbrown,
                    AppColors.gradientbrown2,
                  ],
                ),
                buildMenuItem(
                  title: 'Surat\nPeringatan',
                  icon: 'ic_sp',
                  onTap: () async {
                    Get.back();
                    Get.toNamed(Routes.EMPLOYEE, arguments: "3");
                    await Future.delayed(const Duration(milliseconds: 500));
                    final c = Get.find<SpController>();
                    c.getSpData();
                  },
                  color: [
                    AppColors.gradientbrown,
                    AppColors.gradientbrown2,
                  ],
                ),
              ]
            ),
          ),
          buildsection(
            titlemenu: "Jadwal Kerja dan Absensi", 
            listmenu: [
              buildMenuItem(
                title: 'Jadwal',
                icon: 'ic_schedule',
                onTap: () {
                  Get.back();
                  Get.toNamed(Routes.JADWAL);
                },
                color: [
                  AppColors.grey6,
                  AppColors.grey5,
                ],
              ),
              buildMenuItem(
                title: 'Absensi',
                icon: 'ic_absence',
                onTap: () {
                  Get.back();
                  Get.toNamed(Routes.ABSENSI);
                },
                color: [
                  AppColors.grey6,
                  AppColors.grey5,
                ],
              ),
              buildMenuItem(
                title: 'Riwayat',
                icon: 'ic_history',
                onTap: () {
                  Get.back();
                  Get.toNamed(Routes.RIWAYAT);
                },
                color: [
                  AppColors.grey6,
                  AppColors.grey5,
                ],
              ),
              buildMenuItem(
                title: 'Lembur',
                icon: 'ic_overtime',
                onTap: () {
                  Get.back();
                  Get.toNamed(Routes.OVERTIME);
                },
                color: [
                  AppColors.grey5,
                  AppColors.grey6,
                ],
              ),
              buildMenuItem(
                title: 'Izin/Cuti',
                icon: 'ic_leave',
                onTap: () {
                  Get.back();
                  Get.toNamed(Routes.LEAVE);
                },
                color: [
                  AppColors.grey5,
                  AppColors.grey6,
                ],
              ),
            ],
          ),
          buildsection(
            titlemenu: "Tugas dan Gaji", 
            listmenu: [
              buildMenuItem(
                title: 'Task',
                icon: 'ic_task',
                onTap: () {
                  Get.back();
                  Get.toNamed(Routes.TASK);
                },
                color: [
                  AppColors.orange,
                  AppColors.orange,
                ],
              ),
              buildMenuItem(
                title: 'Gaji',
                icon: 'ic_sallary',
                onTap: () {
                  Get.back();
                  Get.toNamed(Routes.SALARY);
                },
                color: [
                  AppColors.orange,
                  AppColors.orange,
                ],
              ),
              buildMenuItem(
                title: 'KPI',
                icon: 'ic_kpi',
                onTap: () {
                  Get.back();
                  Get.toNamed(Routes.KPI);
                },
                color: [
                  AppColors.orange,
                  AppColors.orange,
                ],
              ),
            ]
          ),
        ],
      ),
    );
  }

  Widget buildsection({required String titlemenu, required List<Widget> listmenu}) {
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titlemenu,
          style: TextStyle(
            fontSize: 16.sp,
            fontFamily: 'SemiBold',
            color: AppColors.black2,
          ),
        ),
        Wrap(
          spacing: 35,
          runSpacing: 10,
          children: listmenu,
        )
      ],
    );
  }

  Widget buildMenuItem({required String title, required String icon, required VoidCallback onTap, required List<Color> color}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30.sp),
      overlayColor: WidgetStateProperty.all(Colors.transparent),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(15.sp),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: color,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: SvgPicture.asset(
              'assets/icons/$icon.svg',
              width: 24,
              height: 24,
            ),
          ),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 14.sp,
              fontFamily: 'Medium',
              color: AppColors.black2,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
