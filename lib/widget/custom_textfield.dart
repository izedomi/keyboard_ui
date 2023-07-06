import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:keyboard_ui/utils/textfield.dart';
import '../utils/app_color.dart';
import '../enum/keyboard_type.dart';

class CustomTextField extends StatefulWidget {
  final String labelText;
  final String? hintText;
  final String? optionalText;
  final TextEditingController controller;
  final Function? onChange;
  final bool? isPassword;
  final bool? isConfirmPassword;
  final bool? showSuffixIcon;
  final Widget? suffixIcon;
  final Widget? prefix;
  final String? errorText;
  final KeyboardType keyboardType;
  final double? width;
  final double? height;
  final bool? isReadOnly;
  final FocusNode? focusNode;
  final bool showLabelHeader;
  final Color? labelColor;
  final double? labelSize;
  final bool isOptional;
  final Function()? onTap;

  const CustomTextField(
      {Key? key,
      required this.labelText,
      this.hintText,
      this.optionalText,
      this.labelColor,
      this.labelSize,
      required this.controller,
      this.isPassword = false,
      this.isConfirmPassword = false,
      this.showSuffixIcon = false,
      this.suffixIcon,
      this.prefix,
      this.errorText,
      this.width,
      this.height,
      this.isReadOnly = false,
      this.keyboardType = KeyboardType.regular,
      this.showLabelHeader = true,
      this.focusNode,
      this.isOptional = false,
      this.onChange,
      this.onTap})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool showPassword = false;
  double radius = 12;

  @override
  void dispose() {
    if (widget.focusNode != null) {
      widget.focusNode?.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.showLabelHeader
            ? Column(
                children: [
                  Row(
                    children: [
                      Text(widget.labelText,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: widget.labelSize ?? 15)),
                    ],
                  ),
                  const SizedBox(height: 8)
                ],
              )
            : const SizedBox(),
        Container(
          width: widget.width ?? double.infinity,
          height: widget.height ?? 56,
          alignment: Alignment.center,
          child: TextField(
            //cursorHeight: 14.sp,
            cursorColor: Colors.black,
            focusNode: widget.focusNode,
            style: const TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
            controller: widget.controller,
            obscureText: widget.isPassword! && !showPassword,
            keyboardType: inputType(widget.keyboardType),
            inputFormatters: inputFormatter(widget.keyboardType),
            onChanged: (String value) {
              if (widget.onChange != null) {
                widget.onChange!();
              }
            },
            onTap: widget.onTap,
            readOnly: widget.isReadOnly!,
            decoration: InputDecoration(
                errorText: widget.errorText,
                hintText: widget.hintText,
                hintStyle: const TextStyle(color: Colors.black12),
                suffixIcon: suffixIcon(),
                prefix: widget.prefix,
                fillColor: Colors.transparent,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 1, color: AppColor.blue.withOpacity(0.3)),
                  borderRadius: BorderRadius.circular(radius),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(radius),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 1, color: AppColor.blue.withOpacity(0.3)),
                  borderRadius: BorderRadius.circular(radius),
                ),
                errorBorder: OutlineInputBorder(
                  //borderSide: BorderSide.none,
                  borderSide: BorderSide(
                      width: 1, color: AppColor.red.withOpacity(0.8)),
                  borderRadius: BorderRadius.circular(radius),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 1, color: AppColor.red.withOpacity(0.8)),
                  borderRadius: BorderRadius.circular(radius),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(width: 1, color: AppColor.brandBlue),
                  borderRadius: BorderRadius.circular(radius),
                )),
          ),
        ),
        widget.errorText == null
            ? const SizedBox.shrink()
            : Text(
                widget.errorText ?? "",
                style: TextStyle(
                    color: AppColor.red.withOpacity(0.8), fontSize: 12),
              )
      ],
    );
  }

  Widget? suffixIcon() {
    if (widget.isPassword! && !widget.isConfirmPassword!) {
      return GestureDetector(
          onTap: () => setState(() {
                showPassword = !showPassword;
              }),
          child: PasswordSuffixWidget(
            showPassword: showPassword,
          ));
    }
    if (widget.showSuffixIcon! && widget.suffixIcon == null) {
      return Icon(Iconsax.arrow_down,
          size: 18, color: AppColor.grey.withOpacity(0.7));
    }

    if (widget.showSuffixIcon! && widget.suffixIcon != null) {
      //return const Icon(FontAwesomeIcons.circleCheck, size: 16, color: green);
      return widget.suffixIcon;
    }
    return null;
  }
}

class PasswordSuffixWidget extends StatelessWidget {
  final bool showPassword;
  const PasswordSuffixWidget({super.key, required this.showPassword});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 26,
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 11, bottom: 11, right: 16),
      decoration: BoxDecoration(
          color: AppColor.brandOrange.withOpacity(0.1),
          borderRadius: BorderRadius.circular(4)),
      child: Text(
        !showPassword ? "Show" : "Hide",
        style: const TextStyle(fontSize: 11, color: AppColor.brandOrange),
      ),
    );
  }
}
