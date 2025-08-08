import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solusi/core/colors.dart';

class Education extends StatelessWidget {
  const Education({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: 5,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          builditemform(
            title: "Pendidikan Terakhir",
            value: "SD",
            isRow: true,
            title2: "Gelar",
            value2: "S1",
          ),
          builditemform(
            title: "Nilai IPK/Rapor",
            value: "4.00",
            isRow: false,
          ),
          builditemform(
            title: "Nama Instansi",
            value: "Universitas Negeri Malang",
            isRow: false,
          ),
          builditemform(
            title: "Fakultas",
            value: "Fakultas Teknologi Informasi",
            isRow: false,
          ),
          builditemform(
            title: "Jurusan",
            value: "Teknik Informatika",
            isRow: false,
          ),
          builditemform(
            title: "Kota/Kab",
            value: "Malang,",
            isRow: true,
            title2: "Provinsi",
            value2: "Jawa Timur",
          ),
          builditemform(
            title: "Konsentrasi",
            value: "Bidang IT",
            isRow: false,
          ),
          builditemform(
            title: "Alamat Instansi",
            value: "Jl. Lingkar Maskumambang No.1, Sukorame, Kec. Mojoroto, Kota Kediri, Jawa Timur 64119, Indonesia.",
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