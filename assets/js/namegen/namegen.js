var getJSON = function(url, callback) {
    var xhr = new XMLHttpRequest();
    xhr.open('GET', url, true);
    xhr.responseType = 'json';
    xhr.onload = function() {
		var status = xhr.status;
		if (status == 200) {
			callback(null, xhr.response);
		} else {
			callback(status);
		}
    };
    xhr.send();
};

function generateName() {
	//var json = $.getJSON({'url': "./data/namedatabase.json", 'async': false});
	//var database = JSON.parse(json.responseText);
	
	var database;
	
	getJSON("https://asyzruffz.github.io/Portfolio/data/namedatabase.json", function(err, data) {
		if (err != null) {
			alert("Something went wrong: " + err);
		} else {
			database = data;
			console.log(data);
			alert("Your query count: " + data.query.count);
		}
	});
	
	/*$.ajax({
         url: "data/namedatabase.json",
         async: false,
         dataType: 'json',
         success: function(response) {
			database = response.items;
		}
	});*/
	
	console.log(database);
	
    var res = document.getElementById("namegenresult");
	res.innerHTML = "Success!";
}