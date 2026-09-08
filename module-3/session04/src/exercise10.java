import java.util.Scanner;
import java.util.ArrayList;
import java.util.Collections;

public class exercise10 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        ArrayList<Integer> arr = new ArrayList<>();

        while (true) {
            System.out.println("====== MENU ======");
            System.out.println("1. Thêm một phần tử vào mảng");
            System.out.println("2. Xóa một phần tử trong mảng theo chỉ số (index)");
            System.out.println("3. Hiển thị mảng");
            System.out.println("4. Sắp xếp mảng theo giá trị giảm dần");
            System.out.println("5. Tìm kiếm một phần tử trong mảng");
            System.out.println("6. Thoát");
            System.out.print("Lựa chọn của bạn: ");

            int chon = scanner.nextInt();

            if (chon == 1) {
                System.out.print("Nhập số nguyên cần thêm: ");
                int value = scanner.nextInt();
                arr.add(value);
                System.out.println("Đã thêm " + value + " vào mảng.");
            }
            else if (chon == 2) {
                if (arr.isEmpty()) {
                    System.out.println("Mảng rỗng, không thể xóa!");
                } else {
                    System.out.print("Nhập chỉ số (index) cần xóa (0 đến " + (arr.size() - 1) + "): ");
                    int index = scanner.nextInt();
                    if (index >= 0 && index < arr.size()) {
                        int removed = arr.remove(index);
                        System.out.println("Đã xóa phần tử " + removed + " tại chỉ số " + index);
                    } else {
                        System.out.println("Chỉ số không hợp lệ!");
                    }
                }
            }
            else if (chon == 3) {
                if (arr.isEmpty()) {
                    System.out.println("Mảng rỗng: []");
                } else {
                    System.out.println("Các phần tử trong mảng: " + arr);
                }
            }
            else if (chon == 4) {
                if (arr.isEmpty()) {
                    System.out.println("Mảng rỗng, không thể sắp xếp!");
                } else {
                    Collections.sort(arr, Collections.reverseOrder());
                    System.out.println("Mảng sau khi sắp xếp giảm dần: " + arr);
                }
            }
            else if (chon == 5) {
                System.out.print("Nhập số nguyên cần tìm: ");
                int target = scanner.nextInt();
                if (arr.contains(target)) {
                    System.out.print("Phần tử " + target + " tồn tại ở chỉ số: ");
                    for (int i = 0; i < arr.size(); i++) {
                        if (arr.get(i) == target) {
                            System.out.print(i + " ");
                        }
                    }
                    System.out.println();
                } else {
                    System.out.println("Phần tử " + target + " không tồn tại trong mảng.");
                }
            }
            else if (chon == 6) {
                System.out.println("Kết thúc chương trình.");
                break;
            }
            else {
                System.out.println("Lựa chọn không hợp lệ! Vui lòng chọn lại.");
            }
            System.out.println();
        }
        scanner.close();
    }
}