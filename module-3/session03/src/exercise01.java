import java.util.Scanner;
public class exercise01 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("========= NHAP THONG TIN HOA DON =========");
        System.out.print("Nhập tên khách hàng: ");
        String tenKhachHang = scanner.nextLine();

        System.out.print("Nhập tên sản phẩm: ");
        String tenSanPham = scanner.nextLine();

        System.out.print("Nhập giá sản phẩm: ");
        double giaSanPham = scanner.nextDouble();

        System.out.print("Nhập số lượng mua: ");
        int soLuong = scanner.nextInt();

        System.out.print("Khách có thẻ thành viên? (true/false): ");
        boolean laThanhVien = scanner.nextBoolean();

        // --- TÍNH TOÁN ---
        double thanhTien = giaSanPham * soLuong;
        double giamGia = laThanhVien ? thanhTien * 0.10 : 0;
        double tienVat = thanhTien * 0.08;
        double tongThanhToan = thanhTien - giamGia + tienVat;

        // --- XUẤT HÓA ĐƠN ---
        System.out.println("\n========= HOA DON =========");
        System.out.println("Khách hàng: " + tenKhachHang);
        System.out.println("Sản phẩm  : " + tenSanPham);
        System.out.println("Số lượng  : " + soLuong);
        System.out.printf("Đơn giá   : %,.2f VND\n", giaSanPham);
        System.out.printf("Thành tiền: %,.2f VND\n", thanhTien);
        System.out.printf("Giảm giá thành viên (10%%): %,.2f VND\n", giamGia);
        System.out.printf("Tiền VAT (8%%): %,.2f VND\n", tienVat);
        System.out.printf("Tổng thanh toán: %,.2f VND\n", tongThanhToan);
        scanner.close();
    }
}
