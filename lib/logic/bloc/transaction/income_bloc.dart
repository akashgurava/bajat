import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:moor/moor.dart';

import '../../../config/locator.dart';
import '../../db/database.dart';
import '../../helpers/form_check.dart';

/// Handle state for Add Income form
class IncomeBloc extends FormBloc<String, String> {
  // ignore: public_member_api_docs
  IncomeBloc() {
    addFieldBlocs(fieldBlocs: [
      amount,
      source,
      account,
      note,
    ]);
  }

  final Database _db = locator.get<Database>();

  /// Income amount
  final TextFieldBloc amount = TextFieldBloc<NoExtraData>(
    validators: [FieldBlocValidators.required, isInt],
  );

  /// Source of income
  final TextFieldBloc source = TextFieldBloc<NoExtraData>(
    validators: [FieldBlocValidators.required],
  );

  /// Account to which income was credited
  final TextFieldBloc account = TextFieldBloc<NoExtraData>(
    validators: [FieldBlocValidators.required],
  );

  /// Any optional description of income
  final TextFieldBloc note = TextFieldBloc<NoExtraData>();

  /// timestamp of income
  DateTime timestamp = DateTime.now();

  @override
  Future<void> onSubmitting() async {
    final income = IncomesCompanion(
      amount: Value(double.tryParse(amount.value)),
      source: Value(source.value),
      account: Value(account.value),
      note: Value(note.value == '' ? null : note.value),
      timestamp: Value(timestamp),
    );
    await _db.transactionsDao.insertIncome(income);
    emitSuccess();
  }
}
