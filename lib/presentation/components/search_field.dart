import 'package:flutter/material.dart';
import 'package:odyssey_mobile/app/themes/theme.dart';

import 'package:odyssey_mobile/l10n/strings.dart';
import 'package:odyssey_mobile/config/ootm_icons.dart';

class SearchField extends StatefulWidget {
  const SearchField({
    super.key,
    this.onChange,
    this.onSubmitted,
    this.onEditingComplete,
    this.initialValue,
    this.onClearCallback,
  });

  final Function(String)? onChange;
  final Function(String)? onSubmitted;
  final VoidCallback? onEditingComplete;
  final VoidCallback? onClearCallback;
  final String? initialValue;

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  late final TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController(text: widget.initialValue)..addListener(_notEmptyListener);
    _previousLength = controller.text.length;
    super.initState();
  }

  @override
  void dispose() {
    controller
      ..removeListener(_notEmptyListener)
      ..dispose();
    super.dispose();
  }

  late int _previousLength;

  _notEmptyListener() {
    final int currentLength = controller.text.length;
    if (currentLength == 0 && _previousLength == 1 || currentLength == 1 && _previousLength == 0) {
      setState(() {});
    }
    _previousLength = currentLength;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<OotmCommonTheme>();
    final typography = Theme.of(context).t;
    return TextField(
      controller: controller,
      autocorrect: false,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: AppStrings.searchFieldHint,
          hintStyle: typography.bodyMediumBold?.copyWith(color: theme?.textLighterColor),
          suffixIcon: controller.text.isNotEmpty
              ? IconButton(
                  icon: Icon(OotmIcons.close, size: 24, color: theme?.searchFieldCancelColor),
                  onPressed: () {
                    setState(() {
                      controller.clear();
                    });
                    if (widget.onClearCallback != null) {
                      widget.onClearCallback!();
                    }
                  })
              : null),
      cursorWidth: 2,
      textCapitalization: TextCapitalization.sentences,
      autofocus: true,
      cursorColor: theme?.primaryColor,
      onChanged: widget.onChange,
      onSubmitted: widget.onSubmitted,
      onEditingComplete: widget.onEditingComplete,
      style: typography.bodyMediumBold?.copyWith(color: theme?.primaryColor),
    );
  }
}
