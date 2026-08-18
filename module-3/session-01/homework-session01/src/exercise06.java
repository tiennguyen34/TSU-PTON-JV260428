import java.util.Locale;
import java.util.Scanner;

public class exercise06 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in).useLocale(Locale.US);
        float width;
        float height;
        System.out.print("Nhập chiều rộng (width): ");
        width = scanner.nextFloat();
        System.out.print("Nhập chiều cao (height): ");
        height = scanner.nextFloat();
        float area = width * height;
        float circumference = 2 * (width + height);
        System.out.printf("Diện tích : %.2f\n", area);
        System.out.printf("Chu vi : %.2f\n", circumference);

        scanner.close();
    }
}
