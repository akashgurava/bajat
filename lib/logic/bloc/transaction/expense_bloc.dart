import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:moor/moor.dart';

import '../../../config/locator.dart';
import '../../db/database.dart';
import '../../helpers/form_check.dart';

/// Handle state for Add Expense form
class ExpenseBloc extends FormBloc<String, String> {
  // ignore: public_member_api_docs
  ExpenseBloc() {
    addFieldBlocs(fieldBlocs: [
      amount,
      fromAccount,
      category,
      note,
    ]);
  }

  final Database _db = locator.get<Database>();

  /// Expense amount
  final TextFieldBloc amount = TextFieldBloc<NoExtraData>(
    validators: [FieldBlocValidators.required, isInt],
  );

  /// Account from which expense is made
  final TextFieldBloc fromAccount = TextFieldBloc<NoExtraData>(
    validators: [FieldBlocValidators.required],
  );

  /// Category of expense
  final TextFieldBloc category = TextFieldBloc<NoExtraData>(
    validators: [FieldBlocValidators.required],
  );

  /// Any optional description of expense
  final TextFieldBloc note = TextFieldBloc<NoExtraData>();

  /// timestamp of expense
  DateTime timestamp = DateTime.now();

  @override
  Future<void> onSubmitting() async {
    final expense = ExpensesCompanion(
      amount: Value(double.tryParse(amount.value)),
      account: Value(fromAccount.value),
      category: Value(category.value),
      note: Value(note.value == '' ? null : note.value),
      timestamp: Value(timestamp),
    );
    await _db.transactionsDao.insertExpense(expense);
    emitSuccess();
  }
}
