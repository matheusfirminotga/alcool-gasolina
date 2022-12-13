import 'package:alcool_gasolina/models/best_fuel_model.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class BestFuelController {
  BestFuelModel model = BestFuelModel();

  final textMask = MaskTextInputFormatter(
    mask: '#.##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  final etanolController = TextEditingController();
  final gasolinaController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  ValueNotifier<String> textResultado = ValueNotifier('');

  String? validaCampo(String? value) {
    if (value!.isEmpty) {
      return 'Preencha este campo';
    } else {
      return null;
    }
  }

  void calculaCombustivel() {
    if (formKey.currentState!.validate()) {
      model.setEtanol = double.parse(etanolController.value.text);
      model.setGasolina = double.parse(gasolinaController.value.text);
      double resultado = model.calcula();

      if (resultado < 0.7) {
        textResultado.value = 'Etanol';
      } else {
        textResultado.value = 'Gasolina';
      }
    }
  }
}
