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

import 'package:flutter/material.dart';
import 'package:pscalc/domain/psclient.dart';
import 'package:pscalc/model/calculate_model.dart';

class ResultView extends StatefulWidget {
  final CalculateModel model;

  const ResultView({Key key, this.model}) : super(key: key);

  @override
  State<ResultView> createState() {
    return ResultViewState(model);
  }
}

class ResultViewState extends State<ResultView> {
  final CalculateModel model;

  ResultViewState(this.model);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PSClient>(
      initialData: null,
      stream: model.clientChanged.stream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.hasData) {
            print('snapshot ${snapshot.data.ageYears}');
            return Text(snapshot.data.ageYears.toString());
          } else {
            return Text("data");
          }
        }
        return Container();
      },
    );
  }
}
