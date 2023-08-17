import 'package:go_router/go_router.dart';
import '../ui/screens/main_page.dart';
import '../ui/screens/projects_page.dart';

class Routers {
  final GoRouter router = GoRouter(routes: <GoRoute>[
    GoRoute(
        path: '/', builder: (context, state) => const MainPage()),
    GoRoute(
        path: '/projects', builder: (context, state) => const ProjectsPage()),
  ]);
}
