import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:toko_rame/core/theme/app_colors.dart';
import 'package:toko_rame/core/theme/app_font.dart';

class CustomFilledButton extends StatelessWidget {
  final String title;
  final double width;
  final double height;
  final double borderRadius;
  final Color backgroundColor;
  final VoidCallback onPressed;
  final TextStyle? textStyle;

  const CustomFilledButton({
    super.key,
    required this.title,
    this.backgroundColor = AppColors.primary950,
    this.width = double.infinity,
    this.height = 40,
    this.textStyle,
    required this.onPressed,
    this.borderRadius = 10,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius))),
        child: Text(
          title,
          style: (textStyle ?? AppTextStyles.smallTightMedium).copyWith(
            color: AppColors.primary50,
          ),
        ),
      ),
    );
  }
}

class CustomOutlineButton extends StatelessWidget {
  final String title;
  final double width;
  final double height;
  final double borderRadius;
  final Color outlineColor;
  final VoidCallback onPressed;
  final TextStyle? textStyle;

  const CustomOutlineButton({
    super.key,
    required this.title,
    this.outlineColor = AppColors.primary950,
    this.width = double.infinity,
    this.height = 40,
    this.textStyle,
    required this.onPressed,
    this.borderRadius = 10,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
            side: BorderSide(color: outlineColor, width: 1),
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius))),
        child: Text(
          title,
          style: (textStyle ?? AppTextStyles.smallTightMedium),
        ),
      ),
    );
  }
}
// SvgPicture.asset('assets/icons/ic_cart_active.svg',
//                           width: 20, height: 24),

class CustomFilledIconButton extends StatelessWidget {
  final SvgPicture icon;
  final double width;
  final double height;
  final double borderRadius;
  final Color backgroundColor;
  final VoidCallback onPressed;
  final TextStyle? textStyle;

  const CustomFilledIconButton({
    super.key,
    required this.icon,
    this.backgroundColor = AppColors.primary950,
    this.width = double.infinity,
    this.height = 40,
    this.textStyle,
    required this.onPressed,
    this.borderRadius = 10,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius))),
        child: icon,
      ),
    );
  }
}

// class CustomOutlineButton extends StatelessWidget {
//   final String title;
//   final double width;
//   final double height;
//   final Color outlineColor;
//   final VoidCallback? onPressed;
//   final TextStyle? textStyle;
//   final double borderRadius;

//   const CustomOutlineButton({
//     super.key,
//     required this.title,
//     required this.outlineColor,
//     this.width = double.infinity,
//     this.height = 40,
//     this.textStyle,
//     this.borderRadius = 10,
//     this.onPressed,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: height,
//       width: width,
//       child: TextButton(
//         onPressed: onPressed,
//         style: TextButton.styleFrom(
//             backgroundColor: Colors.white,
//             side: BorderSide(color: outlineColor, ),
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(borderRadius))),
//         child: Text(
//           title,
//           style: (textStyle ?? AppTextStyles.smallTightMedium).copyWith(
//             color: AppColors.primary50,
//           ),
//         ),
//       ),
//     );
//   }
// }

// class CustomFilledButtonOtherServices extends StatelessWidget {
//   final String title;
//   final String iconPath;
//   final VoidCallback? onPressed;
//   final double width;
//   final double height;
//   final Color backgroundColor;

//   const CustomFilledButtonOtherServices({
//     super.key,
//     required this.title,
//     required this.iconPath,
//     required this.backgroundColor,
//     this.width = double.infinity,
//     this.height = 56,
//     this.onPressed,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onPressed,
//       child: SizedBox(
//         height: height,
//         width: width,
//         child: Container(
//           decoration: BoxDecoration(
//             color: whiteColor,
//             borderRadius: BorderRadius.circular(12),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.1),
//                 spreadRadius: 0,
//                 blurRadius: 3,
//                 offset: const Offset(0, 0),
//               ),
//             ],
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SvgPicture.asset(
//                 iconPath,
//                 width: 24,
//                 height: 24,
//               ),
//               const SizedBox(
//                 width: 4,
//               ),
//               Text(
//                 title,
//                 style: redTextStyle.copyWith(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
