# Sử dụng bản Ubuntu mới nhất làm nền
FROM ubuntu:latest

# Cập nhật hệ thống và cài đặt trình biên dịch GCC
RUN apt-get update && apt-get install -y \
    gcc \
    libc6-dev \
    && rm -rf /var/lib/apt/lists/*

# Thiết lập thư mục làm việc mặc định bên trong container
WORKDIR /app

# Lệnh mặc định khi khởi chạy container là mở terminal
CMD ["/bin/bash"]