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

import 'dart:async';

import 'package:pscalc/domain/psclient.dart';

class CalculateModel {
  StreamController<PSClient> clientChanged;

  CalculateModel() {
    clientChanged = StreamController<PSClient>();
    clientChanged.add(null);
  }

  String validateYear(String value) {
    int year;
    try {
      year = int.parse(value);
    } catch (e) {
      return "Неверный формат";
    }
    if (year < 0 || year > 90) {
      return "от 0 до 90";
    }
    return null;
  }

  String validateMonths(String value) {
    int intVal;
    try {
      intVal = int.parse(value);
    } catch (e) {
      return "Неверный формат";
    }
    if (intVal < 0 || intVal > 11) {
      return "от 0 до 11";
    }
    return null;
  }

  void createClient(String ageY, String ageM, String separY, String separM,
      String diagY, String diagM) {
    final client = PSClient()
      ..ageYears = int.parse(ageY)
      ..ageMonths = int.parse(ageM)
      ..separYears = int.parse(separY)
      ..separMonths = int.parse(separM)
      ..diagYears = int.parse(diagY)
      ..diagMonths = int.parse(diagM);
    if (validateClient(client)) {
      saveClient(client);
    }
  }

  bool validateClient(PSClient client) {
    return true;
  }

  void saveClient(PSClient client) {
    clientChanged.add(client);
  }
}
