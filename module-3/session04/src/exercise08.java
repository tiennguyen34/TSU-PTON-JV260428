import java.util.Arrays;
import java.util.Scanner;

public class exercise08 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Nhập kích thước n của ma trận vuông (n x n): ");
        int n = scanner.nextInt();

        if (n <= 0) {
            System.out.println("Ma trận không hợp lệ");
            scanner.close();
            return;
        }

        int[][] matrix = new int[n][n];
        System.out.println("Nhập các phần tử cho ma trận:");
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                matrix[i][j] = scanner.nextInt();
            }
        }

        for (int i = 0; i < n; i++) {
            for (int j = i + 1; j < n; j++) {
                int temp = matrix[i][j];
                matrix[i][j] = matrix[j][i];
                matrix[j][i] = temp;
            }
        }

        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n / 2; j++) {
                int temp = matrix[i][j];
                matrix[i][j] = matrix[i][n - 1 - j];
                matrix[i][n - 1 - j] = temp;
            }
        }

        System.out.println(Arrays.deepToString(matrix));

        scanner.close();
    }
}