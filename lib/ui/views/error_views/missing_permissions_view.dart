import 'package:app_settings/app_settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:fran_app/backend/utils.dart';
import 'package:fran_app/ui/views/error_views/error_view.dart';

class MissingPermissionsView extends StatelessWidget {
  final String permiso;
  final VoidCallback? onOpenSettings;

  const MissingPermissionsView({
    super.key,
    required this.permiso,
    required this.onOpenSettings,
  });

  @override
  Widget build(BuildContext context) => ErrorView(
    emoji: randomFromList<String>(['\u{1F46E}\u{200D}\u{2640}\u{FE0F}', '\u{1F46E}']),
    title: 'Permisos Requeridos',
    message: 'Para poder usar esta función, necesitas darnos permisos para acceder a tu $permiso.',
    button: CupertinoButton(
      onPressed: () {
        if(onOpenSettings != null) {
          onOpenSettings?.call();
          return;
        }

        AppSettings.openAppSettings();
      },
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 4.0),
            child: Icon(CupertinoIcons.settings),
          ),
          Text("Abrir Configuración"),
        ],
      ),
    ),
  );
}
