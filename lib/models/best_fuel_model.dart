class BestFuelModel {
  late double _etanol;
  late double _gasolina;

  double get etanol => _etanol;
  double get gasolina => _gasolina;

  set setEtanol(double value) {
    _etanol = value;
  }

  set setGasolina(double value) {
    _gasolina = value;
  }

  double calcula() {
    return (etanol / gasolina);
  }
}
