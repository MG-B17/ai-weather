
abstract class Failure {}

class OfflineFailure extends Failure {}

class ServerFailure extends Failure {}

class WeekPassFailure extends Failure {}

class ExistedAccountFailure extends Failure {}

class NoUserFailure extends Failure {}

class WrongPasswordFailure extends Failure {}

class LocationDisabledFailure extends Failure{}

class AiPredictionFailure extends Failure{}