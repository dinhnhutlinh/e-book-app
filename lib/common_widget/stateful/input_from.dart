import 'package:e_book_app/assets.gen.dart';
import 'package:e_book_app/themes/app_colors.dart';
import 'package:e_book_app/themes/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputForm extends StatefulWidget {
  final TextEditingController controller;
  final bool isPassword;
  final String hintText;
  final FormFieldValidator<String>? validator;

  const InputForm({
    Key? key,
    required this.controller,
    required this.isPassword,
    required this.hintText,
    this.validator,
  }) : super(key: key);

  @override
  State<InputForm> createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  bool _isHide = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isPassword ? _isHide : false,
      style: AppTextStyle.inputWhite,
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white.withOpacity(0.2),
          border: InputBorder.none,
          hintText: widget.hintText,
          hintStyle: AppTextStyle.inputWhite,
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: SizedBox(
                    height: 24,
                    width: 24,
                    child: _isHide
                        ? Assets.resources.icons.previewOpen.svg(
                            height: 8,
                            width: 8,
                            color: AppColors.white,
                          )
                        : Assets.resources.icons.previewClose.svg(
                            height: 8,
                            width: 8,
                            color: AppColors.white,
                          ),
                  ),
                  onPressed: () => setState(() => _isHide = !_isHide))
              : null,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(24),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(24),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(24),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(24),
          ),
          errorStyle: GoogleFonts.openSans(
            color: AppColors.deepOrange,
          ),
          contentPadding:
              const EdgeInsets.only(right: 24, left: 24, top: 8, bottom: 8)),
      maxLines: 1,
      cursorColor: AppColors.white,
      validator: widget.validator,
    );
  }
}
