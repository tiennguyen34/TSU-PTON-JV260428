const userForm = {
    usernameValid: "huanrose@gmail.com",
    passwordValid: "123456"
};

document.getElementById("loginBtn").addEventListener("click", function() {
    let usernameInput = document.getElementById("username").value;
    let passwordInput = document.getElementById("password").value;

    if (usernameInput === userForm.usernameValid && passwordInput === userForm.passwordValid) {
        alert("Thông báo đăng nhập thành công");
    } else {
        alert("Thông báo đăng nhập thất bại");
    }
});