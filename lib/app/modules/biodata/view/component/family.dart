import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solusi/core/colors.dart';

class Family extends StatelessWidget {
  const Family({super.key});
  

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> anakList = [
      {
        "nama": "Budi Susanto Gemilangg",
        "jk": "Laki-laki",
        "tgl": "20 November 2015",
      },
      {
        "nama": "Dina",
        "jk": "Perempuan",
        "tgl": "12 Mei 2023",
      },
    ];
    final List<Map<String, String>> kerabatList = [
      {
        "nama": "Kerabat 1",
        "hubungan": "Sepupu",
        "telp": "08123456789",
      },
      {
        "nama": "Kerabat 2",
        "hubungan": "Keponakan",
        "telp": "08123456789",
      },
    ];

    return SingleChildScrollView(
      child: Column(
        spacing: 5,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          builditemform(
            title: "Nama Ayah Kandung",
            value: "Budi Santoso",
            isRow: false,
          ),
          builditemform(
            title: "Nama Ibu Kandung",
            value: "Siti Aminah",
            isRow: false,
          ),
          builditemform(
            title: "Nama Suami/Istri",
            value: "Dewi Lestari",
            isRow: false,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5,),
            child: Text(
              "Data Anak", 
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
                buildRow(['Nama', 'Jenis Kelamin', 'Tanggal Lahir',], isHeader: true, rowIndex: 0, totalRows: anakList.length + 1,flex: 3, fixedWidth: 130, fixedWidth2: 110),
                ...List.generate(anakList.length, (i) {
                  final item = anakList[i];
                  return buildRow([
                    item['nama'] ?? '',
                    item['jk'] ?? '',
                    item['tgl'] ?? '',
                  ], rowIndex: i + 1, totalRows: anakList.length + 1, flex: 2, fixedWidth: 130, fixedWidth2: 110);
                }),   
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5, top: 10),
            child: Text(
              "Data Kerabat", 
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
                buildRow(['Nama', 'Hubungan', 'Telp/WA',], isHeader: true, rowIndex: 0, totalRows: kerabatList.length + 1,flex: 3, fixedWidth: 100, fixedWidth2: 100),
                ...List.generate(kerabatList.length, (i) {
                  final item = kerabatList[i];
                  return buildRow([
                    item['nama'] ?? '',
                    item['hubungan'] ?? '',
                    item['telp'] ?? '',
                  ], rowIndex: i + 1, totalRows: kerabatList.length + 1, flex: 2, fixedWidth: 100, fixedWidth2: 100);
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

  Widget tableCell(
    String text, {
    bool isFirst = false,
    bool isLast = false,
    bool isTop = false,
    bool isBottom = true,
    bool showRightBorder = true,
    Color borderColor = Colors.grey,
    Color? backgroundColor,
    TextAlign align = TextAlign.center,
    EdgeInsets padding = const EdgeInsets.all(8),
  }) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border(
          top: isTop ? BorderSide(color: borderColor) : BorderSide.none,
          left: isFirst ? BorderSide(color: borderColor) : BorderSide.none,
          right: showRightBorder
              ? BorderSide(color: borderColor)
              : BorderSide.none,
          bottom: isBottom ? BorderSide(color: borderColor) : BorderSide.none,
        ),
      ),
      child: isTop ?
      Text(
        text,
        textAlign: align,
        style: TextStyle(
          fontSize: 13.sp, 
          fontFamily: 'SemiBold',
          color: AppColors.black2,
        ),
      ) :
      Text(
        text, 
        textAlign: align,
        style: TextStyle(
          fontSize: 13.sp, 
          fontFamily: 'Medium',
          color: AppColors.grey13,
        ),
      ),
    );
  }

Widget buildRow(
    List<String> cells, {
    bool isHeader = false,
    int? fixedWidth,
    int? fixedWidth2,
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
                child: Text(
                  cells[index],
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontFamily: 'Medium',
                    color: isHeader ? AppColors.black2 : AppColors.grey13,
                  ),
                  textAlign: TextAlign.center,
                ),
              );
            } else if(index == 1){
              return Container(
                padding: EdgeInsets.all(8),
                width: fixedWidth2!.toDouble(),
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