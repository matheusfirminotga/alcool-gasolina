import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF61BC52),
        title: Text(
          'Álcool ou Gasolina',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Color(0xFFF4F4F4),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
            onTap: () {
              debugPrint('alcool ou gasolina');
            },
            child: Container(
              margin: EdgeInsets.only(top: 5, left: 10, bottom: 5, right: 5),
              height: 150,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Color(0xFFFFFFFF),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Icon(
                      Icons.local_gas_station,
                      size: 120,
                      color: Color(0xFF61BC52).withOpacity(0.10),
                    ),
                    Text(
                      'Álcool ou Gasolina?',
                      style: TextStyle(
                        color: Color(0xFF61BC52),
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              debugPrint('calcular media');
            },
            child: Container(
              margin: EdgeInsets.only(left: 10, bottom: 5, right: 5),
              height: 150,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Color(0xFFFFFFFF),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Icon(
                      Icons.trending_up,
                      size: 120,
                      color: Color(0xFF61BC52).withOpacity(0.10),
                    ),
                    Text(
                      'Calcular Média',
                      style: TextStyle(
                        color: Color(0xFF61BC52),
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
