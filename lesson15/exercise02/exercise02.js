let arr = ['a', '1', 'b', '2', 'c', '3', 'd'];

let count = 0;

for (let i = 0; i < arr.length; i++) {
    if (!isNaN(arr[i]) && arr[i] !== ' ') {
        count++;
    }
}

console.log("Số ký tự số:", count);