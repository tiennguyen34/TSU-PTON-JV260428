import java.util.Scanner;

public class exercise09 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        if (!scanner.hasNextInt()) {
            scanner.close();
            return;
        }

        int n = scanner.nextInt();

        if (n <= 0) {
            System.out.println("Mảng không hợp lệ");
            scanner.close();
            return;
        }

        int[] arr = new int[n];
        for (int i = 0; i < n; i++) {
            arr[i] = scanner.nextInt();
        }

        int maxSoFar = arr[0];
        int currentMax = 0;

        for (int i = 0; i < n; i++) {
            currentMax += arr[i];

            if (maxSoFar < currentMax) {
                maxSoFar = currentMax;
            }

            if (currentMax < 0) {
                currentMax = 0;
            }
        }

        if (maxSoFar < 0) {
            int maxNegative = arr[0];
            for (int i = 1; i < n; i++) {
                if (arr[i] > maxNegative) {
                    maxNegative = arr[i];
                }
            }
            maxSoFar = maxNegative;
        }

        System.out.println(maxSoFar);

        scanner.close();
    }
}