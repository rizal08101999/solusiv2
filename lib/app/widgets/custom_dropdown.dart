
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:solusi/core/colors.dart';

class CustomDropdownField extends StatefulWidget {
  const CustomDropdownField({
    required this.hintText,
    required this.isnotemptyfield,
    required this.label,
    required this.items,
    required this.onTap,
    this.widgetcustom,
    super.key
  });

  final String label;
  final Widget? widgetcustom;
  final String hintText;
  final List<String> items;
  final RxBool isnotemptyfield;
  final void Function(String) onTap; 



  @override
  State<CustomDropdownField> createState() => _CustomDropdownFieldState();
}

class _CustomDropdownFieldState extends State<CustomDropdownField> with SingleTickerProviderStateMixin{
  String? selectedValue;
  bool isExpanded = false;
  bool isFirstBuild = true;
  late AnimationController _controllerr;
  late Animation<Offset> _offsetAnimation;

  final List<String> items = ["Option 1", "Option 2", "Option 3"];


  @override
  void initState() {
    super.initState();

    _controllerr = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, -0.05), // cuma sedikit dari atas
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controllerr, curve: Curves.easeOut));
  }

  void _toggleDropdown() {
    setState(() {
      isExpanded = !isExpanded;
      isFirstBuild = false;
      if (isExpanded) {
        _controllerr.forward();
      } else {
        _controllerr.reverse();
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.widgetcustom != null ?
          widget.widgetcustom! :
          Text(
            widget.label,
            style: TextStyle(
              fontSize: 13.sp,
              fontFamily: 'SemiBold',
              color: AppColors.grey11
            ),
          ),
          // Main Container
          Padding(
            padding: EdgeInsets.only(top: widget.widgetcustom != null ? 10 : 5),
            child: InkWell(
              onTap: () {
                _toggleDropdown();
              },
              overlayColor: WidgetStateProperty.all(Colors.transparent),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: widget.widgetcustom != null ? 13 : 15),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.grey10),
                  borderRadius: BorderRadius.vertical(
                    top: const Radius.circular(8),
                    bottom: isExpanded ? Radius.zero : const Radius.circular(8),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.hintText,
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontFamily: widget.isnotemptyfield.isTrue ? 'Medium' : 'DMSans',
                        color: widget.isnotemptyfield.isTrue ? AppColors.black : AppColors.grey2, 
                      ),
                    ),
                    isExpanded ?
                    TweenAnimationBuilder<double>(
                      duration: const Duration(milliseconds: 300), // Durasi animasi
                      tween: Tween<double>(begin: 0, end: 0.5), // 0.5 untuk rotasi 90 derajat (ke bawah)
                      builder: (context, value, child) {
                        return Transform.rotate(
                          angle: value * 3.14159, // Konversi ke radian
                          child: Icon(
                            IconsaxPlusLinear.arrow_right_3,
                            size: 20,
                            color: AppColors.black2,
                          ),
                        );
                      }
                    ) : isFirstBuild ?
                    Icon(
                      IconsaxPlusLinear.arrow_right_3,
                      size: 20,
                      color: AppColors.black2,
                    ) : 
                    TweenAnimationBuilder<double>(
                      duration: const Duration(milliseconds: 300), // Durasi animasi
                      tween: Tween<double>(begin: 0.5, end: 0), // 0.5 untuk rotasi 90 derajat (ke bawah)
                      builder: (context, value, child) {
                        return Transform.rotate(
                          angle: value * 3.14159, // Konversi ke radian
                          child: Icon(
                            IconsaxPlusLinear.arrow_right_3,
                            size: 20,
                            color: AppColors.black2,
                          ),
                        );
                      }
                    )
                  ],
                ),
              ),
            ),
          ),

          // Dropdown Items
          isExpanded == true?
          ClipRRect(
            borderRadius: const BorderRadius.vertical(bottom: Radius.circular(8)),
            child: SizeTransition(
              sizeFactor: _controllerr,
              child: SlideTransition(
                position: _offsetAnimation,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    border: Border.all(color: AppColors.grey10),
                  ),
                  child: Column(
                    spacing: 8,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: widget.items.map((e) {
                      return InkWell(
                        onTap: () {
                          widget.onTap(e); // kirim ke parent
                          setState(() {
                            isExpanded = false; // tutup dropdown
                            _controllerr.reverse();
                          });
                        },
                        overlayColor: WidgetStateProperty.all(Colors.transparent),
                        child: Text(
                          e,
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: AppColors.black2,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ) : isFirstBuild ?
          const SizedBox.shrink() :
          ClipRRect(
            borderRadius: const BorderRadius.vertical(bottom: Radius.circular(8)),
            child: SizeTransition(
              sizeFactor: _controllerr,
              child: SlideTransition(
                position: _offsetAnimation,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    border: Border.all(color: AppColors.grey10),
                  ),
                  child: Column(
                    spacing: 8,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: widget.items.map((e) {
                      return InkWell(
                        onTap: () {
                          widget.onTap(e); // kirim ke parent
                          setState(() {
                            isExpanded = false; // tutup dropdown
                            _controllerr.reverse();
                          });
                        },
                        overlayColor: WidgetStateProperty.all(Colors.transparent),
                        child: Text(
                          e,
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: AppColors.black2,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          )
        ],
      );
    },);
  }
}
