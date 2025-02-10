import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const String name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackbar = SnackBar(
      content: const Text('Hola Mundo!'),
      action: SnackBarAction(label: 'Ok!', onPressed: () {}),
      duration: const Duration(seconds: 4),
      backgroundColor: Colors.green,
      behavior: SnackBarBehavior.floating,
      showCloseIcon: true,
      //elevation: 3.5,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Estas seguro?'),
        actions: [
          TextButton(
              onPressed: () => context.pop(), child: const Text('Cancelar')),
          FilledButton.icon(
              icon: const Icon(Icons.save_alt_outlined),
              onPressed: () => context.pop(),
              label: const Text('Aceptar'))
        ],
        content: const Text(
            'Lorem aliqua aute ea sint ut minim quis sit culpa aliquip incididunt duis qui reprehenderit. Ipsum tempor eiusmod commodo elit labore sint eiusmod. Id laboris anim in laborum incididunt ullamco irure adipisicing. Sint dolor in fugiat Lorem fugiat Lorem veniam velit qui nulla. Ea labore reprehenderit dolore mollit dolore enim dolor sint pariatur eiusmod et commodo occaecat consectetur. Eu tempor velit esse enim consectetur ut sint sunt nostrud cupidatat exercitation laborum.'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbar y dialogos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
                onPressed: () {
                  showAboutDialog(
                      context: context,
                      barrierDismissible: false,
                      applicationIcon: const Icon(Icons.widgets_rounded),
                      applicationVersion: '1.1',
                      applicationLegalese: 'Innova Studio',
                      applicationName: 'Flutter Widgets',
                      barrierColor: Colors.green,
                      children: [
                        const Text(
                            'Proident ad id excepteur elit eu eu cupidatat occaecat culpa commodo culpa id adipisicing. Sit aliquip pariatur id esse est esse non proident nisi do et. Veniam tempor Lorem consectetur dolor veniam laboris minim est ea consequat duis laboris aliqua nulla.')
                      ]);
                },
                child: const Text('Licencias usadas')),
            FilledButton.tonal(
                onPressed: () => openDialog(context),
                child: const Text('Licencias usadas'))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showCustomSnackbar(context),
        label: const Text('Mostrar snackbat'),
        icon: const Icon(Icons.remove_red_eye_rounded),
      ),
    );
  }
}
