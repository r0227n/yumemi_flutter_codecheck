import 'package:flutter/material.dart';

typedef IconTextItem = ({
  Widget icon,
  String title,
  String? url,
});

class IconText extends StatelessWidget {
  const IconText({
    super.key,
    required this.icon,
    required this.title,
    required this.onPressed,
    this.alignment = Alignment.centerLeft,
  });

  final Widget icon;
  final Widget title;
  final VoidCallback? onPressed;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: TextButton.icon(
        onPressed: onPressed,
        icon: icon,
        label: title,
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.all(Theme.of(context).colorScheme.primary),
        ),
      ),
    );
  }
}
