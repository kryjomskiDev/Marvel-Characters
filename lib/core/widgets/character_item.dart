import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marvel_characters/core/util/style.dart';
import 'package:marvel_characters/core/widgets/character_screen.dart';
import 'package:marvel_characters/feature/home/domain/entities/character_entity.dart';

class CharacterItem extends StatelessWidget {
  final CharacterEntity characterEntity;

  const CharacterItem({required this.characterEntity, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 24.h),
      child: InkWell(
        onTap: () => Navigator.of(context).push(PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              CharacterScreen(character: characterEntity),
        )),
        child: Stack(
          children: [
            Container(
              width: 388.w,
              height: 232.h,
              decoration: BoxDecoration(
                color: white,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(characterEntity.imgUrl),
                ),
                borderRadius: BorderRadius.circular(20.r),
              ),
            ),
            Positioned(
              right: 8.w,
              bottom: 7.h,
              child: Container(
                width: 229.w,
                height: 36.h,
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Center(
                  child: Text(
                    characterEntity.name,
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
