let bookList = [];
let loop = true;

while (loop) {
    let choice = prompt(
        "--- QUÁN LÝ SÁCH ---\n" +
        "1. Thêm sách mới\n" +
        "2. Hiển thị danh sách sách\n" +
        "3. Tìm kiếm sách theo tên\n" +
        "4. Xóa sách theo ID\n" +
        "5. Thoát chương trình\n" +
        "Nhập lựa chọn của bạn:"
    );

    switch (choice) {
        case "1":
            let id = prompt("Nhập ID sách:");
            let title = prompt("Nhập Tên sách:");
            let author = prompt("Nhập Tác giả:");
            let year = prompt("Nhập Năm xuất bản:");
            
            bookList.push({ id, title, author, year });
            alert(`Đã thêm sách "${title}" thành công!`);
            break;

        case "2":
            if (bookList.length === 0) {
                alert("Danh sách sách hiện đang trống!");
            } else {
                let result = "--- DANH SÁCH SÁCH ---\n";
                bookList.forEach((book, index) => {
                    result += `${index + 1}. ID: ${book.id} | Tên: ${book.title} | Tác giả: ${book.author} | Năm: ${book.year}\n`;
                });
                alert(result);
            }
            break;

        case "3":
            let keyword = prompt("Nhập từ khóa tên sách cần tìm:");
            if (!keyword) break;
            
            let foundBooks = bookList.filter(book => 
                book.title.toLowerCase().includes(keyword.toLowerCase())
            );

            if (foundBooks.length === 0) {
                alert(`Không tìm thấy sách nào chứa từ khóa: "${keyword}"`);
            } else {
                let result = `--- KẾT QUẢ TÌM KIẾM KHỚP VỚI "${keyword}" ---\n`;
                foundBooks.forEach((book, index) => {
                    result += `${index + 1}. ID: ${book.id} | Tên: ${book.title} | Tác giả: ${book.author} | Năm: ${book.year}\n`;
                });
                alert(result);
            }
            break;

        case "4":
            let deleteId = prompt("Nhập ID của sách cần xóa:");
            let index = bookList.findIndex(book => book.id === deleteId);

            if (index !== -1) {
                let removedBook = bookList.splice(index, 1);
                alert(`Đã xóa thành công sách: "${removedBook[0].title}" (ID: ${deleteId})`);
            } else {
                alert(`LỖI: Không tìm thấy sách nào có ID: ${deleteId} để xóa!`);
            }
            break;

        case "5":
            alert("Đang thoát chương trình...");
            loop = false;
            break;

        default:
            alert("Lựa chọn không hợp lệ! Vui lòng nhập từ 1 đến 5.");
            break;
    }
}