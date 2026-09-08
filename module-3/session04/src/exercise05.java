import java.util.Scanner;

public class exercise05 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Nhập số hàng: ");
        int rows = scanner.nextInt();
        System.out.print("Nhập số cột: ");
        int cols = scanner.nextInt();

        int[][] matrix = new int[rows][cols];
        System.out.println("Nhập các phần tử cho mảng (theo từng hàng):");
        for (int i = 0; i < rows; i++) {
            System.out.print("Hàng " + (i + 1) + ": ");
            for (int j = 0; j < cols; j++) {
                matrix[i][j] = scanner.nextInt();
            }
        }

        int sumEven = 0;
        int sumOdd = 0;

        for (int i = 0; i < rows; i++) {
            for (int j = 0; j < cols; j++) {
                if (matrix[i][j] % 2 == 0) {
                    sumEven += matrix[i][j];
                } else {
                    sumOdd += matrix[i][j];
                }
            }
        }

        System.out.println("Tổng các số chẵn là: " + sumEven);
        System.out.println("Tổng các số lẻ là: " + sumOdd);

        scanner.close();
    }
}