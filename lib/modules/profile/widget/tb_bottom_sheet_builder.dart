import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:thingsboard_app/config/themes/app_colors.dart';
import 'package:thingsboard_app/config/themes/tb_text_styles.dart';
import 'package:thingsboard_app/core/auth/login/widgets/text_field.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/utils/ui/text_extension.dart';

class TbBottomSheetBuilder<T> extends HookWidget {
  const TbBottomSheetBuilder({
    super.key,
    required this.title,
    required this.allItems,
    this.searchFunction,
    this.listTitleBuilder,
    this.itemBuilder,
    this.shrinkWrap = true
  });
  final List<T> allItems;
  final String title;
  final bool Function(String input, T item)? searchFunction;
  final Widget Function(BuildContext context, String search, T item)?
  itemBuilder;
  final String Function(BuildContext context, T item)? listTitleBuilder;
  final bool shrinkWrap;
  @override
  Widget build(BuildContext context) {
    final form = useMemoized(() => FormGroup({"searchValue": FormControl()}));

    return ReactiveForm(
      formGroup: form,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
          color: AppColors.textWhite,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: AppColors.bgOverlay,
              ),
              height: 4,
              width: 32,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title, style: TbTextStyles.titleXs),
                  TextButton(
                    onPressed: () {
                      context.pop();
                    },
                    child: Text(
                      S.of(context).close,
                      style: TbTextStyles.labelMedium,
                    ),
                  ),
                ],
              ),
            ),
            if (searchFunction != null)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: ReactiveFormConsumer(
                  builder: (context, formGroup, child) {
                    return TbTextField(
                      formControlName: "searchValue",
                      prefixIcon: const Icon(
                        Icons.search,
                        color: AppColors.iconDisabled,
                        size: 24,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          form.control('searchValue').updateValue('');
                        },

                        icon: const Icon(
                          Icons.close,
                          size: 24,
                          color: AppColors.iconDisabled,
                        ),
                      ),
                      hint: S.of(context).search,
                    );
                  },
                ),
              ),
            Flexible(
              child: ReactiveFormConsumer(
                builder: (context, formGroup, child) {
                  final searchValue = formGroup.control('searchValue').value;

                  final filteredItems =
                      allItems.where((e) {
                        if (searchValue == null ||
                            searchValue.toString().isEmpty) {
                          return true;
                        }
                        final searchTerm = searchValue.toString().toLowerCase();
                        return searchFunction?.call(searchTerm, e) ?? true;
                      }).toList();

                  return ListView.separated(
                    shrinkWrap: shrinkWrap,
                    itemBuilder: (context, index) {
                      final item = filteredItems[index];
                      return itemBuilder?.call(
                            context,
                            searchValue.toString(),
                            item,
                          ) ??
                          ListTile(
                            onTap: () => context.pop(item),

                            title: Text(
                              listTitleBuilder?.call(context, item) ??
                                  item.toString(),
                            ).boldSubString(
                              searchValue.toString(),

                              regularTextStyle: TbTextStyles.bodyLarge,
                            ),
                          );
                    },
                    separatorBuilder:
                        (context, index) => const Divider(height: 1),
                    itemCount: filteredItems.length,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
