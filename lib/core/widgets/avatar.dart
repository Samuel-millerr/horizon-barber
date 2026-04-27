import 'package:flutter/material.dart';
import 'package:horizon_barber/core/utils/app_colors.dart';

class Avatar extends StatelessWidget {
  double size;
  String photoUrl;
  Color borderColor;
  Avatar({
    super.key,
    this.size = 40,
    this.photoUrl = "",
    this.borderColor = AppColors.textMuted,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: borderColor, width: 2),
        ),
        child: SizedBox(
          width: size,
          height: size,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Icon(Icons.person, color: AppColors.textMuted, size: size - 15),
              CircleAvatar(
                radius: size,
                backgroundColor: Colors.transparent,
                backgroundImage: NetworkImage(photoUrl),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
