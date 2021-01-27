
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_module/flurorouter/FlNavUtils.dart';
import 'package:my_module/flurorouter/FlRouter.dart';
import 'package:my_module/providers/counter.dart';
import 'package:my_module/providers/ui/base_screen.dart';
import 'package:my_module/providers/viewmodels/counter_view_model.dart';
import 'package:provider/provider.dart';
import 'package:scroll_page_view/scroll_page.dart';
import 'package:scroll_page_view/pager/page_controller.dart';
import 'package:scroll_page_view/pager/scroll_page_view.dart';


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
              Container(
                child: TextButton(
                  onPressed: (){
                    FlNavUtils.navigateTo(context, FlRoutes.providerPageViewModel);
                  },
                  child: Text("go to viewmodel"),
                ),
              ),

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
