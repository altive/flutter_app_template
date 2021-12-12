import 'package:flutter_hooks/flutter_hooks.dart';

import '../../l10n/l10n.dart';

L10n useL10n() => L10n.of(useContext())!;
