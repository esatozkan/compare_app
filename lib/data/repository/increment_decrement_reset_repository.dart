class IncremetDecrementResetRepository {
  int incrementValue(int value) {
    return ++value;
  }

  int decrementValue(int value) {
    return --value;
  }

  int resetValue(int value) {
    value = 0;
    return value;
  }
}
