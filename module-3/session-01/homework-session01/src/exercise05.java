import java.util.Scanner;

public class exercise05 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Nhập tử số phân số 1 (a): ");
        int a = scanner.nextInt();
        System.out.print("Nhập mẫu số phân số 1 (b): ");
        int b = scanner.nextInt();

        System.out.print("Nhập tử số phân số 2 (c): ");
        int c = scanner.nextInt();
        System.out.print("Nhập mẫu số phân số 2 (d): ");
        int d = scanner.nextInt();

        int tuSoTong = a * d + b * c;
        int mauSoTong = b * d;

        System.out.println("Kết quả : " + tuSoTong + "/" + mauSoTong);

        scanner.close();
    }
}
