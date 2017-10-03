var category = [];
var brand = [];
var codes = [];

function handleFiles(files) {
    // Check for the various File API support.
    if (window.FileReader) {
        // FileReader are supported.
        getAsText(files[0]);
    } else {
        alert('FileReader are not supported in this browser.');
    }
}

function getAsText(fileToRead) {
    var reader = new FileReader();
    // Handle errors load
    reader.onload = loadHandler;
    reader.onerror = errorHandler;
    // Read file into memory as UTF-8      
    reader.readAsText(fileToRead);
}

function loadHandler(event) {
    var csv = event.target.result;
    processData(csv);
}

function processData(csv) {
    var allTextLines = csv.split(/\r\n|\n/);
    var lines = [];
    while (allTextLines.length) {
        lines.push(allTextLines.shift().split(','));
    }
    for (var i = 1; i < lines.length - 1; i++) {
        category.push(lines[i][3]);
        brand.push(lines[i][4]);
        codes.push(lines[i][1]);


    }
    console.log(brand.unique());
    console.log(category.unique());
    console.log(codes.unique());


    drawOutput(lines);
}

function errorHandler(evt) {
    if (evt.target.error.name == "NotReadableError") {
        alert("Canno't read file !");
    }
}

function drawOutput(lines) {
    //Clear previous data
    document.getElementById("output").innerHTML = "";
    var table = document.createElement("table");
    var header = table.createTHead();
    var row = header.insertRow(0);

    for (var i = 0; i < lines[0].length; i++) {
        var item = document.createElement('th');
        row.appendChild(item);
        item.appendChild(document.createTextNode(lines[0][i]));

    }


    var tbody = table.createTBody();
    for (var i = 1; i < lines.length - 1; i++) {
        var row = tbody.insertRow(-1);
        for (var j = 0; j < lines[i].length; j++) {
            var firstNameCell = row.insertCell(-1);
            firstNameCell.appendChild(document.createTextNode(lines[i][j]));
        }
    }
    table.className = 'table table-striped mitabla';


    document.getElementById("output").appendChild(table);

    change();
}


function change() {


    $('.mitabla').DataTable({
        scrollY: '50vh',
        scrollCollapse: true,
        paging: false,
        "searching": false,
        bSort: false,
        fixedHeader: {
            header: false
        }


    });
}

function chargeData() {
    $.post("/lotes/category/",{values: brand.unique()} , function (data) {
        alert(data);
    });
}



Array.prototype.unique = function (a) {
    return function () { return this.filter(a) }
}(function (a, b, c) {
    return c.indexOf(a, b + 1) < 0
});
