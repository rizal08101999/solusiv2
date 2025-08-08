import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solusi/core/colors.dart';

class Personaldata extends StatelessWidget {
  const Personaldata({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: 5,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          builditemform(
            title: "No. KTP",
            value: "0213543216546",
            isRow: true,
            title2: "No. KK",
            value2: "0213543216546",
          ),
          builditemform(
            title: "Nama",
            value: "A. Badawi",
            isRow: false,
          ),
          builditemform(
            title: "Panggilan",
            value: "Badawi",
            isRow: false,
          ),
          builditemform(
            title: "Tempat tanggal lahir",
            value: "Malang, 27 Maret 1993",
            isRow: false,
          ),
          builditemform(
            title: "Jenis Kelamin",
            value: "Laki-laki",
            isRow: true,
            title2: "Agama",
            value2: "Islam",
          ),
          builditemform(
            title: "Domisili",
            value: "Malang, Jawa Timur",
            isRow: false,
          ),
          builditemform(
            title: "Desa/Dusun",
            value: "Polowijen",
            isRow: true,
            title2: "Kecamatan",
            value2: "Blimbing",
          ),
          builditemform(
            title: "Kota/Kab",
            value: "Kota Malang",
            isRow: true,
            title2: "Provinsi",
            value2: "Jawa Timur",
          ),
          builditemform(
            title: "Status Menikah",
            value: "Menikah",
            isRow: true,
            title2: "Telp",
            value2: "081234567890",
          ),
          builditemform(
            title: "Email",
            value: "badawi@gmail.com",
            isRow: false,
          ),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }

  Widget builditemform({
    required String title,
    required String value,
    required bool isRow,
    String? title2,
    String? value2,
    VoidCallback? onTap,
  }) {
    if (isRow == true) {
      return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 5),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              // Bagian kiri
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 13.sp, 
                        fontFamily: 'SemiBold',
                        color: AppColors.grey11,
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      width: double.infinity, // Tambahkan ini
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: AppColors.grey10,
                        ),
                      ),
                      child: Text(
                        value,
                        style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10),
              // Bagian kanan
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title2 ?? "",
                      style: TextStyle(
                        fontSize: 13.sp, 
                        fontFamily: 'SemiBold',
                        color: AppColors.grey11,
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      width: double.infinity, // Tambahkan ini
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: AppColors.grey10,
                        ),
                      ),
                      child: Text(
                        value2 ?? "",
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 6),
        child: Column(
          spacing: 5,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 13.sp, 
                fontFamily: 'SemiBold',
                color: AppColors.grey11,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: AppColors.grey10,
                ),
              ),
              child: Text(
                value,
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
              ),
            )
          ],
        ),
      );
    }
    
  }
}