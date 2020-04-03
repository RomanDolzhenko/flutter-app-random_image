class ImageModel{
	int id;
	String author;
	String url;

	ImageModel(this.id, this.author, this.url);

	ImageModel.fromJson(Map<String, dynamic> parsedJson){
		id 		= int.parse(parsedJson['id']);
		author 	= parsedJson['author'];
		url 	= parsedJson['download_url'];
	}

}