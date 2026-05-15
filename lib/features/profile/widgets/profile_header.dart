import 'package:flutter/material.dart';
import 'package:horizon_barber/core/services/api_service.dart';
import 'package:horizon_barber/core/session/app_session.dart';
import 'package:horizon_barber/core/utils/app_colors.dart';
import 'package:horizon_barber/core/utils/app_fonts.dart';
import 'package:horizon_barber/core/widgets/avatar.dart';
import 'package:horizon_barber/features/profile/widgets/localization_card.dart';
import 'package:horizon_barber/interfaces/user_interface.dart';
import 'package:intl/intl.dart';

class ProfileHeader extends StatefulWidget {
  const ProfileHeader({super.key});

  @override
  State<ProfileHeader> createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  UserInterface? currentUserInfo;
  String? userCreatedAt;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      final username = AppSession.currentUsername;
      if (username == null || username.trim().isEmpty) return;

      final result = await ApiService.getCurrentUser(username);

      if (!mounted || result["success"] != true) return;

      setState(() {
        final user = UserInterface.fromJson(result["message"]);

        currentUserInfo = user;
        userCreatedAt = dataFormmatter(user.createdAt ?? "");
      });
    } catch (e) {
      debugPrint("Erro ao carregar perfil: $e");
    }
  }

  String dataFormmatter(String dataIso) {
    try {
      DateTime dataParseada = DateTime.parse(dataIso);

      return DateFormat('dd/MM/yyyy').format(dataParseada);
    } catch (e) {
      return "Data inválida";
    }
  }

  @override
  Widget build(BuildContext context) {
    if (currentUserInfo == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Avatar(
                borderColor: AppColors.gold,
                size: 72,
                photoUrl: currentUserInfo!.photoUrl ?? "",
              ),
              Text(
                currentUserInfo!.username,
                style: AppFonts.mainFont(
                  color: AppColors.text,
                  size: 24,
                  weight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  Text(
                    currentUserInfo!.number,
                    style: AppFonts.condFont(
                      size: 16,
                      color: AppColors.textMuted,
                      weight: FontWeight.w400,
                    ),
                  ),
                  const Icon(
                    Icons.horizontal_rule_rounded,
                    color: AppColors.textMuted,
                    size: 16,
                  ),
                  Text(
                    "Cliente desde $userCreatedAt",
                    style: AppFonts.condFont(
                      size: 16,
                      color: AppColors.textMuted,
                      weight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          LocalizationCard(),
        ],
      ),
    );
  }
}
