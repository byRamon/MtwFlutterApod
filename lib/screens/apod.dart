import 'package:flutter/cupertino.dart';
import 'package:apod_app/models/ApodImage.dart';
import 'package:apod_app/providers/apod_provider.dart';
import 'package:apod_app/views/card.dart';

class Apod extends StatefulWidget {
  Apod({Key key}) : super(key: key);

  @override
  _ApodState createState() => _ApodState();
}

class _ApodState extends State<Apod> {
  int selectedIndex = 0;
  List<Widget> childrens = List();
  @override
  void initState() {
    super.initState();
    childrens.add(apodRecentList());
    childrens.add(apodRandomList());
    childrens.add(Text('saved'));
  }
  final _apodProvider = ApodProvider();
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Julio, 2020'),
              Row(
                children: <Widget>[
                  Expanded(child: Text('APOD')),
                  CupertinoButton(child: Icon(CupertinoIcons.refresh_thick),
                    onPressed: onRefresh,
                  )
                ]
              ),
              Container(height: 1, color: CupertinoColors.systemGrey5),
              SizedBox(height: 20,),
              Center(
                child: CupertinoSlidingSegmentedControl<int>(
                  children: {
                    0: Text('Recent'),
                    1: Text('Random'),
                    2: Text('Saved')
                  }, 
                  onValueChanged: onValueChange,
                  groupValue: selectedIndex,
                ),
              ),
              SizedBox(height: 20,),
              Expanded(
                child: childrens[selectedIndex]
              )
            ],
          ),
        ),
      )
    );
  }
  void onValueChange(int value) => setState(() => selectedIndex = value);
  void onRefresh() => setState(() => childrens[1] = apodRecentList());
  
  Widget apodRecentList(){
    return FutureBuilder(
      future: _apodProvider.getRecentImages(),
      builder: (BuildContext context, AsyncSnapshot<List<ApodImage>> snapshot){
        if(snapshot.hasData) 
          return _cardList(snapshot.data);
        else return Center(
          child : CupertinoActivityIndicator()
        );
      } 
    );
  }
  Widget apodRandomList(){
    return FutureBuilder(
      future: _apodProvider.getRandomImages(),
      builder: (BuildContext context, AsyncSnapshot<List<ApodImage>> snapshot){
        if(snapshot.hasData) 
          return _cardList(snapshot.data);
        else return Center(
          child : CupertinoActivityIndicator()
        );
      } 
    );
  }
  Widget _cardList(List<ApodImage> list){
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index){
        return CupertinoCard(
          apodImage: list[index],
          onPressed: () => print('hola'),
          icon: CupertinoIcons.heart_solid,
        );
      }
    );
  }
}