
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_module/providers/counter.dart';
import 'package:my_module/providers/provider_page_1.dart';
import 'package:my_module/providers/ui/base_screen.dart';
import 'package:my_module/providers/viewmodels/counter_view_model.dart';
import 'package:provider/provider.dart';


class ProviderPageViewModel extends StatelessWidget {
  static String routeName = "ProviderPageViewModel";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider Page View Model"),
      ),
      body: Center(
        child: ListView(
          children: [
            //Text("123"),
            // BaseScreen<CountViewModel>(
            //   onModelReady: (model)=> model.add(),
            //   builder: (context,model,child){
            //     return Container(
            //       child: Text("11 ${model.count} ${model.state}"),
            //     );
            //   },
            // ),
            BaseScreen<CountViewModel>(
              builder: (context,model,child){
                return Column(
                  children: [
                    Container(
                      child: Text("group1 ${model.count} ${model.state}"),
                    ),
                    Container(
                      child: TextButton(
                        onPressed: () {
                          model.add();
                        },
                        child: Text("group1 加 "),
                      ),
                    ),
                    Container(
                      child: TextButton(
                        onPressed: () {
                          model.reduce();
                        },
                        child: Text("group1 减 "),
                      ),
                    )
                  ],
                );
              },

            ),
            BaseScreen<CountViewModel>(
              builder: (context,model,child)=>
                  Column(
                    children: [
                      Container(
                        child: Text("group2 ${model.count} ${model.state}"),
                      ),
                      Container(
                        child: TextButton(
                          onPressed: () {
                            model.add();
                          },
                          child: Text("group2 加 "),
                        ),
                      ),
                      Container(
                        child: TextButton(
                          onPressed: () {
                            model.reduce();
                          },
                          child: Text("group2 减 "),
                        ),
                      )
                    ],
                  )
              ,

            ),

          ],
        ),
      ),
    );
  }

}

