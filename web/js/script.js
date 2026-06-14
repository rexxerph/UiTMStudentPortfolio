function validateForm() {
    var email = document.getElementById("email").value;
    var uitmEmailPattern = /^[a-zA-Z0-9._%+-]+@student\.uitm\.edu\.my$/;

    if (!uitmEmailPattern.test(email)) {
        alert("Please use a valid UiTM student email ending with @student.uitm.edu.my");
        return false;
    }

    alert("Your UiTM student portfolio is being generated!");
    return true;
}

function countCharacters() {
    var intro = document.getElementById("intro").value;
    document.getElementById("charCount").innerHTML = intro.length;
}
