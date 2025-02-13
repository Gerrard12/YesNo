
import 'package:flutter/material.dart';
//comando para seleccionar colores
// se necesita el comando (0xFF)
const Color _customColor = Color(0xFF6320A1);
const List<Color> _colorThemes = [
_customColor,
Colors.blue,
Colors.green,
Colors.teal,
Colors.yellow,
Colors.orange,
Colors.pink,

];
//comando para seleccionar colores ya establecidos
class AppTheme{
  final int selectedColor;

  AppTheme({
    this.selectedColor = 0
    //comando para decir el error 
  }): assert(selectedColor >= 0 && selectedColor <= _colorThemes.length -1,
   'Colors must be between 0 and ${_colorThemes.length}');

  ThemeData theme(){
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor]
      
    );

  }

}