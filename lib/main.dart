import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oktoast/oktoast.dart';
import 'package:workouch/features/home/presentation/pages/home_page.dart';

import 'core/constants/app_constants.dart';
import 'core/di/injection.dart';
import 'core/theme/app_theme.dart';
import 'core/utils/log.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    // TODO: Init services here
    // await dotenv.load(fileName: ".env");
    await configureDependencies();
  } catch (e) {
    Log.e('Failed to initialize dependencies: $e');
  }

  runApp(const WorkouchApp());
}

class WorkouchApp extends StatefulWidget {
  const WorkouchApp({super.key});

  @override
  State<WorkouchApp> createState() => _WorkouchAppState();
}

class _WorkouchAppState extends State<WorkouchApp> {
  final bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(384, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return OKToast(
          child: MaterialApp(
            title: AppConstants.appName,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
            debugShowCheckedModeBanner: false,
            showSemanticsDebugger: false,
            home: GestureDetector(
              onTap: () {
                // Dismiss keyboard when tapping outside of text fields
                FocusScope.of(context).unfocus();
              },
              child: const HomePage(),
            ),
          ),
        );
      },
    );
  }
}
