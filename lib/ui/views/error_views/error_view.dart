import 'package:flutter/cupertino.dart';

class ErrorView extends StatelessWidget {

  final IconData? icon;
  final String emoji;
  final Color iconColor;
  final String title;
  final String message;
  final Widget? button;
  final Widget? leadingWidget, trailingWidget;
  final bool disableNavBar;

  const ErrorView({
    Key? key,
    this.icon,
    this.emoji = '\u{1F615}',
    this.iconColor = CupertinoColors.systemRed,
    this.title = 'Algo salió mal',
    this.message = 'Lo sentimos, ocurrió un error inesperado.',
    this.button,
    this.leadingWidget,
    this.trailingWidget,
    this.disableNavBar = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => CupertinoPageScaffold(
    navigationBar: disableNavBar ? null : CupertinoNavigationBar(
      middle: const Text("Error"),
      previousPageTitle: "Volver Atrás",
      transitionBetweenRoutes: true,
      leading: leadingWidget,
      trailing: trailingWidget,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon != null ? Icon(
                icon,
                color: iconColor,
                size: 64,
              ) : Text(emoji,
                  style: const TextStyle(fontSize: 64)
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              if (button != null) button!
            ],
          ),
        ),
      ],
    ),
  );
}
