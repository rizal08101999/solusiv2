import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controller/infoaccount_controller.dart';
import '../../../../core/colors.dart';

class InfoaccountViews extends GetView<InfoaccountController> {
  const InfoaccountViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Info Account'),
        backgroundColor: AppColors.white,
        elevation: 0,
      ),
      body: Obx(() {
        if (controller.loading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        
        final profile = controller.profileData.value;
        if (profile == null) {
          return const Center(child: Text('No profile data'));
        }
        
        return Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            children: [
              _buildInfoCard('Name', profile.name),
              SizedBox(height: 12.h),
              _buildInfoCard('Email', profile.email),
              SizedBox(height: 12.h),
              _buildInfoCard('Phone Number', profile.phoneNumber),
              SizedBox(height: 12.h),
              _buildInfoCard('Address', profile.address.isEmpty ? 'Not set' : profile.address),
              SizedBox(height: 12.h),
              _buildInfoCard('Username', profile.username),
              SizedBox(height: 12.h),
              _buildInfoCard('Update Status', profile.isUpdate == '1' ? 'Updated' : 'Not Updated'),
            ],
          ),
        );
      }),
    );
  }
  
  Widget _buildInfoCard(String label, String value) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 12.sp,
              color: AppColors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            value,
            style: TextStyle(
              fontSize: 16.sp,
              color: AppColors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
