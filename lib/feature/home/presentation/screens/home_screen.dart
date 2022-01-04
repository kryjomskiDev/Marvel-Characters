import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marvel_characters/core/data/result.dart';
import 'package:marvel_characters/core/util/dependencies.dart';
import 'package:marvel_characters/core/util/style.dart';
import 'package:marvel_characters/core/widgets/character_item.dart';
import 'package:marvel_characters/feature/home/domain/entities/character_entity.dart';
import 'package:marvel_characters/feature/home/domain/repositories/character_repository.dart';
import 'package:marvel_characters/feature/home/presentation/bloc/home_screen_cubit.dart';
import 'package:progress_indicators/progress_indicators.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeScreenCubit(getIt<CharacterRepository>()),
      child: HomeScreenView(),
    );
  }
}

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 258.h,
            child: Image.network(
              'https://www.murphysmultiverse.com/wp-content/uploads/2020/12/clean-1.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 643.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(107.r),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  top: 48.h,
                  left: 13.w,
                  right: 13.w,
                  bottom: 23.h,
                ),
                child: Column(
                  children: [
                    headerText(content: 'MARVEL CHARACTERS'),
                    SizedBox(
                      height: 47.h,
                    ),
                    BlocBuilder<HomeScreenCubit, Result>(
                      builder: (context, state) {
                        var cubit = context.watch<HomeScreenCubit>();
                        if (state is Initial) {
                          cubit.fetchCharacters();
                        }


                        if (state is Success) {
                          final characters =
                          state.data as List<CharacterEntity>;

                          return Expanded(
                            child: ListView.builder(
                              itemBuilder: (context, index) {

                                return CharacterItem(
                                  characterEntity: characters[index],
                                );
                              },
                              itemCount: characters.length,
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                            ),
                          );
                        }

                        return Center(
                            child: JumpingDotsProgressIndicator(
                              color: white,
                              fontSize: 60.sp,
                            ));
                      },
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
