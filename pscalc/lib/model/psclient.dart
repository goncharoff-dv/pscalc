/*Copyright 2020 Dmitrii Goncharov

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.*/

import 'package:flutter/cupertino.dart';

class PSClient extends ChangeNotifier {
  DateTime _birthDate;
  DateTime _separateDate;
  DateTime _diagnosisDate;
  DateTime _renoDotDate;
  String ageYears;
  String ageMonths;
  String separYears;
  String separMonths;
  String diagYears;
  String diagMonths;
  bool ready = false;

  String validateAgeYears(String value) {
    int year;
    try {
      year = int.parse(value);
    } catch (e) {
      return "Неверный формат";
    }
    return _validateYear(year);
  }

  String validateAgeMonths(String value) {
    return _validateMonths(value);
  }

  String validateDiagnosisYears(String value) {
    int year;
    try {
      year = int.parse(value);
    } catch (e) {
      return "Неверный формат";
    }
    String res = _validateYear(year);
    if (res != null) return res;
    int ageYear = int.parse(ageYears);
    if (ageYear < year) return "Должно быть меньше возраста";
    return null;
  }

  String _validateYear(int year) {
    if (year < 0 || year > 199) {
      return "Допустимый диапазон от 0 до 199";
    }
    return null;
  }

  String _validateMonths(String value) {
    int intVal;
    try {
      intVal = int.parse(value);
    } catch (e) {
      return "Неверный формат";
    }
    if (intVal < 0 || intVal > 11) {
      return "Допустимый диапазон от 0 до 11";
    }
    return null;
  }

  void save() {
    ready = true;
    notifyListeners();
  }
}
