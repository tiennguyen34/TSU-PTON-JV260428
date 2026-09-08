import java.util.Scanner;
public class exercise03 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int soNhanVien = 0;
        double tongLuong = 0;
        double luongCaoNhat = 0;
        double luongThapNhat = 500000000;
        double tongTienThuong = 0;

        while (true) {
            System.out.println("========= MENU =========");
            System.out.println("1. Nhập lương nhân viên");
            System.out.println("2. Hiển thị thống kê");
            System.out.println("3. Tính tổng số tiền thưởng cho nhân viên");
            System.out.println("4. Thoát");
            System.out.print("Lựa chọn của bạn: ");

            int chon = scanner.nextInt();

            if (chon == 1) {
                System.out.println("\n--- Nhập lương nhân viên (nhập -1 để kết thúc) ---");
                while (true) {
                    System.out.print("Nhập lương: ");
                    double luong = scanner.nextDouble();
                    if (luong == -1) {
                        break;
                    }
                    if (luong < 0 || luong > 500000000) {
                        System.out.println("Lương không hợp lệ. Nhập lại.");
                        continue;
                    }

                    String phanLoai = "";
                    double phanTrandThuong = 0;

                    if (luong < 5000000) {
                        phanLoai = "Thấp";
                    } else if (luong <= 15000000) {
                        phanLoai = "Trung bình";
                    } else if (luong <= 50000000) {
                        phanLoai = "Khá";
                    } else {
                        phanLoai = "Cao";
                    }

                    if (luong < 5000000) {
                        phanTrandThuong = 0.05;
                    } else if (luong < 15000000) {
                        phanTrandThuong = 0.10;
                    } else if (luong < 50000000) {
                        phanTrandThuong = 0.15;
                    } else if (luong < 100000000) {
                        phanTrandThuong = 0.20;
                    } else {
                        phanTrandThuong = 0.25;
                    }

                    System.out.println("-> Phân loại: " + phanLoai);

                    tongLuong += luong;
                    tongTienThuong += luong * phanTrandThuong;

                    if (soNhanVien == 0) {
                        luongCaoNhat = luong;
                        luongThapNhat = luong;
                    } else {
                        if (luong > luongCaoNhat) luongCaoNhat = luong;
                        if (luong < luongThapNhat) luongThapNhat = luong;
                    }
                    soNhanVien++;
                }

            } else if (chon == 2) {
                System.out.println("\n--- Thống kê ---");
                if (soNhanVien == 0) {
                    System.out.println("Chưa có dữ liệu");
                } else {
                    double luongTrungBinh = tongLuong / soNhanVien;
                    System.out.println("Số nhân viên: " + soNhanVien);
                    System.out.printf("Tổng lương: %,.0f VND\n", tongLuong);
                    System.out.printf("Lương trung bình: %,.0f VND\n", luongTrungBinh);
                    System.out.printf("Lương cao nhất: %,.0f VND\n", luongCaoNhat);
                    System.out.printf("Lương thấp nhất: %,.0f VND\n", luongThapNhat);
                }

            } else if (chon == 3) {
                System.out.println("\n--- Tính tổng số tiền thưởng nhân viên ---");
                System.out.printf("Tổng tiền thưởng nhân viên: %,.0f VND\n", tongTienThuong);

            } else if (chon == 4) {
                System.out.println("Kết thúc chương trình.");
                System.exit(0);
            } else {
                System.out.println("Lựa chọn không hợp lệ! Vui lòng chọn lại.");
            }
            System.out.println();
        }
    }
}
