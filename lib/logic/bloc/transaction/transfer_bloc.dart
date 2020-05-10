import 'package:flutter_form_bloc/flutter_form_bloc.dart';

import '../../helpers/form_check.dart';
import '../../models/transaction_model.dart';

/// Handle state for Add Transfer  transaction form
class TransferBloc extends FormBloc<String, String> {
  // ignore: public_member_api_docs
  TransferBloc() {
    addFieldBlocs(fieldBlocs: [
      amount,
      fromAccount,
      toAccount,
      description,
    ]);
  }

  /// Transfer amount
  final TextFieldBloc amount = TextFieldBloc<NoExtraData>(
    validators: [FieldBlocValidators.required, isInt],
  );

  /// Account from which transfer is made
  final TextFieldBloc fromAccount = TextFieldBloc<NoExtraData>(
    validators: [FieldBlocValidators.required],
  );

  /// Account to which transfer is made
  final TextFieldBloc toAccount = TextFieldBloc<NoExtraData>(
    validators: [FieldBlocValidators.required],
  );

  /// Any optional description of transfer
  final TextFieldBloc description = TextFieldBloc<NoExtraData>();

  /// timestamp of transfer
  DateTime timestamp = DateTime.now();

  @override
  Future<void> onSubmitting() async {
    await Future<void>.delayed(const Duration(seconds: 1));
    final trans = Transfer(
      id: '12',
      amount: double.tryParse(amount.value),
      fromAccount: fromAccount.value,
      toAccount: toAccount.value,
      timestamp: timestamp,
    );
    print(trans);
    emitSuccess();
  }
}
