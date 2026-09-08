function displayNumbers() {
    let resultDiv = document.getElementById("result");
    let content = "";

    for (let i = 0; i <= 5; i++) {
        content += "The number is " + i + "<br>";
    }

    resultDiv.innerHTML = content;
}