function generateName() {
	var json = $.getJSON({'url': "./data/namedatabase.json", 'async': false});
	var database = JSON.parse(json.responseText);
	
	console.log(database);
	
    var res = document.getElementById("namegenresult");
	res.innerHTML = "Success!";
}