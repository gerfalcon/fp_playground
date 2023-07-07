// ignore_for_file: avoid_print

import 'package:fpdart/fpdart.dart';

class PaymentError {
  final String message;

  PaymentError(this.message);
}

class PaymentSuccess {
  final String message;

  PaymentSuccess(this.message);
}

// Payment function
Either<PaymentError, PaymentSuccess> processPayment(int amount) {
  if (amount <= 0) {
    return Either.left(
        PaymentError('Invalid amount. Amount should be more than 0.'));
  } else if (amount > 10000) {
    return Either.left(
        PaymentError('Payment amount exceeds limit. Maximum limit is 10000.'));
  } else {
    return Either.right(
        PaymentSuccess('Payment of $amount processed successfully.'));
  }
}

// Function to process a list of payments
Iterable<Either<PaymentError, PaymentSuccess>> processPayments(
        List<int> amounts) =>
    amounts.map(processPayment);

/// In the main function, we have a list of payment amounts which we pass to the processPayments function.
/// This gives us a list of Either results. We then iterate over this list and print out the results using fold.
/// The PaymentError message is printed if the payment amount is less than or equal to 0 or exceeds the maximum limit (10000), and the PaymentSuccess message is printed if the payment is processed successfully.
void main() {
  final amounts = [100, 15000, -50, 5000, 0];
  final Iterable<Either<PaymentError, PaymentSuccess>> results =
      processPayments(amounts);

  for (final result in results) {
    result.fold(
      (paymentError) => print(paymentError.message),
      (paymentSuccess) => print(paymentSuccess.message),
    );
  }
}
