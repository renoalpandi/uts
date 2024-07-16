import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  //runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => MyAppState(),
        child: MaterialApp(
          title: 'belajar desain',
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          ),
          home: MyHomePage()
        ),
        );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
  void getNext(){
    current = WordPair.random();
    notifyListeners();
  }
  var favorites=<WordPair>[];
void toggleFavorite(){
  if(favorites.contains(current)){
    favorites.remove(current);
  } else { favorites.add(current);
  }
  notifyListeners();
}
}
class MyHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current; 
    IconData icon;
    if(
      appState.favorites.contains(pair)){
        icon = Icons.favorite_border;
      }else{
        icon = Icons.favorite;
      }
    
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text('Reno Alpandi:'),
          SizedBox(height: 20,),
          BigCard(pair: pair),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(onPressed: (){
                appState.toggleFavorite();
              }, child: Text("tekan saya")),
              ElevatedButton.icon(onPressed: (){
            appState.getNext();
          },  icon: Icon(icon),
            label:Text("favorite"),),
          
          
            ],

          ),
          
        ],


       
        
             ),
      ),
);
}


}

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.pair,
  });

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(pair.asLowerCase,style: TextStyle(color: Colors.white),),
    ),
);
}
}
