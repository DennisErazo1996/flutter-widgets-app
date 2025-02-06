import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem(
      {required this.title,
      required this.subTitle,
      required this.link,
      required this.icon});
}

const appMenuItems = <MenuItem>[
  MenuItem(
      title: 'Botones',
      subTitle: 'Varios botones en Flutter',
      link: '/buttons',
      icon: Icons.smart_button_rounded),
  MenuItem(
      title: 'Tarjetas',
      subTitle: 'Un contenedor estilizado',
      link: '/cards',
      icon: Icons.credit_card_rounded),
  MenuItem(
      title: 'Animaciones',
      subTitle: 'Animaciones en Flutter',
      link: '/animated',
      icon: Icons.animation_rounded),
  MenuItem(
      title: 'Tutorial de App',
      subTitle: 'Tutorial de App',
      link: '/app_tutorial',
      icon: Icons.video_call_rounded),
  MenuItem(
      title: 'Scroll Infinito',
      subTitle: 'Scroll Infinito',
      link: '/infinite_scroll',
      icon: Icons.arrow_circle_down_rounded),
  MenuItem(
      title: 'Snackbar',
      subTitle: 'Snackbar',
      link: '/snackbar',
      icon: Icons.notifications_rounded),
  MenuItem(
      title: 'Controles de UI',
      subTitle: 'Controles de UI',
      link: '/ui_controls',
      icon: Icons.settings_rounded),
  MenuItem(
      title: 'Progress',
      subTitle: 'Progress',
      link: '/progress',
      icon: Icons.timeline_rounded),
];
