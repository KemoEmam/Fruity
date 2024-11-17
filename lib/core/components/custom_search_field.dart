import 'package:flutter/material.dart';

class CustomSearchField extends StatefulWidget {
  final String hintText;
  final TextEditingController? controller;
  final void Function(String)? onSearchChanged;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onPrefixIconPressed;

  final IconData? defaultPrefixIconData;
  final Widget? prefixIcon;
  final Color? prefixIconColor;
  final Widget? suffixIcon;
  final Color? suffixIconColor;
  final bool replaceSuffixWithClearIcon;
  final Color borderColor;
  final Color focusedBorderColor;
  final double borderWidth;
  final Color backgroundColor;
  final TextStyle? hintTextStyle;
  final bool autoFocus;

  const CustomSearchField({
    super.key,
    this.hintText = 'Search...',
    this.controller,
    this.onSearchChanged,
    this.onFieldSubmitted,
    this.onPrefixIconPressed,
    this.defaultPrefixIconData = Icons.search,
    this.prefixIcon,
    this.prefixIconColor,
    this.suffixIcon,
    this.suffixIconColor,
    this.replaceSuffixWithClearIcon = false,
    this.borderColor = Colors.grey,
    this.focusedBorderColor = Colors.teal,
    this.borderWidth = 1.0,
    this.backgroundColor = Colors.white,
    this.autoFocus = false,
    this.hintTextStyle,
  });

  @override
  State<CustomSearchField> createState() => _CustomSearchFieldState();
}

class _CustomSearchFieldState extends State<CustomSearchField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hasText = _controller.text.isNotEmpty;
    final shouldShowClearIcon = hasText && widget.replaceSuffixWithClearIcon;

    return TextField(
      controller: _controller,
      autofocus: widget.autoFocus,
      onChanged: widget.onSearchChanged ??
          (value) {
            widget.onSearchChanged?.call(value);
            setState(() {}); // Trigger UI updates for clear icon
          },
      onSubmitted: widget.onFieldSubmitted ??
          (value) {
            // Default action: log to console
            debugPrint('Search field submitted: $value');
          },
      decoration: InputDecoration(
        filled: true,
        fillColor: widget.backgroundColor,
        hintText: widget.hintText,
        hintStyle: widget.hintTextStyle ??
            const TextStyle(color: Color(0xFF949D9E), fontSize: 14),
        prefixIcon: widget.prefixIcon ??
            IconButton(
              icon: Icon(
                widget.defaultPrefixIconData,
                color: widget.prefixIconColor ?? Colors.grey,
              ),
              onPressed: widget.onPrefixIconPressed ??
                  () {
                    // Default action: log to console
                    debugPrint('Prefix icon pressed');
                  },
            ),
        suffixIcon: shouldShowClearIcon
            ? IconButton(
                icon: const Icon(Icons.clear, color: Colors.grey),
                onPressed: () {
                  _controller.clear();
                  widget.onSearchChanged?.call('');
                  setState(() {}); // Refresh suffix icon visibility
                },
              )
            : widget.suffixIcon,
        border: _borderBuilder(widget.borderColor),
        focusedBorder: _borderBuilder(widget.focusedBorderColor),
        enabledBorder: _borderBuilder(widget.borderColor),
      ),
    );
  }

  OutlineInputBorder _borderBuilder(Color color) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color, width: widget.borderWidth),
      borderRadius: BorderRadius.circular(8.0),
    );
  }
}
