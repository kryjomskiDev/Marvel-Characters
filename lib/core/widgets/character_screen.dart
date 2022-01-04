import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marvel_characters/core/util/style.dart';
import 'package:marvel_characters/feature/home/domain/entities/character_entity.dart';

class CharacterScreen extends StatelessWidget {
  final CharacterEntity character;

  const CharacterScreen({required this.character, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 311.h,
            child: Image.network(
              character.imgUrl,
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              color: bgColor,
              height: 584.h,
              padding: EdgeInsets.all(10.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: headerText(content: character.name, color: white),
                    ),
                    SizedBox(height: 30.h),
                    headerText(content: 'Description:'),
                    SizedBox(height: 11.h),
                    Center(
                      child: headerText(
                          content: character.description, color: white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
