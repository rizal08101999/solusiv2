import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/colors.dart';
import '../controller/pkwt_controller.dart';

class PkwtViews extends GetView<PkwtController> {
  const PkwtViews({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> kontrakList = [
      {
        "id": "1",
        "tglmulai": "12 Mei 2023",
        "tglakhir": "12 Februari 2028",
        "status": "Aktif",
      },
      {
        "id": "2",
        "tglmulai": "15 April 2023",
        "tglakhir": "10 Oktober 2028",
        "status": "Tidak Aktif",
      },
    ];
    return SingleChildScrollView(
      child: Column(
        spacing: 5,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          builditemform(
            title: "Departement",
            value: "OPERASIONAL",
            isRow: false,
          ),
          builditemform(
            title: "Bagian",
            value: "UMUM",
            isRow: false,
          ),
          builditemform(
            title: "Jabatan",
            value: "Kepala OPERASIONAL",
            isRow: false,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5,),
            child: Text(
              "Detail Komtrak", 
              style: TextStyle(
                fontSize: 13.sp,
                fontFamily: 'SemiBold',
                color: AppColors.black2,
              )
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Column(
              children: [
                buildRow(['No', 'Tanggal Mulai', 'Tanggal Akhir', 'Status'], isHeader: true, rowIndex: 0, totalRows: kontrakList.length + 1,flex: 3, fixedWidth: 40),
                ...List.generate(kontrakList.length, (i) {
                  final item = kontrakList[i];
                  return buildRow([
                    item['id'] ?? '',
                    item['tglmulai'] ?? '',
                    item['tglakhir'] ?? '',
                    item['status'] ?? '',
                  ], rowIndex: i + 1, totalRows: kontrakList.length + 1, flex: 2, fixedWidth: 40);
                }),   
              ],
            ),
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


  Widget buildRow(
    List<String> cells, {
    bool isHeader = false,
    int? fixedWidth,
    required int flex,
    required int rowIndex,
    required int totalRows,
  }) {
    final bool isLast = rowIndex == totalRows - 1;

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: List.generate(
          cells.length,
          (index) {
            if (index == 0) {
              // Kolom pertama selalu fixed width
              return Container(
                padding: EdgeInsets.all(8),
                width: fixedWidth!.toDouble(),
                decoration: BoxDecoration(
                  border: isHeader?  
                  Border(
                      top: BorderSide(color: AppColors.grey12, width: 0.8),
                      right: BorderSide(color: AppColors.grey12, width: 0.8),
                      bottom: BorderSide(color: AppColors.grey12, width: 0.8),
                      left: BorderSide(color: AppColors.grey12, width: 0.8),
                    ) :
                    Border(
                      top: BorderSide(color: AppColors.grey6),
                      right: BorderSide(color: AppColors.grey6),
                      bottom: isLast ? BorderSide(color: AppColors.grey6) : BorderSide.none,
                      left: index == 0 ? BorderSide(color: AppColors.grey6) : BorderSide.none,
                    ),
                  color: isHeader ? AppColors.white : Colors.transparent,
                ),
                child: Center(
                  child: Text(
                    cells[index],
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontFamily: 'Medium',
                      color: isHeader ? AppColors.black2 : AppColors.grey13,
                    ),
                  ),
                ),
              );
            } else if(index == cells.length - 1) {
              return 
               Container(
                padding: EdgeInsets.all(8),
                width: 100,
                decoration: BoxDecoration(
                  border: isHeader?  
                  Border(
                      top: BorderSide(color: AppColors.grey12, width: 0.8),
                      right: BorderSide(color: AppColors.grey12, width: 0.8),
                      bottom: BorderSide(color: AppColors.grey12, width: 0.8),
                      left: BorderSide(color: AppColors.grey12, width: 0.8),
                    ) :
                    Border(
                      top: BorderSide(color: AppColors.grey6),
                      right: BorderSide(color: AppColors.grey6),
                      bottom: isLast ? BorderSide(color: AppColors.grey6) : BorderSide.none,
                      left: index == 0 ? BorderSide(color: AppColors.grey6) : BorderSide.none,
                    ),
                  color: isHeader ? AppColors.white : Colors.transparent,
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: cells[index] == "Aktif" ? 10 : 8, vertical: 5),
                    decoration: BoxDecoration(
                      color: isHeader ? Colors.transparent : cells[index] == "Aktif" ? Colors.green : AppColors.red,
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: Text(
                      cells[index],
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontFamily: 'Medium',
                        color: isHeader ? AppColors.black2 :cells[index] == "Aktif" || cells[index] == "Tidak Aktif" ? AppColors.white :AppColors.grey13,
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return Expanded(
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: isHeader ?
                    Border(
                      top: BorderSide(color: AppColors.grey12, width: 0.8),
                      right: BorderSide(color: AppColors.grey12, width: 0.8),
                      bottom: BorderSide(color: AppColors.grey12, width: 0.8),
                      left: BorderSide(color: AppColors.grey12, width: 0.8),
                    ) :
                    Border(
                      top: isHeader ? BorderSide(color: AppColors.grey12) : BorderSide(color: AppColors.grey6),
                      right: isHeader ? BorderSide(color: AppColors.grey12) : BorderSide(color: AppColors.grey6),
                      bottom: isLast ? BorderSide(color: AppColors.grey12) : BorderSide.none,
                      left: index == 0 ? BorderSide(color: AppColors.grey12) : BorderSide.none,
                    ),
                    color: isHeader ? AppColors.white : Colors.transparent,
                  ),
                  child: Align(
                    alignment: isHeader ? Alignment.center : cells[index].length > 25 ? Alignment.centerLeft : Alignment.center,
                    child: Text(
                      cells[index],
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontFamily: 'Medium',
                        color: isHeader ? AppColors.black2 : AppColors.grey13,
                      ),
                    ),
                  ),
                ),
              );
            }
          }
        ),
      ),
    );
  }
}
