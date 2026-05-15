import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:horizon_barber/core/session/app_session.dart';
import 'package:horizon_barber/core/utils/app_colors.dart';
import 'package:horizon_barber/core/widgets/body_title.dart';
import 'package:horizon_barber/features/profile/widgets/suport_service.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    final suportServices = [
      {
        "serviceIcon": Icons.phone,
        "serviceTitle": "Fale Conosco",
        "serviceIconColor": AppColors.danger,
      },
      {
        "serviceIcon": Icons.edit,
        "serviceTitle": "Editar Perfil",
        "serviceIconColor": AppColors.gold,
        "function": () {
          context.go("/edit-profile");
        },
      },
      {
        "serviceIcon": Icons.door_back_door,
        "serviceTitle": "Sair da Conta",
        "serviceIconColor": AppColors.textMuted,
        "function": () {
          AppSession.clear();
          context.go("/login");
        },
      },
    ];

    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(16),
      child: Column(
        spacing: 2,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BodyTitle(title: "SUPORTE"),
          const SizedBox(height: 14),
          for (Map<String, dynamic> suportService in suportServices) ...[
            SuportService(
              serviceIcon: suportService["serviceIcon"],
              serviceTitle: suportService["serviceTitle"],
              serviceIconColor: suportService["serviceIconColor"],
              onTap: suportService["function"],
            ),
            Divider(color: AppColors.textMuted, thickness: 0.3),
          ],
        ],
      ),
    );
  }
}
