class ConsumptionModel {
  late double _quilometros;
  late double _litros;

  double get quilometros => _quilometros;
  double get litros => _litros;

  set setQuilometros(double quilometros) {
    _quilometros = quilometros;
  }

  set setLitros(double litros) {
    _litros = litros;
  }

  double calcula() {
    return (quilometros / litros);
  }
}
