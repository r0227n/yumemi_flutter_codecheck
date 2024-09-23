import 'package:flutter/material.dart';

class EmptyView extends StatelessWidget {
  const EmptyView({
    super.key,
    this.icon,
    this.padding = EdgeInsets.zero,
    required this.children,
  });

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
