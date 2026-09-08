import java.util.Scanner;
import java.util.ArrayList;

public class exercise07 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        int n = scanner.nextInt();
        if (n <= 0) {
            System.out.println("Mảng không hợp lệ");
            return;
        }

        int[] arr = new int[n];
        for (int i = 0; i < n; i++) {
            arr[i] = scanner.nextInt();
        }

        ArrayList<Integer> uniqueList = new ArrayList<>();
        for (int i = 0; i < n; i++) {
            int count = 0;
            for (int j = 0; j < n; j++) {
                if (arr[i] == arr[j]) {
                    count++;
                }
            }
            if (count == 1) {
                uniqueList.add(arr[i]);
            }
        }

        if (uniqueList.isEmpty()) {
            System.out.println("Không có phần tử nào duy nhất trong mảng");
        } else {
            System.out.print("[");
            for (int i = 0; i < uniqueList.size(); i++) {
                System.out.print(uniqueList.get(i));
                if (i < uniqueList.size() - 1) {
                    System.out.print(", ");
                }
            }
            System.out.println("]");
        }

        scanner.close();
    }
}