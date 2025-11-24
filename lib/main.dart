import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oktoast/oktoast.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'core/router/app_router.dart';

import 'core/constants/app_constants.dart';
import 'core/di/injection.dart';
import 'core/theme/app_theme.dart';
import 'core/utils/log.dart';
import 'features/auth/presentation/cubit/auth_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    // Order of initialization is important
    await dotenv.load(fileName: ".env");
    await configureDependencies();
    await Supabase.initialize(
      url: AppConstants.supabase.url,
      anonKey: AppConstants.supabase.anonKey,
    );
  } catch (e) {
    Log.e('Failed to initialize dependencies: $e');
  }

  runApp(const WorkouchApp());
}

class WorkouchApp extends StatelessWidget {
  const WorkouchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(384, 800),
      child: BlocProvider(
        create: (context) => getIt<AuthCubit>(),
        child: const AuthAppWrapper(),
      ),
    );
  }
}

class AuthAppWrapper extends StatelessWidget {
  const AuthAppWrapper({super.key});

  final bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: MaterialApp.router(
          title: AppConstants.appName,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
          debugShowCheckedModeBanner: false,
          showSemanticsDebugger: false,
          routerConfig: appRouter,
        ),
      ),
    );
  }
}
