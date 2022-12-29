import 'package:alcool_gasolina/controllers/consumption_controller.dart';
import 'package:flutter/material.dart';

class CalculateConsumption extends StatefulWidget {
  @override
  State<CalculateConsumption> createState() => _CalculateConsumptionState();
}

class _CalculateConsumptionState extends State<CalculateConsumption> {
  final ConsumptionController controller = ConsumptionController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF61BC52),
        title: const Text(
          'Álcool ou Gasolina',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Color(0xFFF4F4F4),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: controller.quilometrosController,
                  //inputFormatters: [controller.textMask],
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Color(0xFF61BC52),
                  ),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Quilômetros',
                    suffixText: 'KM',
                    hintStyle: TextStyle(
                      color: Color(0xFF61BC52),
                      fontFamily: 'Poppins',
                    ),
                    prefixIcon: Icon(
                      Icons.directions_car,
                      color: Color(0xFF61BC52),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (String? value) {
                    return controller.validaCampo(value);
                  },
                ),
                Padding(padding: EdgeInsets.only(top: 16, bottom: 16)),
                TextFormField(
                  controller: controller.litrosController,
                  //inputFormatters: [controller.textMask],
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Color(0xFF61BC52),
                  ),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Litros',
                    suffixText: 'L',
                    hintStyle: TextStyle(
                      color: Color(0xFF61BC52),
                      fontFamily: 'Poppins',
                    ),
                    prefixIcon: Icon(
                      Icons.local_gas_station,
                      color: Color(0xFF61BC52),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (String? value) {
                    return controller.validaCampo(value);
                  },
                ),
                Padding(padding: EdgeInsets.only(top: 25, bottom: 25)),
                Container(
                  padding: EdgeInsets.only(left: 40, right: 40),
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all(
                        Color(0xFF61BC52),
                      ),
                    ),
                    onPressed: () {
                      controller.calcularMelhorOpcao();
                    },
                    child: const Text(
                      'Calcular',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 25, bottom: 25)),
                ValueListenableBuilder(
                  valueListenable: controller.textResultado,
                  builder: (_, double value, __) {
                    return Visibility(
                      visible: value > 0,
                      replacement: Container(),
                      child: Container(
                        margin: EdgeInsets.only(left: 40, right: 40),
                        padding: EdgeInsets.fromLTRB(2, 30, 2, 30),
                        width: double.infinity,
                        //height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(
                                text: '${value.toStringAsFixed(2)}',
                                style: TextStyle(
                                  color: Color(0xFF61BC52),
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                                children: [
                                  TextSpan(
                                    text: ' KM/L',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(padding: EdgeInsets.all(8)),
                            Text(
                              'A cada ${value.toStringAsFixed(2)} KM seu veículo consome 1 litro',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 13,
                                fontFamily: 'Poppins',
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
