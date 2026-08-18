import java.util.Scanner;

public class exercise08 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        int n = scanner.nextInt();

        if (n < 100 || n > 999) {
            System.out.println("Số nhập vào không hợp lệ");
        } else {
            int hundreds = n / 100;
            int tens = (n % 100) / 10;
            int units = n % 10;

            String result = "";

            switch (hundreds) {
                case 1: result += "Một trăm"; break;
                case 2: result += "Hai trăm"; break;
                case 3: result += "Ba trăm"; break;
                case 4: result += "Bốn trăm"; break;
                case 5: result += "Năm trăm"; break;
                case 6: result += "Sáu trăm"; break;
                case 7: result += "Bảy trăm"; break;
                case 8: result += "Tám trăm"; break;
                case 9: result += "Chín trăm"; break;
            }

            if (tens == 0 && units != 0) {
                result += " lẻ";
            } else if (tens == 1) {
                result += " mười";
            } else if (tens > 1) {
                switch (tens) {
                    case 2: result += " hai mươi"; break;
                    case 3: result += " ba mươi"; break;
                    case 4: result += " bốn mươi"; break;
                    case 5: result += " năm mươi"; break;
                    case 6: result += " sáu mươi"; break;
                    case 7: result += " bảy mươi"; break;
                    case 8: result += " tám mươi"; break;
                    case 9: result += " chín mươi"; break;
                }
            }

            if (units != 0) {
                if (units == 5 && tens != 0) {
                    result += " lăm";
                } else {
                    switch (units) {
                        case 1: result += " một"; break;
                        case 2: result += " hai"; break;
                        case 3: result += " ba"; break;
                        case 4: result += " bốn"; break;
                        case 5: result += " năm"; break;
                        case 6: result += " sáu"; break;
                        case 7: result += " bảy"; break;
                        case 8: result += " tám"; break;
                        case 9: result += " chín"; break;
                    }
                }
            }

            System.out.println(result.trim());
        }

        scanner.close();
    }
}
