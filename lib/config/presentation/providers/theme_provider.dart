
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

//listado de colores inmutables
final colorListProvider = Provider((ref) => colorList);

final isDarkModeProvider = StateProvider<bool>((ref) => false);

final selectedIndexColorProvider = StateProvider((ref) => 0);

//objeto de tipo AppTheme
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier()
  );


//controlador o Notifier
class ThemeNotifier extends StateNotifier<AppTheme> {

  //STATE = Estado = new AppTheme()
  ThemeNotifier(): super(AppTheme());

  void toggleDarkMode(){

    state = state.copyWith(isDarkMode: !state.isDarkMode);

  }

  void changeColorIndex(int? colorIndex){

    state = state.copyWith(selectedColor: colorIndex);

  }



}