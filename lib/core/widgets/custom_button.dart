import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';

class CustomButton extends StatelessWidget {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String label;
  final Color? backgroundColor;
  final double? radius;
  final BorderRadius? borderRadius;
  final void Function() onTap;
  final TextStyle? textStyle;
  final double? elevation;
  final Size? fixedSize;
  final bool isStadiumBorder;
  final EdgeInsetsGeometry? padding;
  const CustomButton({
    super.key,
    this.borderRadius,
    this.prefixIcon,
    this.textStyle,
    this.backgroundColor,
    this.radius,
    this.suffixIcon,
    required this.label,
    required this.onTap,
    this.elevation = 0,
    this.fixedSize,
    this.isStadiumBorder = false,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: elevation,
        padding: EdgeInsets.symmetric(
            horizontal: Insets.s14.w, vertical: Insets.s14.h),
        shape: isStadiumBorder
            ? const StadiumBorder()
            : RoundedRectangleBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(100.r),
              ),
        backgroundColor: backgroundColor ?? ColorManager.steelBlue,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        fixedSize: fixedSize ?? Size(double.infinity, 58.h),
      ),
      onPressed: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          prefixIcon ?? const SizedBox(),
          prefixIcon != null
              ? SizedBox(
                  width: 8.w,
                )
              : const SizedBox(),
          Text(
            label,
            style: textStyle ??
                getMediumStyle(
                  color: ColorManager.pureWhite,
                  context: context,
                  fontSize: FontSize.s20,
                  fontFamily: AppConstants.roboto,
                ).copyWith(fontSize: FontSize.s20),
          ),
          suffixIcon != null
              ? SizedBox(
                  width: 8.w,
                )
              : const SizedBox(),
          suffixIcon ?? const SizedBox(),
        ],
      ),
    );
  }
}
