function generateName() {
	//var json = $.getJSON({'url': "./data/namedatabase.json", 'async': false});
	//var database = JSON.parse(json.responseText);
	
	var database;
	
	$.ajax({
         url: "data/namedatabase.json",
         async: false,
         dataType: 'json',
         success: function(response) {
			database = response.items;
		}
	});
	
	console.log(database);
	
    var res = document.getElementById("namegenresult");
	res.innerHTML = "Success!";
}