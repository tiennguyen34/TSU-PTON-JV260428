let count = 0;
let num = 2;
let result = "20 số nguyên tố đầu tiên là:\n";

while (count < 20) {
    let isPrime = true;

    if (num < 2) {
        isPrime = false;
    } else {
        for (let i = 2; i <= Math.sqrt(num); i++) {
            if (num % i === 0) {
                isPrime = false;
                break;
            }
        }
    }

    if (isPrime) {
        result += num + " ";
        count++;
    }
    
    num++;
}

alert(result);