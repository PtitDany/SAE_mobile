import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import './shell_routes.dart';
import '../ui/Home.dart';
import '../ui/Produits.dart';
import '../ui/Annonces.dart';
import '../ui/Login_Page.dart';
import '../ui/Register_Page.dart';
import '../ui/Profile.dart';

final GlobalKey<NavigatorState> _routenavigatorkey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellnavigatorkey = GlobalKey<NavigatorState>();


final router = GoRouter(
    navigatorKey: _routenavigatorkey,
    initialLocation: '/home/Accueil',
    routes: <RouteBase>[
      GoRoute(
          path: '/home',
          redirect: (context,state){
            return '/home/Accueil';
          }
      ),
      GoRoute(
          path: '/home',
          name: 'home',
          builder: (context, state) => const Home(),
          routes: <RouteBase> [
            ShellRoute(
                navigatorKey: _shellnavigatorkey,
                builder: (BuildContext context, GoRouterState state, Widget child) {
                  return ScaffoldWithNavBar(child: child);
                },
                routes: [
                  GoRoute(
                    path: 'Accueil',
                    builder: (context, state) {
                      return const Home();
                    },
                  ),
                  GoRoute(
                    path: 'Produits',
                    builder: (context, state) {
                      return const Produits();
                    },
                  ),
                  GoRoute(
                    path: 'Annonces',
                    builder: (context, state) {
                      return const Annonces();
                    },
                  ),
                  GoRoute(
                    path: 'Login',
                    builder: (context, state) {
                      return const LoginPage();
                    },
                  ),
                  GoRoute(
                    path: 'Register',
                    builder: (context, state) {
                      return const RegisterPage();
                    },
                  ),
                  GoRoute(
                    path: 'Profile',
                    builder: (context, state) {
                      return const ProfilePage();
                    },
                  )
                ]
            )

          ]
      ),
    ]
);