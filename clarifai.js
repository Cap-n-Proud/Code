const Clarifai = require('clarifai');
fs = require('fs')
var sys = require('sys')
var exec = require('child_process').exec;
// initialize with your api key. This will also work in your browser via http://browserify.org/
var settings = require("./settings.json");
/*
settings.json
{
"ClarifaiAPIKey":"API_KEY"
}

*/
var test = require("./myjsonfile2.json");
const app = new Clarifai.App({
	apiKey: settings.ClarifaiAPIKey
});
//console.log(test);
//console.log(JSON.stringify(test.outputs[0].data.concepts[1].name));
//  console.log(data);
var iptcarguments = '-q -a Keywords -v ';
// iptc -m Keywords -v "vacatiodn, kjjljl" ./test.jpg
var glob = require("glob")

function getFiles(dir, files_) {
	files_ = files_ || [];
	var files = fs.readdirSync(dir);
	for (var i in files) {
		var name = dir + '/' + files[i];
		if (fs.statSync(name).isDirectory()) {
			getFiles(name, files_);
		} else {
			files_.push(name);
		}
	}
	return files_;
}
     
function predict(data, fname) {
app.models.predict(Clarifai.GENERAL_MODEL, {base64: data}).then(
		function(response) {
			//response.fname = f[j];
			response.time = new Date().toJSON();
			for (var i = 0; i < response.outputs[0].data.concepts.length; i++) {
				require('child_process').execSync('iptc ' + iptcarguments + ' "' + response.outputs[0].data.concepts[i].name + '" ' + '"' + fname + '"')
console.log('iptc ' + iptcarguments + ' "' + response.outputs[0].data.concepts[i].name + '" ' + '"' + fname + '"');
				//console.log(fname + response.outputs[0].data.concepts[i].name + ' saved');
				tag = tag + ', ' + response.outputs[0].data.concepts[i].name;
			}
			//console.log(fname + ': ' + tag);
			fs.writeFileSync('./json/' + path.basename(fname) + '.json', JSON.stringify(response));
		},
		function(err) {
			//console.log(err);
		}
	);

}


//for (var findex = 5; findex < 9; findex++) {//

var f = getFiles('/media/paolo/5405E9AD475855DE1/Photos/000-InstantUpload/photo7');


console.log(f.length)
for (var j = 0; j < f.length; j++) {
	var fname = f[j];
	var tag = "";
try {
var data = fs.readFileSync(fname, 'base64');
	predict(data, fname);

} catch (err) {
	console.log(err);
  // Here you get the error when the file was not found,
  // but you also get any other error
}	


	//console.log('processing ' + j + ' of ' + f.length);
	//console.log(j + 'read ' + fname);

	
};
//};
