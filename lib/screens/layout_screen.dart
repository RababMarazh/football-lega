import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iraqligaapp/components/component.dart';
import 'package:iraqligaapp/cubit/cubit.dart';
import 'package:iraqligaapp/cubit/states.dart';
import 'package:iraqligaapp/screens/register_screen.dart';
import 'package:iraqligaapp/shared/icon_broken.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'container_curve.dart';

class LayoutModel {
  late final String? image;
  late final String? title;
  late final String? body;

  LayoutModel({this.image, this.title, this.body});
}

class Layout_Screen extends StatefulWidget {
  @override
  State<Layout_Screen> createState() => _Layout_ScreenState();
}

class _Layout_ScreenState extends State<Layout_Screen> {
  var layoutController = PageController();

  List<LayoutModel> layout = [
    LayoutModel(
        image: 'https://assets10.lottiefiles.com/packages/lf20_rs3afx1g.json',
        title: 'اعرف اخبار الدوري',
        body: ''),
    LayoutModel(
        image: 'https://assets7.lottiefiles.com/packages/lf20_jxraivdx.json',
        title: 'سوي الفريق الي يعجبك',
        body: ''),
    LayoutModel(
        image: 'https://assets7.lottiefiles.com/packages/lf20_DTf87D.json',
        title: 'توقع وربح',
        body: ''),
  ];
  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    ClipPath(
                      clipper: WaveClipperl(),
                      child: Container(
                        color: Colors.black,
                        height: 300,
                      ),
                    ),
                    ClipPath(
                      clipper: WaveClipperl(),
                      child: Container(
                        color: Colors.black,
                        height: 400,
                      ),
                    ),
                    ClipPath(
                      clipper: WaveClipperR(),
                      child: Container(
                        color: Colors.red,
                        height: 200,
                      ),
                    ),
                    ClipPath(
                      clipper: WaveClipperR(),
                      child: Container(
                        color: Colors.red,
                        height: 150,
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      child: Expanded(
                        child: PageView.builder(
                          physics: BouncingScrollPhysics(),
                          onPageChanged: (int index){
                            if(index ==layout.length -1){
                              setState(() {
                                isLast=true;
                              });
                            }else{
                              setState(() {
                                isLast=false;
                              });
                            }
                          },
                          controller: layoutController,
                          itemBuilder: (context, index) =>
                              PageItemBuilder(layout[index]),
                          itemCount: layout.length,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Row(
                  children: [
                    SmoothPageIndicator(
                      controller: layoutController,
                      count: layout.length,
                      effect: ExpandingDotsEffect(
                          dotColor: Colors.grey,
                          dotHeight: 10,
                          expansionFactor: 4,
                          dotWidth: 10,
                          spacing: 5.0,
                          activeDotColor: Colors.green),
                    ),
                    Spacer(),
                    FloatingActionButton(
                      onPressed: () {
                        if (isLast) {
                          navigateTo(context,RegisterScreen() ); 
                        }else{
                          layoutController.nextPage(
                            duration: Duration(microseconds: 750),
                            curve: Curves.fastLinearToSlowEaseIn);
                        }
                        
                      },
                      child: Icon(Icons.arrow_forward_ios),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

Widget PageItemBuilder(LayoutModel model) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          height: 20,
        ),
        Container(
          child: Lottie.network('${model.image}'),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            '${model.title}',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Jannah'),
          ),
        )
      ],
    );

  //Column(
        //   children: [
        //     Center(child: Lottie.network('https://assets7.lottiefiles.com/packages/lf20_wod9zucz.json')),
         
        //    // Container(height: 100,
        //    // width: 100,
        //      // child: Center(child: Lottie.network('https://assets7.lottiefiles.com/packages/lf20_at9xlec9.json'))),
        //   ],
       
        // )



            