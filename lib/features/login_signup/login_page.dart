import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:horizon_barber/core/services/api_service.dart";
import "package:horizon_barber/core/session/app_session.dart";
import "package:horizon_barber/core/utils/app_colors.dart";
import "package:horizon_barber/core/utils/app_fonts.dart";
import "package:horizon_barber/features/login_signup/widgets/login_field.dart";

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final username = _nameController.text.trim();

      final result = await ApiService.login(
        username: username,
        password: _passwordController.text.trim(),
      );
      if (!mounted) return;

      final success = result["success"] == true;
      final message = result["message"]?.toString() ?? "Erro ao cadastrar";

      if (success) {
        AppSession.saveUserName(username);

        context.go("/home");

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Login realizado com sucesso!")),
        );
        return;
      }

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(message)));
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Barber Horizon",
                      textAlign: TextAlign.center,
                      style: AppFonts.mainFont(
                        color: AppColors.gold,
                        size: 32,
                        weight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Entre para agendar seu horario",
                      textAlign: TextAlign.center,
                      style: AppFonts.bodyFont(
                        color: AppColors.textMuted,
                        size: 15,
                      ),
                    ),
                    const SizedBox(height: 34),
                    LoginField(
                      controller: _nameController,
                      label: "Nome",
                      icon: Icons.person_outline,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Informe seu nome";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 14),
                    LoginField(
                      controller: _passwordController,
                      label: "Senha",
                      icon: Icons.lock_outline,
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Informe sua senha";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 22),
                    ElevatedButton(
                      onPressed: _isLoading ? null : _submit,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.gold,
                        disabledBackgroundColor: AppColors.border,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(999),
                        ),
                      ),
                      child: Text(
                        _isLoading ? "ENTRANDO..." : "ENTRAR",
                        style: AppFonts.condFont(
                          color: AppColors.bg,
                          size: 16,
                          weight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    InkWell(
                      onTap: () => context.push("/signup"),
                      child: Text(
                        textAlign: TextAlign.center,
                        "Não tem uma conta? Se cadastre",
                        style: AppFonts.condFont(
                          size: 16,
                          weight: FontWeight.w500,
                          color: AppColors.textMuted,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
