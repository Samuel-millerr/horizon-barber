import 'package:flutter/material.dart';
import 'package:horizon_barber/core/services/api_service.dart';
import 'package:horizon_barber/core/session/app_session.dart';
import 'package:horizon_barber/core/utils/app_colors.dart';
import 'package:horizon_barber/interfaces/user_interface.dart';

class Avatar extends StatefulWidget {
  final double size;
  final String photoUrl;
  final String? username;
  final Color borderColor;
  final EdgeInsetsGeometry padding;

  const Avatar({
    super.key,
    this.size = 40,
    this.photoUrl = "",
    this.username,
    this.borderColor = AppColors.textMuted,
    this.padding = const EdgeInsets.only(right: 16),
  });

  @override
  State<Avatar> createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  String loadedPhotoUrl = "";

  @override
  void initState() {
    super.initState();
    loadedPhotoUrl = widget.photoUrl;
    _loadUserPhoto();
  }

  @override
  void didUpdateWidget(covariant Avatar oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.photoUrl != widget.photoUrl ||
        oldWidget.username != widget.username) {
      loadedPhotoUrl = widget.photoUrl;
      _loadUserPhoto();
    }
  }

  Future<void> _loadUserPhoto() async {
    if (loadedPhotoUrl.trim().isNotEmpty) return;

    final username = widget.username ?? AppSession.currentUsername;
    if (username == null || username.trim().isEmpty) return;

    try {
      final result = await ApiService.getCurrentUser(username);
      if (!mounted || result["success"] != true) return;

      final user = UserInterface.fromJson(result["message"]);
      final photoUrl = user.photoUrl?.trim() ?? "";

      if (photoUrl.isEmpty) return;

      setState(() {
        loadedPhotoUrl = photoUrl;
      });
    } catch (e) {
      debugPrint("Erro ao carregar avatar: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final hasPhoto = loadedPhotoUrl.trim().isNotEmpty;
    final iconSize = widget.size > 15 ? widget.size - 15 : widget.size;

    return Padding(
      padding: widget.padding,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: widget.borderColor, width: 2),
        ),
        child: SizedBox(
          width: widget.size,
          height: widget.size,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Icon(Icons.person, color: AppColors.textMuted, size: iconSize),
              if (hasPhoto)
                CircleAvatar(
                  radius: widget.size / 2,
                  backgroundColor: Colors.transparent,
                  backgroundImage: NetworkImage(loadedPhotoUrl),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
