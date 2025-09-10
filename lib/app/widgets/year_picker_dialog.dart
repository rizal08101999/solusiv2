// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:solusi/core/colors.dart';

class YearPickerDialog extends StatefulWidget {
  final int selectedYear;
  final ValueChanged<int> onYearSelected;

  const YearPickerDialog({
    super.key,
    required this.selectedYear,
    required this.onYearSelected,
  });

  @override
  State<YearPickerDialog> createState() => _YearPickerDialogState();
}

class _YearPickerDialogState extends State<YearPickerDialog> {
  late int _selectedYear;
  late int currentYear;
  int _currentPage = 0;
  final int _itemsPerPage = 11;
  final int _startYear = 1950;
  final int _endYear = 9999;
  
  @override
  void initState() {
    super.initState();
    _selectedYear = widget.selectedYear;
    currentYear = DateTime.now().year;
    
    // Calculate the page that contains the selected year
    _currentPage = (_selectedYear - _startYear) ~/ _itemsPerPage;
  }
  
  List<int> _getCurrentPageYears() {
    final List<int> years = [];
    final int start = _startYear + (_currentPage * _itemsPerPage);
    final int end = (start + _itemsPerPage) > _endYear ? _endYear : start + _itemsPerPage;
    
    for (int i = start; i <= end; i++) {
      years.add(i);
    }
    
    return years;
  }
  
  int get _totalPages => ((_endYear - _startYear) ~/ _itemsPerPage) + 1;
  
  void _previousPage() {
    setState(() {
      if (_currentPage > 0) {
        _currentPage--;
      }
    });
  }
  
  void _nextPage() {
    setState(() {
      if (_currentPage < _totalPages - 1) {
        _currentPage++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final years = _getCurrentPageYears();
    
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      backgroundColor: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Pilih Tahun",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            SizedBox(height: 8,),
            // Year List
            SizedBox(
              height: 200,
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: years.map((year) {
                  final isSelected = year == _selectedYear;
                  return GestureDetector(
                    onTap: () {
                      Get.back();
                      widget.onYearSelected(year);
                      setState(() {
                        _selectedYear = year;
                      });
                    },
                    child: SizedBox(
                      width: (MediaQuery.of(context).size.width - 230) / 2,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                        decoration: BoxDecoration(
                          color: isSelected ? AppColors.gradientblue.withOpacity(0.2) : Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: isSelected ? AppColors.gradientblue : AppColors.grey10,
                            width: 1.5,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "$year",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                              color: isSelected ? AppColors.gradientblue : AppColors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            // Pagination Controls
            Row(
              spacing: 15,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: _currentPage > 0 ? _previousPage : null,
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentPage > 0 ? AppColors.gradientblue.withOpacity(0.2) : AppColors.grey10.withOpacity(0.2),
                    ),
                    child: Icon(
                      IconsaxPlusLinear.arrow_left_1,
                      color: _currentPage > 0 ? AppColors.gradientblue : AppColors.grey10,
                    ),
                  ),
                ),
                InkWell(
                  onTap: _currentPage < _totalPages - 1 ? _nextPage : null,
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentPage < _totalPages - 1? AppColors.gradientblue.withOpacity(0.2) : AppColors.grey10.withOpacity(0.2),
                    ),
                    child: Icon(
                      IconsaxPlusLinear.arrow_right_3,
                      color: _currentPage < _totalPages - 1 ? AppColors.gradientblue : AppColors.grey10,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,)
          ],
        ),
      ),
    );
  }
}