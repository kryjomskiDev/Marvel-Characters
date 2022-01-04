import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marvel_characters/core/util/style.dart';
import 'package:marvel_characters/feature/search/presentation/bloc/text_input_cubit.dart';

class CustomTextInput extends StatelessWidget {
  final void Function() onComplete;
  const CustomTextInput({required this.onComplete, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TextInputCubit, TextInputState>(
      builder: (context, state) {
        var cubit = context.watch<TextInputCubit>();
        return Container(
          height: 62.h,
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
          width: 362.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32.r),
            color: white,
          ),
          child: TextFormField(
            onEditingComplete: onComplete,
            cursorColor: black,
            onChanged: cubit.onChanged,
            decoration: InputDecoration(
              fillColor: Colors.transparent,
              isDense: true,
              labelStyle: TextStyle(color: black),
              labelText: 'Search for character',
              disabledBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              hintText: 'Search',
              hintStyle: TextStyle(fontSize: 15.sp, color: black),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.0.w,
                vertical: 8.0.h,
              ),
              prefixIcon: const Icon(
                FeatherIcons.search,
                color: black,
              ),
              prefixStyle: const TextStyle(color: black),
            ),
          ),
        );
      },
    );
  }
}
