// ignore_for_file: use_key_in_widget_constructors, deprecated_member_use

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:solusi/app/modules/menu/controllers/pkwt_controller.dart';
import 'package:solusi/core/colors.dart';

class PKWTView extends GetView<PkwtController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: DataColors.bg,
          extendBody: true,
          body: Padding(
            padding: EdgeInsets.only(top: 15.sp, left: 15.sp, right: 15.sp),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (){
                        Get.back();
                      },
                      child: FaIcon(
                        FontAwesomeIcons.angleLeft,
                        size: 25.sp,
                        color: DataColors.white,
                      ),
                    ),
                    Text(
                      "PKWT Pegawai",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: DataColors.white),
                    ),
                    const SizedBox.shrink()
                  ],
                ),
              ],
            ),
          ),
          bottomNavigationBar: Container(
            padding: EdgeInsets.only(top: 20.sp, left: 0.sp, right: 0.sp),
            height: MediaQuery.of(context).size.height <= 750
                ? MediaQuery.of(context).size.height / 1.35.sp
                : MediaQuery.of(context).size.height <= 770
                    ? MediaQuery.of(context).size.height / 1.25.sp
                    : MediaQuery.of(context).size.height / 1.165.sp,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.sp),
                  topRight: Radius.circular(30.sp),
                ),
                color: DataColors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 15.sp,
                  ),
                  child: Text(
                    "Departement",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: DataColors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.sp,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.sp, right: 15.sp),
                  child: Container(
                    height: 45.sp,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.sp),
                        color: DataColors.grey100),
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.sp),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Operational",
                          style: TextStyle(
                            fontSize: 14.sp,
                            letterSpacing: 0.8,
                            fontWeight: FontWeight.w600,
                            color: DataColors.black.withOpacity(0.8),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.sp,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 15.sp,
                  ),
                  child: Text(
                    "Bagian",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: DataColors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.sp,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.sp, right: 15.sp),
                  child: Container(
                    height: 45.sp,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.sp),
                        color: DataColors.grey100),
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.sp),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "DAIAHATSU123",
                          style: TextStyle(
                            fontSize: 14.sp,
                            letterSpacing: 0.8,
                            fontWeight: FontWeight.w600,
                            color: DataColors.black.withOpacity(0.8),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.sp,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 15.sp,
                  ),
                  child: Text(
                    "Jabatan",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: DataColors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.sp,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.sp, right: 15.sp),
                  child: Container(
                    height: 45.sp,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.sp),
                        color: DataColors.grey100),
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.sp),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "IT SUPPORT",
                          style: TextStyle(
                            fontSize: 14.sp,
                            letterSpacing: 0.8,
                            fontWeight: FontWeight.w600,
                            color: DataColors.black.withOpacity(0.8),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.sp,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 15.sp,
                  ),
                  child: Text(
                    "Penempatan",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: DataColors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.sp,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.sp, right: 15.sp),
                  child: Container(
                    height: 45.sp,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.sp),
                        color: DataColors.grey100),
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.sp),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "DAIAHATSU123",
                          style: TextStyle(
                            fontSize: 14.sp,
                            letterSpacing: 0.8,
                            fontWeight: FontWeight.w600,
                            color: DataColors.black.withOpacity(0.8),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.sp,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 15.sp,
                  ),
                  child: Text(
                    "Detail Kontrak",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: DataColors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.sp,
                ),
                MediaQuery.of(context).size.height <= 750 ? 
                Expanded(
                  child: DataTable2(
                    border: TableBorder.all(color: DataColors.bg),
                    dataRowHeight: 60,
                    minWidth: 340.sp,
                    headingRowHeight: 60,
                    // columnSpacing: 10,
                    horizontalMargin: 15,
                    smRatio: 5,
                    bottomMargin: 30,
                    lmRatio: 2,
                    headingRowColor:
                        WidgetStatePropertyAll(DataColors.headertable),
                    dataRowColor:
                        WidgetStatePropertyAll(DataColors.headertable),
                    columns: [
                      DataColumn2(
                        fixedWidth:  50.sp,
                        label: Center(
                          child: Text(
                            'NO',
                            style: TextStyle(
                              fontSize: 9.5,
                              fontWeight: FontWeight.w700,
                              color: DataColors.black,
                            ),
                          ),
                        ),
                      ),
                      DataColumn2(
                        fixedWidth: MediaQuery.of(context).size.height <= 750
                            ? 115.sp
                            : MediaQuery.of(context).size.height <= 770
                                ? 120.sp
                                : 110.sp,
                        label: Center(
                          child: Text(
                            'TANGGAL\nMULAI\nKONTRAK',
                            style: TextStyle(
                              fontSize: 9.5,
                              fontWeight: FontWeight.w700,
                              color: DataColors.black,
                            ),
                          ),
                        ),
                      ),
                      DataColumn2(
                        fixedWidth: 115.sp,
                        label: Center(
                            child: Text(
                          'TANGGAL\nMULAI\nAKHIR',
                          style: TextStyle(
                            fontSize: 9.5,
                            fontWeight: FontWeight.w700,
                            color: DataColors.black,
                          ),
                        )),
                      ),
                      DataColumn2(
                        fixedWidth: 80.sp,
                        label: Center(
                            child: Text(
                          'STATUS\nKONTRAK',
                          style: TextStyle(
                            fontSize: 9.5,
                            fontWeight: FontWeight.w700,
                            color: DataColors.black,
                          ),
                        )),
                      ),
                    ],
                    rows: <DataRow>[
                      DataRow(
                        cells: <DataCell>[
                          DataCell(
                            Center(
                            child: Text(
                              '1',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: DataColors.black,
                              ),
                            ),
                          )),
                          DataCell(Center(
                            child: Text('31 December 2023',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: DataColors.black,
                                )),
                          )),
                          DataCell(Center(
                            child: Text('00 000',
                                style: TextStyle(
                                  fontSize: 11.5,
                                  fontWeight: FontWeight.w500,
                                  color: DataColors.black,
                                )),
                          )),
                          DataCell(Container(
                            height: 30.sp,
                            width: 65.sp,
                            color: Colors.green[600],
                            child: Center(
                              child: Text('Aktif',
                                  style: TextStyle(
                                    fontSize: 11.5,
                                    fontWeight: FontWeight.w500,
                                    color: DataColors.white,
                                  )),
                            ),
                          )),
                        ],
                      ),
                    ],
                  ),
                ) :
                Expanded(
                  child: DataTable2(
                    border: TableBorder.all(color: DataColors.bg),
                    dataRowHeight: 60,
                    minWidth: 340.sp,
                    headingRowHeight: 60,
                    // columnSpacing: 10,
                    // horizontalMargin: 15,
                    smRatio: 5,
                    bottomMargin: 30,
                    lmRatio: 2,
                    headingRowColor:
                        WidgetStatePropertyAll(DataColors.headertable),
                    dataRowColor:
                        WidgetStatePropertyAll(DataColors.headertable),
                    columns: [
                      DataColumn2(
                        fixedWidth:  45.sp,
                        label: Center(
                          child: Text(
                            'NO',
                            style: TextStyle(
                              fontSize: 9.5,
                              fontWeight: FontWeight.w700,
                              color: DataColors.black,
                            ),
                          ),
                        ),
                      ),
                      DataColumn2(
                        fixedWidth: MediaQuery.of(context).size.height <= 750
                            ? 115.sp
                            : MediaQuery.of(context).size.height <= 770
                                ? 120.sp
                                : 110.sp,
                        label: Center(
                          child: Text(
                            'TANGGAL\nMULAI\nKONTRAK',
                            style: TextStyle(
                              fontSize: 9.5,
                              fontWeight: FontWeight.w700,
                              color: DataColors.black,
                            ),
                          ),
                        ),
                      ),
                      DataColumn2(
                        fixedWidth: 115.sp,
                        label: Center(
                            child: Text(
                          'TANGGAL\nMULAI\nAKHIR',
                          style: TextStyle(
                            fontSize: 9.5,
                            fontWeight: FontWeight.w700,
                            color: DataColors.black,
                          ),
                        )),
                      ),
                      DataColumn2(
                        fixedWidth: 80.sp,
                        label: Center(
                            child: Text(
                          'STATUS\nKONTRAK',
                          style: TextStyle(
                            fontSize: 9.5,
                            fontWeight: FontWeight.w700,
                            color: DataColors.black,
                          ),
                        )),
                      ),
                    ],
                    rows: <DataRow>[
                      DataRow(
                        cells: <DataCell>[
                          DataCell(
                            Center(
                            child: Text(
                              '1',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: DataColors.black,
                              ),
                            ),
                          )),
                          DataCell(Center(
                            child: Text('31 December 2023',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: DataColors.black,
                                )),
                          )),
                          DataCell(Center(
                            child: Text('00 000',
                                style: TextStyle(
                                  fontSize: 11.5,
                                  fontWeight: FontWeight.w500,
                                  color: DataColors.black,
                                )),
                          )),
                          DataCell(Container(
                            height: 30.sp,
                            width: 65.sp,
                            color: Colors.green[600],
                            child: Center(
                              child: Text('Aktif',
                                  style: TextStyle(
                                    fontSize: 11.5,
                                    fontWeight: FontWeight.w500,
                                    color: DataColors.white,
                                  )),
                            ),
                          )),
                        ],
                      ),
                    ],
                  ),
                )
                
              ],
            ),
          )),
    );
  }
}
