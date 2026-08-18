import java.util.Scanner;

public class exercise09 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int n;

        while (true) {
            if (scanner.hasNextInt()) {
                n = scanner.nextInt();
                if (n > 0) {
                    break;
                }
            } else {
                scanner.next();
            }
            System.out.println("Số nhập vào không hợp lệ");
        }

        boolean first = true;
        for (int i = 0; i <= n; i++) {
            if (isArmstrong(i)) {
                if (!first) {
                    System.out.print(", ");
                }
                System.out.print(i);
                first = false;
            }
        }
        System.out.println();

        scanner.close();
    }

    private static boolean isArmstrong(int number) {
        if (number == 0) {
            return true;
        }

        int temp = number;
        int k = 0;
        while (temp > 0) {
            k++;
            temp /= 10;
        }

        temp = number;
        int sum = 0;
        while (temp > 0) {
            int digit = temp % 10;
            sum += Math.pow(digit, k);
            temp /= 10;
        }

        return sum == number;
    }
}
