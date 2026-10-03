package com.example.quanlytiemchung.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;
import org.springframework.format.annotation.DateTimeFormat;
import java.util.Date;

@Entity
@Table(name = "NGUOI_TIEM")
public class NguoiTiem {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ma_nguoi_tiem")
    private Integer maNguoiTiem;

    @NotBlank(message = "Họ tên bắt buộc phải nhập")
    @Column(name = "ho_ten")
    private String hoTen;

    @NotNull(message = "Ngày sinh bắt buộc phải nhập")
    @PastOrPresent(message = "Ngày sinh không được sau ngày hiện tại")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name = "ngay_sinh")
    private Date ngaySinh;

    @Column(name = "so_dien_thoai")
    private String soDienThoai;

    @Column(name = "cccd")
    private String cccd;

    // Getters, Setters
    public Integer getMaNguoiTiem() { return maNguoiTiem; }
    public void setMaNguoiTiem(Integer maNguoiTiem) { this.maNguoiTiem = maNguoiTiem; }
    public String getHoTen() { return hoTen; }
    public void setHoTen(String hoTen) { this.hoTen = hoTen; }
    public Date getNgaySinh() { return ngaySinh; }
    public void setNgaySinh(Date ngaySinh) { this.ngaySinh = ngaySinh; }
    public String getSoDienThoai() { return soDienThoai; }
    public void setSoDienThoai(String soDienThoai) { this.soDienThoai = soDienThoai; }
    public String getCccd() { return cccd; }
    public void setCccd(String cccd) { this.cccd = cccd; }
}
