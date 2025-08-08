import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import '../../../../core/colors.dart';
import '../controller/schedule_controller.dart';

class ScheduleViews extends GetView<ScheduleController> {
  const ScheduleViews({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> listHari = [
      'Senin',
      'Selasa',
      'Rabu',
      'Kamis',
      'Jumat',
      'Sabtu',
    ];

    return Scaffold(
      backgroundColor: AppColors.gradient,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => Get.back(),
                  overlayColor: WidgetStateProperty.all(Colors.transparent),
                  child: Icon(
                    IconsaxPlusLinear.arrow_left_1,
                    color: AppColors.black2,
                    size: 24.sp,
                  ),
                ),
                Text(
                  "Jadwal Kerja Pegawai",
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontFamily: 'SemiBold',
                      color: AppColors.black2),
                ),
                SizedBox.shrink()
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(6, (index) {
                  return builditemschedule(day: listHari[index]);
                },),
              ),
            )
          )
        ],
      ),
    );
  }

  Widget builditemschedule({required String day}) {
    return Stack(
      clipBehavior: Clip.none, // biar label bisa "keluar"
      children: [
        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          padding: const EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  spacing: 15,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Container(
                        height: 60,
                        width: 4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                          color: AppColors.black6
                        ),
                      ),
                    ),
                    
                    // Jam Masuk
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '08.00',
                          style: TextStyle(
                            fontSize: 26.sp,
                            fontFamily: 'Bold',
                            color: AppColors.black
                          ),
                        ),
                        Text(
                          'Jam Masuk',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.grey,
                            height: 0.8
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                    
                // Tengah: teks "Sampai Dengan"
                Column(
                  children: const [
                    Text(
                      'Sampai',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      'Dengan',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                    
                // Jam Pulang
                Row(
                  spacing: 20,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '17.00',
                          style: TextStyle(
                            fontSize: 26.sp,
                            fontFamily: 'Bold',
                            color: AppColors.black
                          ),
                        ),
                        Text(
                          'Jam Pulang',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.grey,
                            height: 0.8
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Container(
                        height: 60,
                        width: 4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                          color: AppColors.black6
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
    
        // Label hari di atas kiri kontainer
        Positioned(
          top: 3,
          left: 18,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
            decoration: BoxDecoration(
              color: getDayBackgroundColor(day),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              day,
              style: TextStyle(
                fontSize: 15.sp,
                fontFamily: 'Medium',
                color: AppColors.black
              ),
            ),
          ),
        ),
      ],
    );
  }

  Color getDayBackgroundColor(String hari) {
    switch (hari.toLowerCase()) {
      case 'senin':
        return ColorsSchedule.green;
      case 'selasa':
        return ColorsSchedule.blue;
      case 'rabu':
        return ColorsSchedule.yellow;
      case 'kamis':
        return ColorsSchedule.indigo;
      case 'jumat':
        return ColorsSchedule.red;
      case 'sabtu':
        return ColorsSchedule.green2;
      default:
        return Colors.grey[300]!;
    }
  }

}
