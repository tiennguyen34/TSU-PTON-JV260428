import java.util.Scanner;
public class exercise02 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int soHocVien = 0;
        double tongDiem = 0;
        double diemCaoNhat = 0;
        double diemThapNhat = 10;

        while (true) {
            System.out.println("====== MENU ======");
            System.out.println("1. Nhập điểm học viên");
            System.out.println("2. Hiển thị thống kê");
            System.out.println("3. Thoát");
            System.out.print("Lựa chọn của bạn: ");

            int chon = scanner.nextInt();
            if (chon == 1) {
                System.out.println("\n--- Nhập điểm học viên (nhập -1 để dừng) ---");
                while (true) {
                    System.out.print("Nhập điểm: ");
                    double diem = scanner.nextDouble();
                    if (diem == -1) {
                        break;
                    }
                    if (diem < 0 || diem > 10) {
                        System.out.println("Điểm không hợp lệ. Nhập lại.");
                        continue;
                    }
                    String hocLuc = "";
                    if (diem >= 0 && diem < 5) {
                        hocLuc = "Yếu";
                    } else if (diem >= 5 && diem < 7) {
                        hocLuc = "Trung bình";
                    } else if (diem >= 7 && diem < 8) {
                        hocLuc = "Khá";
                    } else if (diem >= 8 && diem < 9) {
                        hocLuc = "Giỏi";
                    } else if (diem >= 9) {
                        hocLuc = "Xuất sắc";
                    }
                    System.out.println("Học lực: " + hocLuc);
                    tongDiem += diem;
                    if (soHocVien == 0) {
                        diemCaoNhat = diem;
                        diemThapNhat = diem;
                    } else {
                        if (diem > diemCaoNhat) diemCaoNhat = diem;
                        if (diem < diemThapNhat) diemThapNhat = diem;
                    }
                    soHocVien++;
                }

            } else if (chon == 2) {
                System.out.println("\n--- KẾT QUẢ ---");
                if (soHocVien == 0) {
                    System.out.println("Chưa có dữ liệu");
                } else {
                    double diemTrungBinh = tongDiem / soHocVien;
                    System.out.println("Số học viên đã nhập: " + soHocVien);
                    System.out.printf("Điểm trung bình: %.2f\n", diemTrungBinh);
                    System.out.printf("Điểm cao nhất: %.2f\n", diemCaoNhat);
                    System.out.printf("Điểm thấp nhất: %.2f\n", diemThapNhat);
                }

            } else if (chon == 3) {
                System.out.println("Kết thúc chương trình.");
                break;
            } else {
                System.out.println("Lựa chọn không hợp lệ! Vui lòng chọn lại.");
            }
            System.out.println();
        }

        scanner.close();
    }
}
