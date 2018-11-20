import 'package:flutter/material.dart';
import 'package:text_drawable_widget/color_generator.dart';
import 'package:text_drawable_widget/text_drawable_widget.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Text Drawable Widget Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final List<String> contacts = [
    "Micky Mouse",
    "Donald Duck",
    "Bugs Bunny",
    "Scooby Doo",
    "SpongeBob",
    "Popeye",
    "Snoopy",
    "Goofy",
    "Jerry Mouse",
    "Tom Cat",
    "Fred Flintstone",
    "Harry Potter",
    "Spider man",
    "Batman",
    "Superman"
  ];

  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text Drawable Widget Demo"),
      ),
      body: _getContactCardsList(context, widget.contacts),
    );
  }

  Widget _getContactCardsList(BuildContext context, List<String> contacts) {
    return Container(
      margin: EdgeInsetsDirectional.only(start: 8.0, end: 8.0, top: 16.0, bottom: 8.0),
      child: ListView.builder(
        itemBuilder: (BuildContext context, int position) {
          if (position % 3 == 0) {
            return _getCardRowAlternate(context, contacts[position]);
          } else {
            return _getCardRow(context, contacts[position]);
          }
        },
        itemCount: contacts.length,
      ),
    );
  }

  Widget _getCardRow(BuildContext context, String data) {
    return Container(
      margin: EdgeInsets.only(bottom: 4.0),
      child: Card(
        child: InkWell(
          onTap: () {
            // do something
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                TextDrawableWidget(data, ColorGenerator.materialColors, (bool selected) {
                  // on tap callback
                }),
                SizedBox(width: 16.0),
                Expanded(
                  child: Text(data, style: Theme.of(context).textTheme.headline),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _getCardRowAlternate(BuildContext context, String data) {
    return Container(
      margin: EdgeInsets.only(bottom: 4.0),
      child: Card(
        child: InkWell(
          onTap: () {
            // do something
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                TextDrawableWidget(data, ColorGenerator.materialColors, (bool selected) {
                  // on tap callback
                  print("on tap callback");
                }, 60.0, 60.0, BoxShape.rectangle),
                SizedBox(width: 16.0),
                Expanded(
                  child: Text(data, style: Theme.of(context).textTheme.headline),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
