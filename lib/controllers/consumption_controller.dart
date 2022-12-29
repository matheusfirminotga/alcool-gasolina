import 'package:alcool_gasolina/models/consumption_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ConsumptionController {
  ConsumptionModel model = ConsumptionModel();

  final textMask = MaskTextInputFormatter(
    mask: '#.##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  final quilometrosController = TextEditingController();
  final litrosController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  ValueNotifier<double> textResultado = ValueNotifier(0);

  String? validaCampo(String? value) {
    if (value!.isEmpty) {
      return 'Preencha este campo';
    } else {
      return null;
    }
  }

  void calcularMelhorOpcao() {
    if (formKey.currentState!.validate()) {
      model.setQuilometros = double.parse(quilometrosController.value.text);
      model.setLitros = double.parse(litrosController.value.text);
      double resultado = model.calcula();
      textResultado.value = resultado;
    }
  }
}
