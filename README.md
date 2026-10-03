# HỆ THỐNG QUẢN LÝ TRUNG TÂM TIÊM CHỦNG

## 1. Giới thiệu

Hệ thống Quản lý Trung tâm Tiêm chủng được xây dựng nhằm hỗ trợ quản lý thông tin vắc-xin, người tiêm và lịch sử tiêm chủng. Hệ thống giúp lưu trữ dữ liệu, đăng ký tiêm và tra cứu lịch sử tiêm một cách nhanh chóng và chính xác.

---

## 2. Công nghệ sử dụng

* Java
* Spring MVC
* Hibernate/JPA
* MySQL hoặc SQL Server
* JSP/Servlet
* Bootstrap (tùy chọn)
* Maven

---

## 3. Thiết kế cơ sở dữ liệu

### Bảng VACXIN

| Tên cột    | Kiểu dữ liệu             | Mô tả        |
| ---------- | ------------------------ | ------------ |
| maVacXin   | INT (PK, AUTO_INCREMENT) | Mã vắc-xin   |
| tenVacXin  | VARCHAR(100)             | Tên vắc-xin  |
| nhaSanXuat | VARCHAR(100)             | Nhà sản xuất |
| soLo       | VARCHAR(50)              | Số lô        |
| hanSuDung  | DATE                     | Hạn sử dụng  |
| giaTien    | BIGINT                   | Giá tiền     |

---

### Bảng NGUOI_TIEM

| Tên cột     | Kiểu dữ liệu             | Mô tả              |
| ----------- | ------------------------ | ------------------ |
| maNguoiTiem | INT (PK, AUTO_INCREMENT) | Mã người tiêm      |
| hoTen       | VARCHAR(100)             | Họ tên             |
| ngaySinh    | DATE                     | Ngày sinh          |
| soDienThoai | VARCHAR(10)              | Số điện thoại      |
| maDinhDanh  | VARCHAR(20)              | CCCD hoặc Hộ chiếu |

---

### Bảng LICH_SU_TIEM

| Tên cột          | Kiểu dữ liệu             | Mô tả                      |
| ---------------- | ------------------------ | -------------------------- |
| maLichSu         | INT (PK, AUTO_INCREMENT) | Mã lịch sử                 |
| maNguoiTiem      | INT (FK)                 | Người tiêm                 |
| maVacXin         | INT (FK)                 | Vắc-xin                    |
| ngayTiem         | DATE                     | Ngày tiêm                  |
| muiTiemSo        | VARCHAR(30)              | Mũi 1, Mũi 2, Mũi nhắc lại |
| trangThaiSauTiem | VARCHAR(255)             | Trạng thái sau tiêm        |

---

## 4. Chức năng hệ thống

### 4.1 Quản lý Vắc-xin

Cho phép thêm mới thông tin vắc-xin:

* Tên vắc-xin
* Nhà sản xuất
* Số lô
* Hạn sử dụng
* Giá tiền

#### Validation

**Hạn sử dụng**

* Phải lớn hơn ngày hiện tại.

**Giá tiền**

* Là số nguyên dương.
* Phải là bội số của 1.000.

Ví dụ:

```java
1000
5000
15000
100000
```

---

### 4.2 Quản lý Người tiêm

Cho phép thêm mới người tiêm:

* Họ tên
* Ngày sinh
* Số điện thoại
* Mã định danh (CCCD/Hộ chiếu)

#### Validation

**Họ tên**

* Không được để trống.

**Ngày sinh**

* Không được để trống.
* Không được lớn hơn ngày hiện tại.

Ví dụ:

```java
@PastOrPresent
private LocalDate ngaySinh;
```

---

### 4.3 Đăng ký Tiêm chủng

Cho phép đăng ký lịch sử tiêm.

Thông tin gồm:

* Người tiêm (ComboBox từ CSDL)
* Vắc-xin (ComboBox từ CSDL)
* Ngày tiêm
* Mũi tiêm số
* Trạng thái sau tiêm

#### Danh sách Mũi tiêm số

* Mũi 1
* Mũi 2
* Mũi nhắc lại

#### Validation

* Người tiêm phải được chọn.
* Vắc-xin phải được chọn.
* Mũi tiêm số phải được chọn.

---

## 5. Chức năng tìm kiếm

### 5.1 Tìm kiếm Người tiêm

Cho phép tìm kiếm theo:

* Số điện thoại
* Mã định danh (CCCD/Hộ chiếu)

Kết quả hiển thị:

* Mã người tiêm
* Họ tên
* Ngày sinh
* Số điện thoại
* Mã định danh

---

### 5.2 Tra cứu lịch sử tiêm chủng

Tìm kiếm theo:

* Mã người tiêm

Kết quả hiển thị:

* Họ tên
* Tên vắc-xin
* Ngày tiêm
* Mũi tiêm số
* Trạng thái sau tiêm

---

## 6. Kiến trúc dự án

```text
src/main/java
│
├── controller
│   ├── VacXinController
│   ├── NguoiTiemController
│   └── LichSuTiemController
│
├── entity
│   ├── VacXin
│   ├── NguoiTiem
│   └── LichSuTiem
│
├── dao
│   └── TiemChungDAO
│
├── service
│
└── config
    ├── WebConfig
    └── HibernateConfig
```

---

## 7. Yêu cầu kỹ thuật

### Framework

* Spring MVC
* Hibernate/JPA

### Mô hình

* Servlet/JSP đúng chuẩn MVC.
* Controller xử lý request.
* DAO thao tác dữ liệu.
* JSP hiển thị giao diện.

### Cơ sở dữ liệu

* MySQL hoặc SQL Server.

### Coding Convention

* Tên class theo PascalCase.
* Tên biến theo camelCase.
* Tách riêng Controller, DAO, Service, Entity.
* Code rõ ràng, dễ bảo trì.

---

## 8. Giao diện

Khuyến khích sử dụng:

* Bootstrap 5
* CSS Responsive
* Form đẹp, dễ sử dụng
* Bảng dữ liệu trực quan

Các tiêu chí trên có thể được cộng tối đa 1.0 điểm.

---

## 9. Kết luận

Hệ thống đáp ứng đầy đủ các yêu cầu:

✔ Quản lý vắc-xin

✔ Quản lý người tiêm

✔ Đăng ký tiêm chủng

✔ Kiểm tra dữ liệu đầu vào bằng Validation

✔ Tìm kiếm người tiêm

✔ Tra cứu lịch sử tiêm chủng

✔ Áp dụng Spring MVC và Hibernate

✔ Servlet/JSP đúng mô hình MVC

✔ Tuân thủ Java Coding Convention
