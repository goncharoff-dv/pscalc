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
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pscalc/model/psclient.dart';

class FormView extends StatefulWidget {
  final PSClient model;

  const FormView({Key key, this.model}) : super(key: key);

  @override
  State<FormView> createState() {
    return FormViewState(model);
  }
}

class FormViewState extends State<FormView> {
  final PSClient model;
  final _formKey = GlobalKey<FormState>();
  final _ageYearController = TextEditingController();
  final _ageMonthController = TextEditingController();
  final _separYearController = TextEditingController();
  final _separMonthController = TextEditingController();
  final _diagYearController = TextEditingController();
  final _diagMonthController = TextEditingController();

  FormViewState(this.model);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(50),
      child: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text("Возраст: "),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Container(
                      width: 150,
                      child: TextFormField(
                        controller: _ageYearController,
                        decoration: const InputDecoration(labelText: "лет"),
                        maxLength: 3,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        textAlign: TextAlign.center,
                        validator: model.validateAgeYears,
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Container(
                      width: 150,
                      child: TextFormField(
                        controller: _ageMonthController,
                        decoration: const InputDecoration(labelText: "месяцев"),
                        maxLength: 2,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        textAlign: TextAlign.center,
                        validator: model.validateAgeMonths,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text("Сепарация: "),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Container(
                      width: 150,
                      child: TextFormField(
                        controller: _separYearController,
                        decoration: const InputDecoration(labelText: "лет"),
                        maxLength: 3,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        textAlign: TextAlign.center,
                        validator: model.validateAgeYears,
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Container(
                      width: 150,
                      child: TextFormField(
                        controller: _separMonthController,
                        decoration: const InputDecoration(labelText: "месяцев"),
                        maxLength: 2,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        textAlign: TextAlign.center,
                        validator: model.validateAgeMonths,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text("Диагноз: "),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Container(
                      width: 150,
                      child: TextFormField(
                        controller: _diagYearController,
                        decoration: const InputDecoration(labelText: "лет"),
                        maxLength: 3,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        textAlign: TextAlign.center,
                        validator: model.validateAgeYears,
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Container(
                      width: 150,
                      child: TextFormField(
                        controller: _diagMonthController,
                        decoration: const InputDecoration(labelText: "месяцев"),
                        maxLength: 2,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        textAlign: TextAlign.center,
                        validator: model.validateAgeMonths,
                      ),
                    ),
                  ],
                ),
              ),
              FlatButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    model.ageYears = _ageYearController.text;
                    model.ageMonths = _ageMonthController.text;
                    model.separYears = _separYearController.text;
                    model.separMonths = _separMonthController.text;
                    model.diagYears = _diagYearController.text;
                    model.diagMonths = _diagMonthController.text;
                    model.save();
                  }
                },
                child: Text(
                  'Рассчитать',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
