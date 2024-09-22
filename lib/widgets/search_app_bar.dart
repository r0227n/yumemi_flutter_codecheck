import 'package:flutter/material.dart';

class SearchAppBar extends StatefulWidget implements PreferredSizeWidget {
  const SearchAppBar({
    super.key,
    this.hintText,
    this.actions,
    this.onChanged,
  });

  final String? hintText;

  final List<Widget>? actions;

  final ValueChanged<String>? onChanged;

  @override
  State<SearchAppBar> createState() => SearchBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class SearchBarState extends State<SearchAppBar> {
  late final TextEditingController _txtController;
  bool _visibleClearIcon = false;

  @override
  void initState() {
    super.initState();
    _txtController = TextEditingController();
    _txtController.addListener(() {
      setState(() {
        _visibleClearIcon = _txtController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _txtController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: TextField(
        controller: _txtController,
        decoration: InputDecoration(
          hintText: widget.hintText,
          prefixIcon: const Icon(Icons.search),
          suffixIcon: _visibleClearIcon
              ? IconButton(
                  onPressed: () {
                    _txtController.clear();
                  },
                  icon: const Icon(Icons.clear),
                )
              : null,
          contentPadding: const EdgeInsets.only(left: 8.0, top: 12.0, bottom: 12.0),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          isDense: true,
        ),
        onSubmitted: (text) {
          if (widget.onChanged != null) {
            widget.onChanged!(text);
          }
        },
      ),
      actions: widget.actions,
    );
  }
}
