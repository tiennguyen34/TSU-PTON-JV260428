let arr = ['h', 'e', '-', 'l', '-', 'l', 'o'];

for (let i = 0; i < arr.length; i++) {
    if (arr[i] === '-') {
        arr[i] = '_';
    }
}

console.log(arr.join('')); 