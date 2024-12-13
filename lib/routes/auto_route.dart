import 'package:auto_route/auto_route.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'auto_route.gr.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final storage = SharedPreferencesAsync();
    var token = await storage.getString('bearer_token');
    if (token != null && token.isNotEmpty) {
      resolver.next(true);
    } else {
      resolver.redirect(
        LoginRoute(
          onResult: (value) => resolver.next(value),
        ),
      );
    }
  }
}

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  get routes => [
        AutoRoute(
          page: HomeRoute.page,
          guards: [AuthGuard()],
          initial: true,
        ),
        AutoRoute(page: LoginRoute.page),
      ];
}
