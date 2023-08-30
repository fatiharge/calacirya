/// Exception thrown when Calacirya is used before being initialized.
class CalaciryaInitException implements Exception {
  @override
  String toString() {
    return 'Your Calacirya has not been initialized yet.';
  }
}
