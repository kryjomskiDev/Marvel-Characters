import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marvel_characters/core/enums/bottom_nav_bar_item.dart';
import 'package:marvel_characters/core/util/style.dart';
import 'package:marvel_characters/feature/home/presentation/screens/home_screen.dart';
import 'package:marvel_characters/feature/main/presentation/bloc/bottom_nav_bar_cubit.dart';
import 'package:marvel_characters/feature/search/presentation/screens/search_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BottomNavBarCubit>(
      create: (context) => BottomNavBarCubit(),
      child: MainScreenView(),
    );
  }
}

class MainScreenView extends StatelessWidget {
  const MainScreenView({Key? key}) : super(key: key);

  final Map<BottomNavBarItem, IconData> items = const {
    BottomNavBarItem.home: FeatherIcons.home,
    BottomNavBarItem.search: FeatherIcons.search,
  };

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
      builder: (context, state) {
        final cubit = context.read<BottomNavBarCubit>();
        return Scaffold(
          backgroundColor: bgColor,
          body: _getScreen(context, state.selectedItem),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: white,
                  spreadRadius: -15.r,
                  blurRadius: 24.r,
                ),
              ],
            ),
            child: BottomNavigationBar(
              elevation: 10,
              type: BottomNavigationBarType.fixed,
              backgroundColor: black,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedItemColor: white,
              unselectedItemColor: grey,
              currentIndex: BottomNavBarItem.values.indexOf(state.selectedItem),
              items: items
                  .map((item, icon) => MapEntry(
                      item.toString(),
                      BottomNavigationBarItem(
                          label: "", icon: Icon(icon, size: 30.0))))
                  .values
                  .toList(),
              onTap: (int i) {
                final selectedItem = BottomNavBarItem.values[i];
                cubit.onChanged(selectedItem);
              },
            ),
          ),
        );
      },
    );
  }

  Widget _getScreen(BuildContext context, BottomNavBarItem item) {
    switch (item) {
      case BottomNavBarItem.home:
        return HomeScreen();
      case BottomNavBarItem.search:
        return SearchScreen();
    }
  }
}
