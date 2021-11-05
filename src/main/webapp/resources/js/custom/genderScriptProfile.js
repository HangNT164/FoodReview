window.onload = function () {
    var g = $('#hiddenG').val ();
    if(g == 0 || g=="false"){
        document.getElementById("genderName").innerHTML = "Male";
    }
    if(g == 1 || g=="true"){
        document.getElementById("genderName").innerHTML = "Female";
    }
    if(g == 2){
        document.getElementById("genderName").innerHTML = "Other";
    }
}