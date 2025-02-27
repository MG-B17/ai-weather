import '../utilies/strings.dart';
import 'failure.dart';

String MapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return ErrorMessage.SERVER_FAILURE_MESSAGE;
    case OfflineFailure:
      return ErrorMessage.OFFLINE_FAILURE_MESSAGE;
    case WeekPassFailure:
      return ErrorMessage.WEEK_PASS_FAILURE_MESSAGE;
    case ExistedAccountFailure:
      return ErrorMessage.EXISTED_ACCOUNT_FAILURE_MESSAGE;
    case NoUserFailure:
      return ErrorMessage.NO_USER_FAILURE_MESSAGE;
    case WrongPasswordFailure:
      return ErrorMessage.WRONG_PASSWORD_FAILURE_MESSAGE;
    case LocationDisabledFailure:
      return ErrorMessage.PleaseEnableLoCation;
    case AiPredictionFailure:
      return ErrorMessage.AiError;
    default:
      return "Unexpected Error , Please try again later .";
  }
}