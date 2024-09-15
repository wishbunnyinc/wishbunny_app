
class Constants {
  static var passwordRegExp = RegExp(r'^(?=.*[a-zA-Z])(?=.*\d)[A-Za-z\d!@#$%^&*()_+={}\[\]:;<>,.?/~\\|-]{8,20}$');
  static var mailRegExp = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');
}