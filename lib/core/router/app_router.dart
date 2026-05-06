import "package:go_router/go_router.dart";
import "package:horizon_barber/core/widgets/main_scaffold.dart";
import "package:horizon_barber/features/home/home_page.dart";
import "package:horizon_barber/features/new_schedule/new_schedule_page.dart";
import "package:horizon_barber/features/profile/profile_page.dart";

final GoRouter appRouter = GoRouter(
  initialLocation: "/home",
  routes: [
    ShellRoute(
      builder: (context, state, child) => MainScaffold(child: child),
      routes: [
        GoRoute(path: "/home", builder: (_, _) => const HomePage()),
        GoRoute(
          path: "/new-schedule",
          builder: (_, _) => const NewSchedulePage(),
        ),
        GoRoute(path: "/profile", builder: (_, _) => const ProfilePage()),
      ],
    ),
  ],
);
