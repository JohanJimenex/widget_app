import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subtitle;
  final String link;
  final IconData icon;

  const MenuItem(
      {required this.title,
      required this.subtitle,
      required this.link,
      required this.icon});
}

const List<MenuItem> appMenuItems = [
  MenuItem(
      title: "Botones",
      subtitle: "Varios botones de flutter",
      link: "/buttons",
      icon: Icons.radio_button_checked),
  MenuItem(
      title: "Tarjetas",
      subtitle: "Un contenedor estilizado",
      link: "/cards",
      icon: Icons.credit_card),
  MenuItem(
      title: "Animated",
      subtitle: "Animaciones",
      link: "/animated",
      icon: Icons.animation),
  MenuItem(
      title: "App Tutorial (PageView)",
      subtitle: "Tutoriales (Animated Do fernando)",
      link: "/app_tutorial",
      icon: Icons.book_online_outlined),
  MenuItem(
      title: "Infinite Scroll y Pull to Refresh",
      subtitle: "Scroll infinito y cuando llega abajo carga mas",
      link: "/infinite_scroll",
      icon: Icons.roller_skating_outlined),
  MenuItem(
      title: "Progress Indicator",
      subtitle: "Widget de progresso para cargas",
      link: "/progress_indicator",
      icon: Icons.change_circle_rounded),
  MenuItem(
      title: "Snack Bar",
      subtitle: "Snack bar, bara que sale como notificación",
      link: "/snackbar",
      icon: Icons.notification_add),
  MenuItem(
      title: "UI Control (PageView())",
      subtitle: "UI Contro",
      link: "/ui_control",
      icon: Icons.change_circle_rounded),
  MenuItem(
      title: "Contador Riverpod",
      subtitle: "Practicando el manejador de estado Riverpod",
      link: "/contador",
      icon: Icons.water),
  MenuItem(
      title: "Cambiar tema con Riverpod Provider",
      subtitle:
          "Dark y Ligth mode, Practicando el manejador de estado Riverpod",
      link: "/theme",
      icon: Icons.settings_brightness_outlined),
];
