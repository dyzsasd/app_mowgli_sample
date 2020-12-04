import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mowgli/app/app.dart';
import 'package:mowgli/app/app_environment.dart';
import 'package:mowgli/ui/resources/app_colors.dart';
import 'package:mowgli/ui/resources/translations.dart';
import 'package:mowgli/ui/screens/alerts/bloc/alerts_bloc.dart';
import 'package:mowgli/ui/screens/alerts/history/bloc/alerts_history_bloc.dart';
import 'package:mowgli/ui/screens/routes.dart';
import 'package:wiredash/wiredash.dart';
import 'package:overlay_support/overlay_support.dart';

class MowgliApp extends StatelessWidget {
  static final GlobalKey<NavigatorState> appNavigatorKey =
      GlobalKey<NavigatorState>();

  Widget child() {
    return OverlaySupport(
      child: MaterialApp(
        title: 'Mowgli',
        navigatorKey: appNavigatorKey,
        theme: ThemeData(
            primaryColor: AppColors.primary,
            primaryColorDark: AppColors.primaryDark,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            scaffoldBackgroundColor: AppColors.scaffoldBackground,
            accentColor: AppColors.primary,
            iconTheme: IconThemeData(color: AppColors.primary),
            cursorColor: AppColors.primary,
            textSelectionHandleColor: AppColors.primary,
            textSelectionColor: AppColors.primary.withOpacity(0.5),
            splashColor: Platform.isIOS
                ? Colors.transparent
                : AppColors.primary.withOpacity(AppColors.splashOpacity),
            tabBarTheme: TabBarTheme(
                labelColor: AppColors.primary,
                unselectedLabelColor: AppColors.text),
            textTheme: GoogleFonts.robotoTextTheme()),
        localizationsDelegates: <LocalizationsDelegate<dynamic>>[
          const TranslationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          if (Platform.isIOS) GlobalCupertinoLocalizations.delegate
        ],
        supportedLocales: TranslationsDelegate.supportedLocals,
        onGenerateRoute: AppRoutes.getRoutes,
        onUnknownRoute: AppRoutes.onUnknownRoute,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<AlertsBloc>(create: (_) => AlertsBloc(), lazy: false),
          BlocProvider<AlertsHistoryBloc>(
              create: (BuildContext context) =>
                  AlertsHistoryBloc(BlocProvider.of<AlertsBloc>(context)),
              lazy: false),
        ],
        child: env.appEnvironment == AppEnvironmentType.development
            ? Wiredash(
                projectId: 'mowgli-8gr8m5h',
                secret: 'k9x54fqgcqqj9m5y1elhcxd47f6r7n0k',
                host: 'https://wiredash.daad.mobi/',
                navigatorKey: appNavigatorKey,
                options: WiredashOptionsData(
                    showDebugFloatingEntryPoint: GetIt.instance
                        .get<ApplicationEnvironment>()
                        .isADebugBuild),
                child: child(),
              )
            : child());
  }
}
