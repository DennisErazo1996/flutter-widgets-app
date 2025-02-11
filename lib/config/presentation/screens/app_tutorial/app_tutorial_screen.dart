import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class SlideInfo{
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(
    this.title,
    this.caption,
    this.imageUrl
  );

}

final slides = <SlideInfo>[

  SlideInfo(
    'Busca la comida', 
    'Magna ea eu sint reprehenderit velit. Incididunt irure id irure velit sit sit qui deserunt ullamco adipisicing. Exercitation anim nostrud voluptate dolore aliquip nulla sunt cillum magna amet aute sunt. Commodo ex cillum aute aliqua ea nostrud ea occaecat laboris. Ullamco ut Lorem exercitation ea adipisicing magna dolor non cillum labore. Ut incididunt mollit sunt exercitation.', 
    'assets/images/1.png'),
  SlideInfo(
    'Entrega rapida', 
    'Esse amet cillum consectetur elit. Occaecat aute culpa fugiat et. Nulla sunt eiusmod cupidatat laborum ex nostrud consequat qui. Aute ad enim in enim non ipsum non anim culpa id voluptate excepteur. Sit cillum labore cillum sint nulla eiusmod est officia sit consectetur. Commodo id ea minim ad sunt non nostrud culpa. Magna commodo consequat ex amet laborum sint reprehenderit.', 
    'assets/images/2.png'),
  SlideInfo(
    'Disfruta la comida', 
    'Culpa aute esse occaecat dolore esse anim Lorem ad laboris. Velit commodo dolor ullamco veniam ex laborum fugiat. Cillum consequat mollit laboris reprehenderit ipsum officia ullamco eu id laboris nisi. Non sit laboris ex eu qui sunt proident tempor amet aliquip excepteur aliquip. Et laborum aute irure sunt ullamco quis non occaecat minim.', 
    'assets/images/3.png'),

];

class AppTutorialScreen extends StatefulWidget {
  static const String name = 'app_tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {

  final PageController pageViewController = PageController();
  bool endReached =  false;
  

  @override
  void initState() {
    super.initState();
   
    pageViewController.addListener((){ 

      final page = pageViewController.page ?? 0;
      
      if(!endReached && page >= (slides.length - 1.5)){
        setState(() {
          endReached = true;
        });
      }
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [

          PageView(
            controller: pageViewController,
            physics: const BouncingScrollPhysics(),
            children: slides.map(
                (slidesData) => _Slide(
                  title: slidesData.title ,
                  caption: slidesData.caption ,
                  imageUrl: slidesData.imageUrl
                )
              ).toList()
          ),

          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              onPressed: () => context.pop(),
              child: const Text('Skip'))),

          endReached ? Positioned(
            bottom: 30,
            right: 30,
            child: FadeInRight(
              from: 15,
              delay: const Duration(seconds: 1),
              child: FilledButton(
                onPressed: () => context.pop(),
                child:  const Text('Comenzar'),
              ),
            )): const SizedBox()
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  
  final String title;
  final String caption;
  final String imageUrl;
  
  const _Slide(
    {required this.title, required this.caption, required this.imageUrl}
  );

  
  @override
  Widget build(BuildContext context) {  

    final theme = Theme.of(context);
    final titleStyle = theme.textTheme.titleLarge;
    final captionStyle = theme.textTheme.bodySmall;

    return  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              Image(
                image: AssetImage(imageUrl)
              ),
              const SizedBox(height: 20,),

              Text(title, style: titleStyle,),
              const SizedBox(height: 20,),

              Text(caption, style: captionStyle,)


            ],
          ),
        ),
      );
  }
}