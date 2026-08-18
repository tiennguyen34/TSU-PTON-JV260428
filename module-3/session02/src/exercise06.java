import java.util.Scanner;

public class exercise06 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        int n = scanner.nextInt();
        int temp = Math.abs(n);
        int tong = 0;

        while (temp > 0) {
            tong += temp % 10;
            temp /= 10;
        }

        System.out.println("Tổng các chữ số là: " + tong);

        scanner.close();
    }
}
