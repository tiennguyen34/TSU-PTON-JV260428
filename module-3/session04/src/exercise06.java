import java.util.Arrays;
import java.util.Scanner;

public class exercise06  {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Nhập kích thước mảng: ");
        int n = scanner.nextInt();

        int[] arr = new int[n];
        System.out.println("Nhập các phần tử cho mảng:");
        for (int i = 0; i < n; i++) {
            arr[i] = scanner.nextInt();
        }

        System.out.print("Nhập số cần tìm: ");
        int target = scanner.nextInt();

        for (int i = 0; i < n - 1; i++) {
            int maxIdx = i;
            for (int j = i + 1; j < n; j++) {
                if (arr[j] > arr[maxIdx]) {
                    maxIdx = j;
                }
            }
            int temp = arr[maxIdx];
            arr[maxIdx] = arr[i];
            arr[i] = temp;
        }

        System.out.println("Mảng sau khi sắp xếp theo thứ tự giảm dần: " + Arrays.toString(arr));

        int linearResult = linearSearch(arr, target);
        if (linearResult != -1) {
            System.out.println("Tìm kiếm tuyến tính: Phần tử " + target + " tìm thấy tại chỉ số: " + linearResult);
        } else {
            System.out.println("Tìm kiếm tuyến tính: Không tìm thấy phần tử " + target);
        }

        int binaryResult = binarySearchDescending(arr, target);
        if (binaryResult != -1) {
            System.out.println("Tìm kiếm nhị phân: Phần tử " + target + " tìm thấy tại chỉ số: " + binaryResult);
        } else {
            System.out.println("Tìm kiếm nhị phân: Không tìm thấy phần tử " + target);
        }

        scanner.close();
    }

    public static int linearSearch(int[] arr, int target) {
        for (int i = 0; i < arr.length; i++) {
            if (arr[i] == target) {
                return i;
            }
        }
        return -1;
    }

    public static int binarySearchDescending(int[] arr, int target) {
        int left = 0;
        int right = arr.length - 1;

        while (left <= right) {
            int mid = left + (right - left) / 2;

            if (arr[mid] == target) {
                return mid;
            }

            if (arr[mid] < target) {
                right = mid - 1;
            } else {
                left = mid + 1;
            }
        }

        return -1;
    }
}