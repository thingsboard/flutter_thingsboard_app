import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/messages.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as htmlparser;
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/thingsboard_client.dart' show MobileInfoQuery;
import 'package:thingsboard_app/widgets/tb_app_bar.dart';
import 'package:thingsboard_app/widgets/tb_progress_indicator.dart';

class TermsOfUse extends TbPageWidget {
  TermsOfUse(TbContext tbContext, {super.key}) : super(tbContext);

  @override
  State<StatefulWidget> createState() => _TermsOfUseState();
}

class _TermsOfUseState extends TbPageState<TermsOfUse> {
  late Future<String?> termsOfUseFuture;

  @override
  void initState() {
    super.initState();
    termsOfUseFuture =
        tbContext.tbClient.getSelfRegistrationService().getTermsOfUse(
              query: MobileInfoQuery(
                packageName: tbContext.packageName,
                platformType: tbContext.platformType,
              ),
            );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: TbAppBar(
        tbContext,
        title: Text(S.of(context).termsOfUse),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: FutureBuilder<String?>(
                    future: termsOfUseFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.data == null ||
                            snapshot.data?.isEmpty == true) {
                          return const SizedBox.shrink();
                        }

                        dom.Document document = htmlparser.parse(
                          snapshot.data ?? '',
                        );
                        return Html.fromDom(
                          document: document,
                        );
                      } else {
                        return Center(
                          child: TbProgressIndicator(
                            tbContext,
                            size: 50.0,
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () => pop(false),
                    child: Text(S.of(context).cancel),
                  ),
                  ElevatedButton(
                    onPressed: () => pop(true),
                    child: Text(S.of(context).accept),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
