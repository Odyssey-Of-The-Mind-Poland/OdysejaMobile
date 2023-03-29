import 'package:flutter/material.dart';
import 'package:odyssey_mobile/app/ootm_icons.dart';

import 'package:odyssey_mobile/app/strings.dart';
import 'package:odyssey_mobile/app/themes.dart';

class SearchField extends StatefulWidget {
  const SearchField({
    Key? key,
    this.onChange,
    this.onSubmitted,
    this.onEditingComplete,
    this.initialValue,
    this.onClearCallback,
  }) : super(key: key);

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
    return TextField(
      controller: controller,
      autocorrect: false,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: AppStrings.searchFieldHint,
          hintStyle: AppTextStyles.hint,
          suffixIcon: controller.text.isNotEmpty
              ? IconButton(
                  icon: const Icon(OotmIcons.close, size: 20),
                  onPressed: () {
                    setState(() {
                      controller.clear();
                    });
                    if (widget.onClearCallback != null) {
                      widget.onClearCallback!();
                    }
                  })
              : null),
      cursorWidth: 2.5,
      textCapitalization: TextCapitalization.sentences,
      autofocus: true,
      cursorColor: AppColors.primaryOrange,
      onChanged: widget.onChange,
      onSubmitted: widget.onSubmitted,
      onEditingComplete: widget.onEditingComplete,
      style: AppTextStyles.h3,
    );
  }
}
