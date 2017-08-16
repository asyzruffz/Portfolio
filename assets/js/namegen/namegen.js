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

getJSON("https://asyzruffz.github.io/Portfolio/data/namedatabase.json", function(err, data) {
	if (err != null) {
		alert("Something went wrong: " + err);
	} else {
		generateName(data);
	}
});

function generateName(database) {
	//console.log(database);
	
    var res = document.getElementById("namegenresult");
	res.innerHTML = "Success!";
}