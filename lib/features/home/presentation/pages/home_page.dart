import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/common_bottom_navbar.dart';
import '../cubit/home_cubit.dart';
import '../widgets/home_tab.dart';
import '../widgets/history_tab.dart';
import '../widgets/personal_records_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  void _onNavItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getWeekStreak();
    context.read<HomeCubit>().getWorkoutSessions();
    context.read<HomeCubit>().getAllPersonalRecords();
    context.read<HomeCubit>().getSelectedPersonalRecords();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            IndexedStack(
              index: _currentIndex,
              children: const [HomeTab(), HistoryTab(), PersonalRecordsTab()],
            ),
            Positioned(
              bottom: 20.h,
              left: 20.w,
              right: 20.w,
              child: CommonBottomNavbar(
                currentIndex: _currentIndex,
                onTap: _onNavItemTapped,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
