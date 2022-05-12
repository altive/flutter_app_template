import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common_widgets/loading_indicator.dart';
import '../../common_widgets/primary_button.dart';
import '../../common_widgets/unfocus_on_tap.dart';
import '../../core/app_constant/app_info.dart';
import 'user_request_controller.dart';

class UserRequestPage extends StatefulWidget {
  const UserRequestPage();

  // ----------------------------------------
  // Field
  // ----------------------------------------
  static const String routeName = '/user-request';

  // ----------------------------------
  // Override Methods
  // ----------------------------------
  @override
  _UserRequestPageState createState() => _UserRequestPageState();
}

class _UserRequestPageState extends State<UserRequestPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FocusNode _replyForFocus = FocusNode();
  final FocusNode _textFocus = FocusNode();
  String? _replyFor;
  String? _comment;

  // ----------------------------------
  // Override Methods
  // ----------------------------------
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final appInfo = ref.watch(appConstantProvider);
        final userRequestState = ref.watch(userRequestProvider);
        final userRequestController = ref.watch(userRequestProvider.notifier);
        return UnfocusOnTap(
          child: Scaffold(
            appBar: AppBar(title: const Text('要望・不具合')),
            body: LoadingIndicator(
              loading: userRequestState.sending,
              child: SafeArea(
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 16,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Text('${appInfo.title}をご利用いただきありがとうございます。'),
                          const SizedBox(height: 16),
                          _buildCommentTextForm(),
                          const SizedBox(height: 16),
                          _buildReplyForTextForm(),
                          PrimaryButton(
                            iconData: Icons.mail,
                            labelText: '送信',
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                // 送信確認
                                final isSend = await _showConfirmDialog();
                                if (isSend == null || isSend == false) {
                                  // 送信しない
                                  return;
                                }
                                // レポート送信
                                await userRequestController.sendRequest(
                                  replyFor: _replyFor!,
                                  text: _comment!,
                                );
                                Navigator.of(context).pop();
                              }
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<bool?> _showConfirmDialog() async {
    return showModalActionSheet(
      context: context,
      title: '要望・不具合の送信',
      message: 'ご利用いただきありがとうございます。お送りいただいた内容は調査・検討の上対応させていただきます。',
      cancelLabel: 'キャンセル',
      actions: [
        const SheetAction(
          label: '送信',
          key: true,
          isDefaultAction: true,
        )
      ],
    );
  }

  Widget _buildReplyForTextForm() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      focusNode: _replyForFocus,
      validator: (value) {
        if (!value!.contains('@') || !value.contains('.')) {
          return 'メールアドレスを記入してください';
        }
        return null;
      },
      onSaved: (value) => _replyFor = value,
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.mail),
        border: OutlineInputBorder(),
        labelText: '返信連絡先メールアドレス',
      ),
    );
  }

  Widget _buildCommentTextForm() {
    return TextFormField(
      minLines: 3,
      maxLines: 50,
      autofocus: true,
      focusNode: _textFocus,
      validator: (value) {
        if (value!.length < 5) {
          return '内容を記入してください。';
        }
        return null;
      },
      onSaved: (value) => _comment = value,
      onFieldSubmitted: (_) {
        FocusScope.of(context).requestFocus(_replyForFocus);
      },
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.speaker_notes),
        border: OutlineInputBorder(),
        labelText: '要望や不具合の内容',
        hintText: '気づいたことをなんでもご記入ください',
      ),
    );
  }
}
