import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:thingsboard_app/config/themes/app_colors.dart';
import 'package:thingsboard_app/config/themes/tb_text_styles.dart';
import 'package:thingsboard_app/generated/l10n.dart';

class TbValicationMessages {
  static const invalidCode = 'invalidCode';
  static const tooManyRequests = 'tooManyRequest';
}

class TbTextField extends HookWidget {
  const TbTextField({
    super.key,
    this.hint = '',
    this.label = '',
    this.onSubmit,
    this.type,
    this.obscureText = false,
    this.autoFillHints,
    this.onMaxLengthReched,
    this.autoFocus = false,
    this.prefixIcon,
    this.suffixIcon,
    required this.formControlName,
    this.onPressed,
    this.readOnly = false,
  });
  final bool obscureText;
  final VoidCallback? onMaxLengthReched;
  final String hint;
  final String label;
  final VoidCallback? onSubmit;
  final String formControlName;
  final Iterable<String>? autoFillHints;
  final TextInputType? type;
  final bool autoFocus;
  final Widget? prefixIcon;
  final VoidCallback? onPressed;
  final Widget? suffixIcon;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    final form = ReactiveForm.of(context) as FormControlCollection?;
    final node = useFocusNode();
    final formControl = form?.control(formControlName);
    final bool isRequired = (formControl?.validators ?? []).contains(
      Validators.required,
    );
    final MaxLengthValidator? maxLengthValidator =
        (formControl?.validators ?? [])
            .whereType<MaxLengthValidator>()
            .firstOrNull;

    final int? counterMaxValue = maxLengthValidator?.maxLength;
    final isVisible = useState(false);
    final isTouched = useRef(false);
    final isError = useRef(false);
    final isErrorState = useState(false);
    // final theme = Theme.of(context);
    final counter = useState(0);
    //  final iconStateColor = isErrorState.value ? AppColors.textError : null;

    useEffect(() {
      void updateState() {
        isError.value = formControl?.invalid ?? false;
        isErrorState.value = isError.value && isTouched.value;
      }

      final errors = formControl?.statusChanged.listen((e) {
        isError.value = e == ControlStatus.invalid;
        updateState();
      });

      final touches = formControl?.touchChanges.listen((e) {
        isTouched.value = e;
        updateState();
      });
      void cancel() {
        touches?.cancel();
        errors?.cancel();
      }

      return cancel;
    }, [formControl?.statusChanged, formControl?.touchChanges]);

    return ReactiveTextField(
      focusNode: node,
      readOnly: readOnly,
      onTap: (control) {
        if(onPressed != null) {
        onPressed?.call();
        node.unfocus();
        }

      },
      onChanged: (control) {
        counter.value = control.value?.toString().length ?? 0;
        if (counter.value == counterMaxValue) {
          onMaxLengthReched?.call();
        }
      },
      autofocus: autoFocus,
      onSubmitted: (_) => onSubmit?.call(),
      maxLength: counterMaxValue,
      cursorHeight: TbTextStyles.bodyLarge.fontSize,
      obscureText: obscureText && !isVisible.value,
      keyboardType: type,
      autofillHints: autoFillHints,
      formControlName: formControlName,
      validationMessages: {
        ValidationMessage.required:
            (error) => '$label ${S.of(context).isRequiredText}',
        ValidationMessage.email: (error) => S.of(context).emailInvalidText,
        ValidationMessage.mustMatch: (error) => 'Fields must match',
        ValidationMessage.minLength: (error) {
          final desc = error as Map;
          return '$label is too short, required length is ${desc['requiredLength']}';
        },
        ValidationMessage.maxLength: (error) {
          final desc = error as Map;
          return '$label is too long, required lenght is ${desc['requiredLength']}';
        },
        TbValicationMessages.tooManyRequests:
            (error) => S.of(context).verificationCodeManyRequest,
        TbValicationMessages.invalidCode:
            (error) => S.of(context).verificationCodeInvalid,
      },
      style: TbTextStyles.bodyLarge.copyWith(
        color: isErrorState.value ? AppColors.textError : null,
      ),
      decoration: InputDecoration(
        counterText:
            maxLengthValidator != null
                ? '${counter.value}/$counterMaxValue'
                : null,
        suffixIcon:
            suffixIcon ??
            (obscureText
                ? IconButton(
                  splashRadius: 10,

                  icon: Icon(
                    !isVisible.value ? Icons.visibility_off : Icons.visibility,
                    color: AppColors.iconDisabled,
                    size: 24,
                  ),

                  onPressed: () {
                    isVisible.value = !isVisible.value;
                  },
                )
                : const SizedBox(width: 24)),
        prefixIcon: prefixIcon,
        labelText: isRequired ? '$label*' : label,
        hintText: hint,
        
        isDense: true,
        border: const OutlineInputBorder(),
        // Override theme styles when there's an error state
        labelStyle:
            isErrorState.value
                ? TbTextStyles.bodyLarge.copyWith(color: AppColors.textError)
                : null,
        floatingLabelStyle:
            isErrorState.value
                ? WidgetStateTextStyle.resolveWith((Set<WidgetState> states) {
                  return TbTextStyles.labelSmall.copyWith(
                    color: AppColors.textError,
                  );
                })
                : null,
      ),
    );
  }
}
