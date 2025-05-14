import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/auth/auth_bloc.dart';
import 'core/di/injectable.dart';
import 'core/utils/constants/pref_constants.dart';
import 'domain/auth_repository.dart';
import 'domain/prefs_repository.dart';
import 'presentation/navigator/main_navigator.dart';
import 'presentation/navigator/route_names.dart';
import 'presentation/theme/bloc/theme_bloc.dart';

class MyApp extends StatefulWidget {
  final Widget? dashboard;
  const MyApp({super.key, this.dashboard});

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  final navigatorKey = MainNavigatorState.navigationKey;
  NavigatorState get navigator =>
      MainNavigatorState.navigationKey.currentState!;

  late final AuthRepository _authRepo;

  @override
  void initState() {
    super.initState();
    _authRepo = AuthRepository();
  }

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authRepo,
      child: BlocProvider(
        create: (_) => AuthBloc(authRepo: _authRepo),
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatefulWidget {
  final Widget? dashboard;
  const AppView({super.key, this.dashboard});

  @override
  State<AppView> createState() => AppViewState();
}

class AppViewState extends State<AppView> {
  final navigatorKey = MainNavigatorState.navigationKey;
  NavigatorState get navigator =>
      MainNavigatorState.navigationKey.currentState!;
  final _prefsrepo = getIt<PrefsRepository>();

  @override
  Widget build(BuildContext context) {
    bool isOnboarded = _prefsrepo.getPrefBool(PrefConstants.isOnboardedKey);

    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp(
            home: widget.dashboard,
            debugShowCheckedModeBanner: false,
            navigatorKey: navigatorKey,
            supportedLocales: const [Locale('en')],
            initialRoute: MainNavigatorState.initialRoute,
            onGenerateRoute: MainNavigatorState.onGenerateRoute,
            builder: (context, child) => BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {
                switch (state.status) {
                  case AuthStatus.unverified:
                  case AuthStatus.unauthenticated:
                    if (isOnboarded) {
                      navigator.pushNamedAndRemoveUntil<void>(
                        RouteNames.login,
                        (route) => false,
                      );
                    } else {
                      navigator.pushNamedAndRemoveUntil<void>(
                        RouteNames.onboarding,
                        (route) => false,
                      );
                    }

                  case AuthStatus.authenticated:
                    if (isOnboarded) {
                      navigator.pushNamedAndRemoveUntil<void>(
                        RouteNames.home,
                        (route) => false,
                      );
                    } else {
                      navigator.pushNamedAndRemoveUntil<void>(
                        RouteNames.onboarding,
                        (route) => false,
                      );
                    }
                }
              },
              child: child,
            ),
          );
        },
      ),
    );
  }
}
