import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:horizon_barber/core/services/api_service.dart";
import "package:horizon_barber/core/session/app_session.dart";
import "package:horizon_barber/core/utils/app_colors.dart";
import "package:horizon_barber/core/utils/app_fonts.dart";
import "package:horizon_barber/features/login_signup/widgets/login_field.dart";
import "package:horizon_barber/interfaces/user_interface.dart";

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final _numberController = TextEditingController();
  final _photoUrlController = TextEditingController();
  bool _isLoading = true;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  @override
  void dispose() {
    _numberController.dispose();
    _photoUrlController.dispose();
    super.dispose();
  }

  Future<void> _loadUser() async {
    try {
      final username = AppSession.currentUsername;
      if (username == null || username.trim().isEmpty) {
        if (mounted) context.go("/login");
        return;
      }

      final result = await ApiService.getCurrentUser(username);

      if (!mounted) return;

      if (result["success"] == true) {
        final user = UserInterface.fromJson(result["message"]);
        _numberController.text = user.number;
        _photoUrlController.text = user.photoUrl ?? "";
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    final username = AppSession.currentUsername;
    if (username == null || username.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Faca login para editar seu perfil")),
      );
      context.go("/login");
      return;
    }

    setState(() => _isSaving = true);

    try {
      final result = await ApiService.updateCurrentUser(
        username: username,
        number: _numberController.text.trim(),
        photoUrl: _photoUrlController.text.trim(),
      );

      if (!mounted) return;

      final success = result["success"] == true;
      final message = success
          ? "Perfil atualizado com sucesso"
          : result["message"]?.toString() ?? "Erro ao atualizar perfil";

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(message)));

      if (success) context.go("/profile");
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.bg,
      child: SafeArea(
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () => context.go("/profile"),
                            icon: const Icon(Icons.arrow_back),
                            color: AppColors.text,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            "Editar Perfil",
                            style: AppFonts.mainFont(
                              color: AppColors.text,
                              size: 24,
                              weight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 22),
                      LoginField(
                        controller: _numberController,
                        label: "Numero de telefone",
                        icon: Icons.phone_outlined,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Informe seu numero de telefone";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 14),
                      LoginField(
                        controller: _photoUrlController,
                        label: "Foto de usuario",
                        icon: Icons.photo_outlined,
                      ),
                      const SizedBox(height: 22),
                      ElevatedButton(
                        onPressed: _isSaving ? null : _submit,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.gold,
                          disabledBackgroundColor: AppColors.border,
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          _isSaving ? "SALVANDO..." : "SALVAR ALTERACOES",
                          style: AppFonts.condFont(
                            color: AppColors.bg,
                            size: 16,
                            weight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
