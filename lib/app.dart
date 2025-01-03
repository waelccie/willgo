
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:willgo/app/modules/profile/controllers/translation_controller.dart';
import 'package:willgo/app/routes/app_pages.dart';
import 'package:willgo/app/modules/environment/controllers/environment_controller.dart';
import 'package:willgo/core/extensions/build_context.dart';
import 'package:willgo/core/services/bindings.dart';
import 'package:willgo/core/services/theme.dart';
import 'package:willgo/l10n/messages.dart'; 

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final botToastBuilder = BotToastInit();

    return GetBuilder<EnvironmentController>(
      builder: (environmentController) {
        return GetBuilder<TranslationController>(
          builder: (translationController) {
            return ScreenUtilInit(
              designSize: const Size(360, 690),
              minTextAdapt: true,
              splitScreenMode: true,
              builder: (context, child) {
                return GetMaterialApp(
                  navigatorObservers: [BotToastNavigatorObserver()],
                  initialRoute: environmentController.connected
                      ? AppPages.INITIAL
                      : Routes.ENVIRONMENT,
                  onGenerateTitle: (context) => context.translate.appname,
                  debugShowCheckedModeBanner: false,
                  initialBinding: InitialBindings(),
                  getPages: AppPages.routes,
                  darkTheme: Themes.dark,
                  theme: Themes.light,
                  themeMode: ThemeService().theme,

                  locale: translationController.currentLocale.value,
                  localizationsDelegates: S.localizationsDelegates,
                  supportedLocales: S.supportedLocales,
                  fallbackLocale: const Locale('en'),

                  builder: (context, child) {
                    child = botToastBuilder(context, child!);
                    return child;
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}
