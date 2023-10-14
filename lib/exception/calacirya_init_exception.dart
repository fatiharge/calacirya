/*
 * Copyright (c) 2023 fatiharge
 *
 * You are free to copy, modify, and redistribute this software, but you must abide by these terms when distributing any derivative works under the project's license.
 *
 *  Author : Fatih Çetin
 *  Mail   : fatih@fatiharge.com
 *
 */

/// Exception thrown when Calacirya is used before being initialized.
class CalaciryaInitException implements Exception {
  @override
  String toString() {
    return 'Your Calacirya has not been initialized yet.';
  }
}
