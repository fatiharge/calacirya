/*
 * Copyright (c) 2023 fatiharge
 *
 * You are free to copy, modify, and redistribute this software, but you must abide by these terms when distributing any derivative works under the project's license.
 *
 *  Author : Fatih Çetin
 *  Mail   : fatih@fatiharge.com
 *
 */

/// An exception class for login-related errors.
class LoginException implements Exception {
  /// The error message describing the exception.
  String error;

  /// A more detailed error message for the exception.
  String message;

  /// The type of the login exception.
  LoginExceptionType type;

  /// Creates a [LoginException] with the specified [type] and an optional [message].
  ///
  /// The [message] parameter is used to provide additional details about the error.
  /// If not provided, an empty string will be used.
  factory LoginException({required LoginExceptionType type, String? message}) {
    return LoginException._(error: _getError(type), type: type, message: message ?? type.name);
  }

  /// Private constructor for [LoginException].
  LoginException._({required this.error, required this.type, required this.message});

  @override
  String toString() {
    return error;
  }

  /// Gets the error message based on the [type] of the login exception.
  static String _getError(LoginExceptionType type) {
    switch (type) {
      case LoginExceptionType.password:
        return "Invalid password";
      case LoginExceptionType.username:
        return "Invalid username";
      case LoginExceptionType.network:
        return "Network error";
      case LoginExceptionType.invalidEmail:
        return "Invalid email";
      case LoginExceptionType.accountLocked:
        return "Account locked";
      case LoginExceptionType.timeout:
        return "Timeout error";
      case LoginExceptionType.unknown:
        return "Unknown error";
      case LoginExceptionType.invalidRequestBody:
        return "Invalid request body";
      case LoginExceptionType.missingHeaders:
        return "Missing headers";
    }
  }
}

/// Enum representing different types of login exception.
/// Enum representing different types of login exception.
enum LoginExceptionType {
  /// Represents an invalid password error.
  password,

  /// Represents an invalid username error.
  username,

  /// Represents a network error.
  network,

  /// Represents an invalid email error.
  invalidEmail,

  /// Represents an account locked error.
  accountLocked,

  /// Represents a timeout error.
  timeout,

  /// Represents an unknown error.
  unknown,

  /// Represents an invalid request body error.
  invalidRequestBody,

  /// Represents a missing headers error.
  missingHeaders,
}
