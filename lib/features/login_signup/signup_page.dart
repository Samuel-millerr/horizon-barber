import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:horizon_barber/core/services/api_service.dart";
import "package:horizon_barber/core/utils/app_colors.dart";
import "package:horizon_barber/core/utils/app_fonts.dart";
import "package:horizon_barber/features/login_signup/widgets/login_field.dart";
import "package:horizon_barber/interfaces/user_interface.dart";

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _numberController = TextEditingController();
  final _photoUrlController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    _numberController.dispose();
    _photoUrlController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final photoUrl = _photoUrlController.text.trim();
      final user = UserInterface(
        username: _nameController.text.trim(),
        password: _passwordController.text,
        number: _numberController.text.trim(),
        photoUrl: photoUrl.isEmpty ? "" : photoUrl,
      );

      final result = await ApiService.register(user: user.toJson());
      if (!mounted) return;

      final success = result["success"] == true;
      final message = result["message"]?.toString() ?? "Erro ao cadastrar";

      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Cadastro realizado com sucesso!")),
        );

        context.go("/login");
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
                      "Horizon Barber",
                      textAlign: TextAlign.center,
                      style: AppFonts.mainFont(
                        color: AppColors.gold,
                        size: 32,
                        weight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Faça seu cadastro para se tornar nosso cliente fiel",
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
                    const SizedBox(height: 14),
                    LoginField(
                      controller: _numberController,
                      label: "Número",
                      icon: Icons.phone,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Informe seu número de telefone";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 14),
                    LoginField(
                      controller: _photoUrlController,
                      label: "Foto (opcional)",
                      icon: Icons.photo,
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
                        _isLoading ? "CADASTRANDO..." : "CADASTRAR",
                        style: AppFonts.condFont(
                          color: AppColors.bg,
                          size: 16,
                          weight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    InkWell(
                      onTap: () => context.push("/login"),
                      child: Text(
                        "Já tem uma conta? Faça login",
                        textAlign: TextAlign.center,
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
