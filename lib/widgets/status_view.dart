import 'package:flutter/material.dart';

class StatusView extends StatelessWidget {
  const StatusView({
    super.key,
    this.icon,
    this.padding = EdgeInsets.zero,
    required this.children,
  });

  StatusView.error({
    super.key,
    String errorTitle = 'ERROR',
    required String errorMessage,
    required double iconSize,
    TextStyle? style,
  })  : icon = Icon(
          Icons.error,
          size: iconSize,
          color: Colors.red,
        ),
        padding = const EdgeInsets.symmetric(horizontal: 24.0),
        children = [
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Text(
              errorTitle,
              style: style?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Text(errorMessage),
        ];

  final Widget? icon;
  final EdgeInsets padding;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: padding,
        child: Column(
          children: [
            const Spacer(),
            if (icon != null) icon!,
            ...children,
            const Spacer(flex: 8),
          ],
        ),
      ),
    );
  }
}
