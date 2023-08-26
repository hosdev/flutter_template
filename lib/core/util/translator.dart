import 'package:flutter/widgets.dart';
import 'gen/l10n.dart';
export 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension AppLocalizationsX on BuildContext {
  S get tr => S.of(this);
}