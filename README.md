# HỆ THỐNG QUẢN LÝ TRUNG TÂM TIÊM CHỦNG (Vaccination Center Management)

<p>
  <img src="https://img.shields.io/badge/Java-17%2B-orange" alt="Java">
  <img src="https://img.shields.io/badge/Spring%20MVC-brightgreen" alt="Spring MVC">
  <img src="https://img.shields.io/badge/Hibernate%2FJPA-blue" alt="Hibernate/JPA">
  <img src="https://img.shields.io/badge/Build-Maven-red" alt="Maven">
</p>

## 1. Giới thiệu

Hệ thống Quản lý Trung tâm Tiêm chủng được xây dựng nhằm hỗ trợ quản lý thông tin vắc-xin, người tiêm và lịch sử tiêm chủng. Hệ thống giúp lưu trữ dữ liệu, đăng ký tiêm và tra cứu lịch sử tiêm một cách nhanh chóng và chính xác.

---

## 2. Công nghệ sử dụng

- Java
- Spring MVC
- Hibernate/JPA
- MySQL hoặc SQL Server
- JSP/Servlet
- Bootstrap (tùy chọn)
- Maven

---

## 3. Thiết kế cơ sở dữ liệu

### Bảng VACXIN

| Tên cột    | Kiểu dữ liệu              | Mô tả         |
| ---------- | ------------------------- | -------------- |
| maVacXin   | INT (PK, AUTO_INCREMENT)  | Mã vắc-xin       |
| tenVacXin  | VARCHAR(100)                | Tên vắc-xin        |
| nhaSanXuat | VARCHAR(100)                  | Nhà sản xuất         |
| soLo       | VARCHAR(50)                     | Số lô                  |
| hanSuDung  | DATE                               | Hạn sử dụng               |
| giaTien    | BIGINT                                | Giá tiền                     |

### Bảng NGUOI_TIEM

| Tên cột     | Kiểu dữ liệu              | Mô tả               |
| ----------- | ------------------------- | --------------------- |
| maNguoiTiem | INT (PK, AUTO_INCREMENT)  | Mã người tiêm           |
| hoTen       | VARCHAR(100)                | Họ tên                    |
| ngaySinh    | DATE                          | Ngày sinh                   |
| soDienThoai | VARCHAR(10)                     | Số điện thoại                  |
| maDinhDanh  | VARCHAR(20)                       | CCCD hoặc Hộ chiếu                |

### Bảng LICH_SU_TIEM

| Tên cột          | Kiểu dữ liệu              | Mô tả                       |
| ---------------- | ------------------------- | ----------------------------- |
| maLichSu         | INT (PK, AUTO_INCREMENT)  | Mã lịch sử                      |
| maNguoiTiem      | INT (FK)                    | Người tiêm                        |
| maVacXin         | INT (FK)                      | Vắc-xin                             |
| ngayTiem         | DATE                             | Ngày tiêm                              |
| muiTiemSo        | VARCHAR(30)                        | Mũi 1, Mũi 2, Mũi nhắc lại                |
| trangThaiSauTiem | VARCHAR(255)                          | Trạng thái sau tiêm                         |

---

## 4. Chức năng hệ thống

### 4.1 Quản lý Vắc-xin

Cho phép thêm mới: Tên vắc-xin, Nhà sản xuất, Số lô, Hạn sử dụng, Giá tiền.

**Validation — Hạn sử dụng:** phải lớn hơn ngày hiện tại.

**Validation — Giá tiền:** số nguyên dương, phải là bội số của 1.000.
```
1000
5000
15000
100000
```

### 4.2 Quản lý Người tiêm

Cho phép thêm mới: Họ tên, Ngày sinh, Số điện thoại, Mã định danh (CCCD/Hộ chiếu).

**Validation — Họ tên:** không được để trống.

**Validation — Ngày sinh:** không được để trống, không được lớn hơn ngày hiện tại.
```java
@PastOrPresent
private LocalDate ngaySinh;
```

### 4.3 Đăng ký Tiêm chủng

Cho phép đăng ký lịch sử tiêm, gồm: Người tiêm (ComboBox từ CSDL), Vắc-xin (ComboBox từ CSDL), Ngày tiêm, Mũi tiêm số, Trạng thái sau tiêm.

**Danh sách Mũi tiêm số:** Mũi 1, Mũi 2, Mũi nhắc lại.

**Validation:** Người tiêm phải được chọn, Vắc-xin phải được chọn, Mũi tiêm số phải được chọn.

---

## 5. Chức năng tìm kiếm

### 5.1 Tìm kiếm Người tiêm

Tìm theo: Số điện thoại, Mã định danh (CCCD/Hộ chiếu). Kết quả: Mã người tiêm, Họ tên, Ngày sinh, Số điện thoại, Mã định danh.

### 5.2 Tra cứu lịch sử tiêm chủng

Tìm theo: Mã người tiêm. Kết quả: Họ tên, Tên vắc-xin, Ngày tiêm, Mũi tiêm số, Trạng thái sau tiêm.

---

## 6. Kiến trúc dự án

```
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

- **Framework:** Spring MVC, Hibernate/JPA
- **Mô hình:** Servlet/JSP đúng chuẩn MVC — Controller xử lý request, DAO thao tác dữ liệu, JSP hiển thị giao diện
- **Database:** MySQL hoặc SQL Server
- **Coding Convention:** PascalCase cho Class, camelCase cho biến, tách riêng Controller/DAO/Service/Entity, code rõ ràng, dễ bảo trì

---

## 8. Giao diện

Khuyến khích sử dụng: Bootstrap 5, CSS Responsive, Form đẹp dễ sử dụng, Bảng dữ liệu trực quan.

---

## Bắt đầu (Getting Started)

### Yêu cầu

- JDK 17+
- MySQL hoặc SQL Server
- IDE: IntelliJ IDEA / Eclipse

### Cài đặt

```bash
git clone https://github.com/nhunguy-swe/vaccination-center-management-spring-mvc.git
cd vaccination-center-management-spring-mvc
```

### Cấu hình Database

1. Tạo các bảng `VACXIN`, `NGUOI_TIEM`, `LICH_SU_TIEM` theo thiết kế ở trên.
2. Cập nhật thông tin kết nối trong `HibernateConfig.java`.

> ⚠️ Không hard-code mật khẩu database trực tiếp trong code nếu push lên GitHub public — dùng biến môi trường hoặc file cấu hình đã thêm vào `.gitignore`.

### Chạy ứng dụng

```bash
# macOS/Linux
./mvnw spring-boot:run

# Windows
mvnw.cmd spring-boot:run
```

> Nếu project dùng Spring MVC thuần (không Spring Boot), build bằng `mvn clean install` rồi deploy file `.war` lên Tomcat.

---

## 9. Kết luận

Hệ thống đáp ứng đầy đủ các yêu cầu: Quản lý vắc-xin · Quản lý người tiêm · Đăng ký tiêm chủng · Kiểm tra dữ liệu đầu vào bằng Validation · Tìm kiếm người tiêm · Tra cứu lịch sử tiêm chủng · Áp dụng Spring MVC và Hibernate · Servlet/JSP đúng mô hình MVC · Tuân thủ Java Coding Convention

---

## Tác giả

- GitHub: [@nhunguy-swe](https://github.com/nhunguy-swe)

---

## Giấy phép

Dự án này được thực hiện cho mục đích học tập/ôn thi cá nhân.
