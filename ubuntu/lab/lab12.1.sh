# Xem tất cả tiến trình đang chạy.
ps aux

# Lọc các tiến trình đang chạy theo người dùng
ps -e -u vuongfly

# Lọc các tiến trình theo tên bất kỳ.
ps -C brave

# Lọc các tiến trình với tên bất kỳ (nhưng thử tên không tồn tại).
ps -C notexistedprocess

# Sắp xếp các tiến trình theo cách sử dụng
ps -e --sort=-pcpu -o pid,pcpu,comm

# Chỉ hiển thị các cột pid và đổi tên tiêu đề thành Process,
ps -o pid=Process
ps -o pid=Process, ruser=RealUser, comm=Command