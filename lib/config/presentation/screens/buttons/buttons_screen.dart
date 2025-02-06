import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  const ButtonsScreen({super.key});

  static const String name = 'buttons_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Screen'),
      ),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back_ios_new_rounded),
        onPressed: () {
          context.pop();
        },
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        spacing: 10,
        children: [
          ElevatedButton(
              onPressed: () {}, child: const Text('Elevated Button')),
          const ElevatedButton(
              onPressed: null, child: Text('Elevated Button Disabled')),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.access_time),
            label: const Text('Elevated Button Icon'),
          ),
          FilledButton(onPressed: () {}, child: const Text('Filled Button')),
          FilledButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.accessible_forward_sharp),
              label: const Text('Filled Button Icon')),
          OutlinedButton(onPressed: () {}, child: const Text('Outline Button')),
          OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.wysiwyg),
              label: const Text('Outline Button Icon')),
          TextButton(onPressed: () {}, child: const Text('Text Button')),
          TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.zoom_out_map_rounded),
              label: const Text('Text Button Icon')),
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.save_as, color: colors.primary)),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.save_as, color: Colors.white),
            style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(colors.primary)),
          ),
          CustomButton(
            color: colors.primary,
          )
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final Color color;

  const CustomButton({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Material(
        color: color,
        child: InkWell(
          onTap: () {},
          child: const Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                'Hola Mundo',
                style: TextStyle(color: Colors.white),
              )),
        ),
      ),
    );
  }
}
