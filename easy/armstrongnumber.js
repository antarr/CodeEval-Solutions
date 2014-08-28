var fs  = require("fs");
fs.readFileSync(process.argv[2]).toString().split('\n').forEach(function (line) {
    if (line != "") {
       l = line.length;
       num = parseInt(line);
       sum = 0;
       for(x =0; x < l; x++){
          sum += Math.pow(parseInt(line.charAt(x)),l);
       }
       result = num == sum ? 'True' : 'False';
       console.log(result);
    }
});
