import 'package:flutter/material.dart';

import 'components/account_page_app_bar.dart';
import 'components/account_page_body.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AccountPageAppBar(),
      body: AccountPageBody(),
    );
  }
}
