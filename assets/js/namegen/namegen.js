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
	getJSON("https://asyzruffz.github.io/Portfolio/data/namedatabase.json", function(err, data) {
		if (err != null) {
			alert("Something went wrong: " + err);
		} else {
			generate(data.database);
		}
	});
}

function generate(database) {
	
	var currentPrefix = {
		length: 2,
		value: ["*", "*"],
		add: function (suf) {
			for (i = 0; i < this.length - 1; i++) {
				this.value[i] = this.value[i + 1];
			}
			this.value[this.length - 1] = suf;
		},
		stringValue: function () {
			var str = "";
			for (i = 0; i < this.length; i++) {
				str = str + this.value[i];
			}
			return str;
		}
	};
	
    var currentSuffix = {
		value: "*"
	};
	
	var minCharacter = 4;
	var maxCharacter = 15;
	var outname = "";
	
	do {
		currentSuffix = getSuffixOf(currentPrefix, database);

		if (currentSuffix.value != "*") {
			outname = outname + currentSuffix.value;
		}

		currentPrefix.add (currentSuffix.value);
	} while (currentSuffix.value != "*" && outname.length < maxCharacter);
	
    var res = document.getElementById("namegenresult");
	res.innerHTML = outname;
}

function getSuffixOf(prefix, database) {
	var index = findIndex(database, prefix.stringValue());
	if (index != -1) {
		var multiplicitySum = sumAllMultiplicity(database[index].suffixes);
		var roll = Math.floor(Math.random() * multiplicitySum);

		var cumulative = 0;
		for (i = 0; i < database[index].suffixes.length; i++) {
			var suffix = database[index].suffixes[i];
			cumulative += suffix.multiplicity;

			if (roll < cumulative) {
				return suffix;
			}
		}
	}

	return "*";
}

function findIndex(database, prefix) {
	var index = -1;
	for (i = 0; i < database.length; i++) {
		if (database[i].prefix == prefix) {
			index = i;
			break;
		}
	}
	return index;
}

function sumAllMultiplicity(suffixes) {
	var sum = 0;
	for (i = 0; i < suffixes.length; i++) {
		sum = sum + suffixes[i].multiplicity;
	}
	return sum;
}