import java.util.Scanner;

public class exercise04 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int age = 0;
        boolean isValid = false;

        while (!isValid) {
            String input = scanner.nextLine().trim();
            try {
                age = Integer.parseInt(input);
                if (age > 0) {
                    isValid = true;
                } else {
                    System.out.println("Vui lòng nhập vào một số nguyên và lớn hơn 0");
                }
            } catch (NumberFormatException e) {
                System.out.println("Vui lòng nhập vào một số nguyên và lớn hơn 0");
            }
        }

        System.out.println("Tuổi của bạn là " + age + " .");
        scanner.close();
    }
}
