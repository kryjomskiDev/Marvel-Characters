import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:marvel_characters/core/enums/bottom_nav_bar_item.dart';

part 'bottom_nav_bar_state.dart';

class BottomNavBarCubit extends Cubit<BottomNavBarState> {
  BottomNavBarCubit()
      : super(
          const BottomNavBarState(selectedItem: BottomNavBarItem.home),
        );

  onChanged(BottomNavBarItem item){
    if(item != state.selectedItem){
      emit(BottomNavBarState(selectedItem: item));
    }
  }
}
