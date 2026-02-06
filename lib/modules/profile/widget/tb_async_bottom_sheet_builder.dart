import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:thingsboard_app/config/themes/app_colors.dart';
import 'package:thingsboard_app/config/themes/tb_text_styles.dart';
import 'package:thingsboard_app/core/auth/login/widgets/text_field.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/modules/dashboard/domain/pagination/dashboards_pagination_repository.dart';
import 'package:thingsboard_app/utils/ui/pagination_widgets/first_page_exception_widget.dart';
import 'package:thingsboard_app/utils/ui/text_extension.dart';
import 'package:thingsboard_app/widgets/tb_progress_indicator.dart';

class TbAsyncBottomSheetBuilder<PageKeyType, ItemType> extends HookWidget {
  const TbAsyncBottomSheetBuilder({
    super.key,
    required this.title,
    this.listTitleBuilder,
    this.itemBuilder,
    required this.repository,

    this.selectedValue,
  });
  final String title;
  final ItemType? selectedValue;

  final Widget Function(BuildContext context, ItemType item)? itemBuilder;
  final String Function(BuildContext context, ItemType item)? listTitleBuilder;
  final SearchablePaginationRepository<PageKeyType, ItemType> repository;

  @override
  Widget build(BuildContext context) {
    final form = useMemoized(() => FormGroup({"searchValue": FormControl()}));
    useEffect(() {
      final l = form
          .control('searchValue')
          .valueChanges
          .debounce(const Duration(milliseconds: 500))
          .listen((e) {
            final val = form.control('searchValue').value?.toString();
            repository.search(val);
          });
      return () {
        repository.search(null);
        l.cancel();
      };
    }, []);

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

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
            ReactiveFormConsumer(
              builder: (context, formGroup, child) {
                final searchValue = formGroup.control('searchValue').value;

                return PagedListView<PageKeyType, ItemType>.separated(
                  pagingController: repository.pagingController,
                  shrinkWrap: true,
                  separatorBuilder:
                      (context, index) => const Divider(height: 1),
                  builderDelegate: PagedChildBuilderDelegate<ItemType>(
                    noItemsFoundIndicatorBuilder:
                        (context) => FirstPageExceptionIndicator(
                          title: S.of(context).notFound,
                          message: S.of(context).listIsEmptyText,
                        ),
                    animateTransitions: true,
                    firstPageProgressIndicatorBuilder:
                        (context) => const Center(child: TbProgressIndicator()),
                    itemBuilder: (context, item, index) {
                      bool isSelected = false;
                      if (selectedValue != null) {
                        final convertedItem =
                            listTitleBuilder?.call(context, item) ??
                            item.toString();
                        final convertedSelectedItem =
                            listTitleBuilder?.call(context, selectedValue as ItemType) ??
                            selectedValue.toString();
                        isSelected = convertedSelectedItem == convertedItem;
                      }

                      return Material(
                        child:
                            itemBuilder?.call(context, item) ??
                            ListTile(
                              selected: isSelected,
                              selectedTileColor: Theme.of(
                                context,
                              ).primaryColor.withValues(alpha: 0.06),
                              onTap: () => context.pop(item),
                              dense: true,
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    listTitleBuilder?.call(context, item) ??
                                        item.toString(),
                                  ).boldSubString(
                                    searchValue.toString(),

                                    regularTextStyle: TbTextStyles.bodyLarge,
                                  ),
                                  if (isSelected)
                                    Icon(
                                      Icons.check,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                ],
                              ),
                            ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
