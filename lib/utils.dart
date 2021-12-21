/// Return a [DateTime] in the string format:
/// 'DAY.MONTH.YEAR at HOURh00'
String buildDateTimeString(DateTime d) {
  return '${d.day}.${d.month}.${d.year} at ${d.hour}h00';
}