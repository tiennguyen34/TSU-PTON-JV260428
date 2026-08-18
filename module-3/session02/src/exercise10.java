import java.util.HashSet;
import java.util.Scanner;
import java.util.Set;

public class exercise10 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int n = scanner.nextInt();

        boolean first = true;
        for (int i = 1; i <= n; i++) {
            if (isHappy(i)) {
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

    private static boolean isHappy(int number) {
        Set<Integer> seen = new HashSet<>();
        while (number != 1 && !seen.contains(number)) {
            seen.add(number);
            int sum = 0;
            while (number > 0) {
                int digit = number % 10;
                sum += digit * digit;
                number /= 10;
            }
            number = sum;
        }
        return number == 1;
    }
}
