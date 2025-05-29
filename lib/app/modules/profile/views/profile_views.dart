// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:solusi/app/modules/profile/controllers/profile_controller.dart';
import 'package:solusi/core/colors.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: DataColors.bg,
          body: Padding(
            padding: EdgeInsets.only(top: 15.sp),
            child: Column(
              children: [
                Center(
                  child: Text(
                    "Informasi Akun",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: DataColors.white),
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: Container(
              height: MediaQuery.of(context).size.height / 1.3.sp,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.sp),
                  topRight: Radius.circular(30.sp),
                ),
                color: DataColors.white,
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 50.sp, left: 25.sp, right: 25.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.account_circle,
                            size: 28.sp, color: DataColors.bg),
                        SizedBox(
                          width: 10.sp,
                        ),
                        Text(
                          'Informasi Akun',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 38.sp, right: 25.sp, top: 10.sp),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.all(0),
                            height: 20.sp,
                            width: 100.sp,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Nama',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(0),
                            height: 20.sp,
                            width: 30.sp,
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                ':',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(0),
                            height: 20.sp,
                            width: 150.sp,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'testing',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 38.sp, right: 25.sp, top: 0.sp),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.all(0),
                            height: 40.sp,
                            width: 100.sp,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Email',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(0),
                            height: 40.sp,
                            width: 30.sp,
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                ':',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(0),
                            height: 40.sp,
                            width: 150.sp,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'testing@gmail.com',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 38.sp, right: 25.sp, top: 0.sp),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.all(0),
                            height: 20.sp,
                            width: 100.sp,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Username',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(0),
                            height: 20.sp,
                            width: 30.sp,
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                ':',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(0),
                            height: 20.sp,
                            width: 150.sp,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'testing_absensi',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 38.sp, right: 25.sp, top: 10.sp),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.all(0),
                            height: 20.sp,
                            width: 100.sp,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'No Tlp',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(0),
                            height: 20.sp,
                            width: 30.sp,
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                ':',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(0),
                            height: 20.sp,
                            width: 150.sp,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                '081111111111',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 38.sp, right: 25.sp, top: 10.sp),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.all(0),
                            height: 20.sp,
                            width: 100.sp,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Alamat',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(0),
                            height: 20.sp,
                            width: 30.sp,
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                ':',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(0),
                            height: 20.sp,
                            width: 150.sp,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                '',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 60.sp),
                      child: Center(
                        child: Container(
                          height: 55.sp,
                          width: 120.sp,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.sp),
                            color: DataColors.bg
                          ),
                          child: Center(
                            child: Text("Logout",style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: DataColors.white
                            ),),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ))),
    );
  }
}
