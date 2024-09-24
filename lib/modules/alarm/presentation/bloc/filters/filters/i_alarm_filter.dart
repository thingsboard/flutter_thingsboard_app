abstract interface class IAlarmFilter<T> {
  T getSelectedFilterData();

  void updateSelectedData(T data);

  void reset();
}
