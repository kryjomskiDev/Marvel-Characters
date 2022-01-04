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
import 'package:marvel_characters/feature/search/presentation/bloc/text_input_cubit.dart';
import 'package:marvel_characters/feature/search/presentation/widget/custom_text_input.dart';
import 'package:progress_indicators/progress_indicators.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeScreenCubit(getIt<CharacterRepository>()),
      child: SearchScreenView(),
    );
  }
}

class SearchScreenView extends StatelessWidget {
  const SearchScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textInputcubit = TextInputCubit();
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: 108.h,
          right: 13.w,
          left: 13.w,
        ),
        color: bgColor,
        width: double.infinity,
        height: double.infinity,
        child: BlocBuilder<HomeScreenCubit, Result>(
          builder: (context, state) {
            var cubit = context.watch<HomeScreenCubit>();
            if(state is Loading){
              return Center(
                  child: JumpingDotsProgressIndicator(
                    color: white,
                    fontSize: 60.sp,
                  ));
            }
            if(state is Success){
              return SingleChildScrollView(
                  child:Column(
                children: [
                  headerText(content: 'Search for character'),
                  SizedBox(
                    height: 22.h,
                  ),
                  BlocProvider(
                    create: (context) => textInputcubit,
                    child: CustomTextInput(onComplete: () => cubit.getCharacter(textInputcubit.getValue()),),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  CharacterItem(characterEntity: state.data as CharacterEntity),
                ],
              ));
            }
            return SingleChildScrollView(
                child:Column(
              children: [
                headerText(content: 'Search for character'),
                SizedBox(
                  height: 22.h,
                ),
                BlocProvider(
                  create: (context) => textInputcubit,
                  child: CustomTextInput(onComplete: () => cubit.getCharacter(textInputcubit.getValue()),),
                )
              ],
            ));
          },
        ),
      ),
    );
  }
}
