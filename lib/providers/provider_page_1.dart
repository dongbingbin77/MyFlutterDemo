
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_module/providers/counter.dart';
import 'package:provider/provider.dart';


class ProviderPage1 extends StatelessWidget {
  static String routeName = "ProviderPage1";

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>Counter(1)),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text("Provider Page 1"),
        ),
        body: Center(
          child: ListView(
            children: [
              Consumer<Counter>(
                builder: (context,model,child){
                  return Container(
                    child: Text("结果:${model.count},${model.viewState}"),
                  );
                },
              ),
              Consumer<Counter>(
                builder: (context,model,child){
                  return Container(
                    child: TextButton(
                      onPressed: () {
                        model.add();
                      },
                      child: Text("加"),
                    ),
                  );
                },

              ),
              ReduceWidget(),
            ],
          ),
        ),
      ),
    );
  }

}

class ReduceWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    Counter counter = Provider.of<Counter>(context,listen: false);
    return Container(
      child: TextButton(
        onPressed: () {

          counter.reduce();
        },
        child: Text("减 ${counter.count}"),
      ),
    );
  }
}
