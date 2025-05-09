
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/presentation/providers/theme_provider.dart';


class ThemeChangerScreen extends ConsumerWidget {  
  
  const ThemeChangerScreen({super.key});

  static const String name = 'theme_changer_screen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    //final isDarkMode = ref.watch(isDarkModeProvider);
    final isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Changer'),
        actions: [
          IconButton(
            icon: isDarkMode ? const Icon(Icons.dark_mode_rounded) : const Icon(Icons.light_mode_rounded),
             onPressed: () { 
                //ref.read(isDarkModeProvider.notifier).update((state) => state = !state);
                ref.read(themeNotifierProvider.notifier).toggleDarkMode();
              },
          )
        ],
      ),
      body: const _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final List<Color> colors = ref.watch(colorListProvider);
    
    //final int selectedColor = ref.watch(selectedIndexColorProvider);
    final int selectedColor = ref.watch(themeNotifierProvider).selectedColor;

    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final Color color =  colors[index];
        return RadioListTile(
          title: Text('Este color', style: TextStyle(color: color)),
          subtitle: Text('${color.value}'),
          activeColor: color,
          value: index, 
          groupValue: selectedColor, 
          onChanged: (value) {
            //TODO: NOTIFICAR EL CAMBIO
            ref.read(themeNotifierProvider.notifier).changeColorIndex(value);
            

          },
        );
      },
      
      );
  }
}