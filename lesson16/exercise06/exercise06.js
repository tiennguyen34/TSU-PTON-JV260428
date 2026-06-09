function sumArray(arr) {
    return arr.reduce((sum, current) => sum + current, 0);
}

const arr1 = [1, 2, 3, 4, 5, 6];
const arr2 = [10, 20, 30, 40, 50];
const arr3 = [1, 3, 5, 7, 9];

console.log(sumArray(arr1)); 
console.log(sumArray(arr2)); 
console.log(sumArray(arr3)); 