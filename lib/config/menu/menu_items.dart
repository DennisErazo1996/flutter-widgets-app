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
      title: 'Progress Indicators',
      subTitle: 'Generales y Controlados',
      link: '/progress',
      icon: Icons.refresh_rounded),
  MenuItem(
      title: 'Snackbar y dialogos',
      subTitle: 'Indicadores en pantalla',
      link: '/snackbar',
      icon: Icons.info_outline_rounded),
  MenuItem(
      title: 'Animated container',
      subTitle: 'Stateful widget animado',
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
      title: 'Controles de UI',
      subTitle: 'Controles de UI',
      link: '/ui_controls',
      icon: Icons.settings_rounded),
];
