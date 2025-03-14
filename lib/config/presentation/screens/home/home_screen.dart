import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';
import 'package:widgets_app/config/presentation/widgets/side_menu.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String name = 'home_screen';

  @override
  Widget build(BuildContext context) {

    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Flutter + Material 3'),
      ),
      body: _HomeView(),
      drawer: SideMenu(scaffoldKey: scaffoldKey,)
    );
    
  }
}

class _HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //const menuItems = appMenuItems;

    return ListView.builder(
      itemCount: appMenuItems.length,
      itemBuilder: (context, index) {
        final menuItems = appMenuItems[index];

        return _CustomListTile(menuItems: menuItems);
      },
    );
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    required this.menuItems,
  });

  final MenuItem menuItems;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(
        menuItems.icon,
        color: color.primary,
      ),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        color: color.primary,
      ),
      title: Text(menuItems.title),
      subtitle: Text(menuItems.subTitle),
      titleTextStyle:
          TextStyle(color: color.primary, fontWeight: FontWeight.bold),
      onTap: () {
        /*Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) =>  const ButtonsScreen(),
          ),
        );*/
        //context.pushNamed(ButtonsScreen.name);
        context.push(menuItems.link);
        //Navigator.pushNamed(context, menuItems.link);
      },
      hoverColor: color.primary,
    );
  }
}
