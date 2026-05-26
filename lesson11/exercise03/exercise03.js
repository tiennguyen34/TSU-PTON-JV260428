function handleLogin() {
    let userName = prompt("Who's there?");

    if (userName === "Admin") {
        let password = prompt("Password?");

        if (password === "TheMaster") {
            alert("Welcome!");
        } else if (password === null || password === "") {
            alert("Canceled.");
        } else {
            alert("Wrong password");
        }

    } else if (userName === null || userName === "") {
        alert("Canceled");
    } else {
        alert("I don't know you");
    }
}