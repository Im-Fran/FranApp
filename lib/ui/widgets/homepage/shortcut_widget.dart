import 'package:flutter/cupertino.dart';

class ShortcutWidget extends StatelessWidget {

  final Color? color;
  final DecorationImage? image;
  final BoxBorder? border;
  final List<BoxShadow>? boxShadow;
  final Gradient? gradient;
  final BlendMode? backgroundBlendMode;
  final BoxShape shape;
  final VoidCallback? onPressed;
  final Widget child;

  const ShortcutWidget({
    super.key,
    this.color,
    this.image,
    this.border,
    this.boxShadow,
    this.gradient,
    this.backgroundBlendMode,
    this.shape = BoxShape.rectangle,
    required this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) => CupertinoPageScaffold(
    child: CupertinoButton(
      onPressed: onPressed,
      child: SizedBox(
        width: 150,
        height: 150,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: color,
            image: image,
            border: border,
            borderRadius: BorderRadius.circular(16),
            boxShadow: boxShadow,
            gradient: gradient,
            backgroundBlendMode: backgroundBlendMode,
            shape: shape,
          ),
          child: Center(
            child: child,
          ),
        ),
      ),
    ),
  );
}
