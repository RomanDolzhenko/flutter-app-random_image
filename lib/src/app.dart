import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'models/image_model.dart';
import 'witgets/image_list.dart';
import 'dart:math' show Random;

class App extends StatefulWidget{
  createState() {
    return AppState();
  }
}

class AppState extends State<App>{
	List<ImageModel> images = [];

	void fetchImage() async {
		var randomizer = new Random();
		var num = randomizer.nextInt(1084);

		var response 	= await get('https://picsum.photos/id/${num}/info');
		var imageModel 	= ImageModel.fromJson(json.decode(response.body));

		setState(() {
		  images.add(imageModel);
		});
	}

	Widget build(BuildContext context) {
		return MaterialApp(
			home: Scaffold(
				body: ImageList(images),
				floatingActionButton: FloatingActionButton(
					child: Icon(Icons.accessible_forward),
					onPressed: fetchImage,
				),
				appBar: AppBar(
					title: Text('Here we go'),
				),
			),
		);
	}

}