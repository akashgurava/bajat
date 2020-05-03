import 'package:flutter_form_bloc/flutter_form_bloc.dart';

import '../../helpers/form_check.dart';
import '../../models/transaction_model.dart';

/// Handle state for Add Expense form
class ExpenseBloc extends FormBloc<String, String> {
  // ignore: public_member_api_docs
  ExpenseBloc() {
    addFieldBlocs(fieldBlocs: [
      amount,
      fromAccount,
      category,
      subCategory,
      description,
    ]);
  }

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

  /// Sub category of expense
  final TextFieldBloc subCategory = TextFieldBloc<NoExtraData>(
    validators: [FieldBlocValidators.required],
  );

  /// Any optional description of expense
  final TextFieldBloc description = TextFieldBloc<NoExtraData>();

  /// timestamp of expense
  DateTime timestamp;

  @override
  Future<void> onSubmitting() async {
    await Future<void>.delayed(const Duration(seconds: 1));
    final trans = Expense(
      id: '12',
      amount: double.tryParse(amount.value),
      fromAccount: fromAccount.value,
      category: category.value,
      subCategory: subCategory.value,
      timestamp: timestamp,
    );
    print(trans);
    emitSuccess();
  }
}
