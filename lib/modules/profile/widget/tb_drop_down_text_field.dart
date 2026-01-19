import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:thingsboard_app/core/auth/login/widgets/text_field.dart';

class TbDropDownTextField<T> extends HookWidget {
  const TbDropDownTextField({
    super.key,
    required this.formControlName,
    required this.selectedItemBuilder,
    this.hint = '',
    this.label = '',
    this.prefixIcon,
    required this.bottomSheetBuilder,
    this.onSelected,
  });

  final String formControlName;
  final String? Function(T? value) selectedItemBuilder;
  final String hint;
  final String label;
  final Widget? prefixIcon;
  final Widget Function(BuildContext, T? selectedValue) bottomSheetBuilder;
  final void Function(T? val)? onSelected;
  @override
  Widget build(BuildContext context) {
    final topForm = ReactiveForm.of(context) as FormControlCollection?;
    final control = topForm?.control(formControlName);
    final val = control?.value as T?;
    final isRequired =
        control?.validators.contains(Validators.required) ?? false;
    final mediaQuery = MediaQuery.of(context);
    final form = useMemoized(
      () => FormGroup({"value": FormControl(value: selectedItemBuilder(val))}),
    );
    useEffect(() {
      final stream = topForm?.control(formControlName).valueChanges.listen((e) {
        form
            .control('value')
            .patchValue(e == null ? null : selectedItemBuilder(e as T));
      });
      return () {
        stream?.cancel();
      };
    }, []);
    return ReactiveForm(
      formGroup: form,
      child: ReactiveFormConsumer(
        builder:
            (context, form, child) => TbTextField(
              formControlName: 'value',
              readOnly: true,
              hint: hint,
              label: label,
              suffixIcon:
                  !isRequired && form.control('value').value != null
                      ? IconButton(
                        onPressed: () {
                          topForm?.control(formControlName).updateValue(null);
                          onSelected?.call(null);
                        },
                        icon: const Icon(Icons.close),
                      )
                      : const Icon(Icons.arrow_drop_down, size: 24),
              onPressed: () async {
                final val = control?.value as T?;
                final info = await showModalBottomSheet<T>(
                  context: context,
                  builder: (context) => bottomSheetBuilder(context, val),
                  showDragHandle: false,
                  backgroundColor: Colors.transparent,
                  isScrollControlled: true,
                  // constraints: BoxConstraints.loose(
                  //   Size.fromHeight(mediaQuery.size.height - 72),
                  // ),
                );

                if (info != null && context.mounted) {
                  // form.control('value').updateValue(selectedItemBuilder(info));
                  topForm?.control(formControlName).updateValue(info);
                  onSelected?.call(info);
                }
              },
            ),
      ),
    );
  }
}
