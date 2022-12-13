import 'package:alcool_gasolina/controllers/best_fuel_controller.dart';
import 'package:flutter/material.dart';

class BestFuel extends StatefulWidget {
  @override
  State<BestFuel> createState() => _BestFuelState();
}

class _BestFuelState extends State<BestFuel> {
  final BestFuelController controller = BestFuelController();

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
                  controller: controller.etanolController,
                  inputFormatters: [controller.textMask],
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Color(0xFF61BC52),
                  ),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    prefixText: 'R\$ ',
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Valor Etanol',
                    suffixText: 'Etanol',
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
                Padding(padding: EdgeInsets.only(top: 16, bottom: 16)),
                TextFormField(
                  controller: controller.gasolinaController,
                  inputFormatters: [controller.textMask],
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Color(0xFF61BC52),
                  ),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    prefixText: 'R\$ ',
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Valor Gasolina',
                    suffixText: 'Gasolina',
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
                      controller.calculaCombustivel();
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
                Visibility(
                  visible: controller.textResultado.value.isNotEmpty,
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
                    child: ValueListenableBuilder(
                      valueListenable: controller.textResultado,
                      builder: (_, String value, __) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(
                                text: 'Abasteça\r',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                                children: [
                                  TextSpan(
                                    text: '$value',
                                    style: TextStyle(
                                      color: Color(0xFF61BC52),
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
                              'Neste momento é melhor abastecer com $value',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 13,
                                fontFamily: 'Poppins',
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
