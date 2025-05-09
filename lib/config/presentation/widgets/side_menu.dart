import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class SideMenu extends StatefulWidget {

  final GlobalKey<ScaffoldState> scaffoldKey; 

  const SideMenu({super.key, required this.scaffoldKey});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {

  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    
    final hasNotch = MediaQuery.of(context).viewPadding.top > 30;
    
    
    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (value) {
        setState(() {
          navDrawerIndex = value;
        });

        final menuItem = appMenuItems[value];
        context.push(menuItem.link);
        widget.scaffoldKey.currentState?.closeDrawer();

      },
      children: [

       Padding(
        padding: EdgeInsets.fromLTRB(28, hasNotch ? 0 : 20 , 16, 10),
        child: const Text('Main'),
       ),

       ...appMenuItems
       .sublist(0,3)
       .map((item) =>  NavigationDrawerDestination(
          selectedIcon: FadeInLeft(child: const Icon(Icons.arrow_right_alt_rounded)),
          icon: Icon(item.icon), 
          label: Text(item.title)
          
        )),

        const Padding(
        padding: EdgeInsets.fromLTRB(28, 10, 28, 10),
        child: Divider()
       ),

       Padding(
        padding: EdgeInsets.fromLTRB(28, hasNotch ? 0 : 20 , 16, 10),
        child: const Text('More options'),
       ),

       ...appMenuItems
       .sublist(3)
       .map((item) =>  NavigationDrawerDestination(
          selectedIcon: FadeInLeft(child: const Icon(Icons.arrow_right_alt_rounded)),
          icon: Icon(item.icon), 
          label: Text(item.title)
        )),

       /*const NavigationDrawerDestination(
          icon: Icon(Icons.widgets), 
          label: Text('Funciones')
        ),*/
      
      ],
    );
  }
}