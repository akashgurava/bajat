import 'package:flutter_form_bloc/flutter_form_bloc.dart';

import 'package:moor/moor.dart';

import '../../../config/locator.dart';
import '../../db/database.dart';
import '../../helpers/form_check.dart';

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

  final Database _db = locator.get<Database>();

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
    final transfer = TransfersCompanion(
      amount: Value(double.tryParse(amount.value)),
      fromAccount: Value(fromAccount.value),
      toAccount: Value(toAccount.value),
      note: Value(description.value == '' ? null : description.value),
      timestamp: Value(timestamp),
    );
    await _db.transactionsDao.insertTransfer(transfer);
    print(await _db.transactionsDao.getTranscations());
    emitSuccess();
  }
}
