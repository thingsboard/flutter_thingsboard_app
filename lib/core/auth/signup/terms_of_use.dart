import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/parser.dart' as htmlparser;
import 'package:html/dom.dart' as dom;
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';
import 'package:thingsboard_app/widgets/tb_progress_indicator.dart';

class TermsOfUse extends TbPageWidget {

  TermsOfUse(TbContext tbContext) :
        super(tbContext);

  @override
  _TermsOfUseState createState() => _TermsOfUseState();

}

class _TermsOfUseState extends TbPageState<TermsOfUse> {

  late Future<String?> termsOfUseFuture;

  @override
  void initState() {
    super.initState();
    termsOfUseFuture = tbContext.tbClient.getSelfRegistrationService().getTermsOfUse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: TbAppBar(
          tbContext,
          title: Text('Terms of Use'),
        ),
        body:
        Column(
            children: [
              Expanded(
                  child: Padding(
                      padding: EdgeInsets.all(16),
                      child: SingleChildScrollView(
                          child: FutureBuilder<String?>(
                            future: termsOfUseFuture,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState == ConnectionState.done) {
                                var termsOfUse = jsonDecode(snapshot.data ?? '');
                                dom.Document document = htmlparser.parse(termsOfUse ?? '');
                                return Html.fromDom(
                                  document: document,
                                  tagsList: [],
                                );
                              } else {
                                return Center(child: TbProgressIndicator(
                                  tbContext,
                                  size: 50.0,
                                ));
                              }
                            },
                          )
                      )
                  )
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 36),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(onPressed: () => pop(false),
                          child: Text('Cancel')),
                      ElevatedButton(
                          onPressed: () => pop(true),
                          child: Text('Accept'))
                    ],
                  )
              )
            ]
        )
    );
  }

}
