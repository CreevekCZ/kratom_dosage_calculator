import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kratom_dosage_calculator/features/home/view/home_screen.dart';
import 'package:palestine_console/palestine_console.dart';

final routerProvider = Provider<GoRouter>(
  (ref) => GoRouter(
    initialLocation: '/',
    observers: [],
    redirect: (context, state) {
      Print.green('ROUTER REDIRECT: ${state.pathParameters}', name: 'APP');
      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (BuildContext context, GoRouterState state) =>
            const MaterialPage(child: HomeScreen()),
      ),
    ],
  ),
);
