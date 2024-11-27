import 'package:betalent/constants/app_colors.dart';
import 'package:betalent/constants/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppHeader extends StatelessWidget implements PreferredSizeWidget {
  const AppHeader({super.key});
  static const _height = 68.0;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: _height,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Stack(
            children: [
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/bell-notification.svg',
                  height: 32,
                  width: 32,
                  colorFilter: ColorFilter.mode(
                    AppColors.black,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              Positioned(
                right: 2,
                top: 2,
                child: Container(
                  height: 20,
                  width: 20,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.bluePrimary,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Text(
                    '02',
                    style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
      title: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: SizedBox.square(
          dimension: 45,
          child: CircleAvatar(
            backgroundColor: AppColors.gray05,
            child: Text(
              'CG',
              style: AppTypography.h3,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(_height);
}
