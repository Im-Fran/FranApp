import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fran_app/ui/views/error_views/error_view.dart';
import 'package:fran_app/ui/views/home_page.dart';
import 'package:fran_app/ui/widgets/go_back_widget.dart';

void main() async {
  runApp(const FranApp());
}

class FranApp extends StatefulWidget {
  const FranApp({super.key});

  @override
  State<FranApp> createState() => _FranAppState();
}

class _FranAppState extends State<FranApp> {
  final CupertinoTabController _tabController = CupertinoTabController();

  @override
  Widget build(BuildContext context) => CupertinoApp(
    title: "Fran's App",
    theme: CupertinoThemeData(
      brightness: MediaQuery.of(context).platformBrightness,
    ),
    debugShowCheckedModeBanner: false,
    home: CupertinoTabScaffold(
      controller: _tabController,
      tabBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: "Inicio",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings),
            label: "Configuración",
          ),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return const HomePage();
          case 1:
            return const ErrorView(
              emoji: '\u{1F477}',
              title: 'En construcción',
              message: 'Esta funcionalidad aún no está disponible. Vuelve más tarde!',
              disableNavBar: true,
            );
          default:
            return ErrorView(
              emoji: '\u{1F615}',
              title: 'Página no encontrada',
              message: 'Lo sentimos, pero no encontramos la página que buscas.',
              button: CupertinoButton(
                onPressed: () => _tabController.index = 0,
                child: const GoBackWidget(),
              ),
              disableNavBar: true,
            );
        }
      },
    ),
    localizationsDelegates: const [
      DefaultCupertinoLocalizations.delegate,
      DefaultMaterialLocalizations.delegate,
      DefaultWidgetsLocalizations.delegate,
    ],
  );
}
