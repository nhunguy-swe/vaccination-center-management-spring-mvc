package com.example.quanlytiemchung.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;
import org.springframework.format.annotation.DateTimeFormat;
import java.util.Date;

@Entity
@Table(name = "VACXIN")
public class Vacxin {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ma_vacxin")
    private Integer maVacxin;

    @NotBlank(message = "Tên vắc-xin không được để trống")
    @Column(name = "ten_vacxin")
    private String tenVacxin;

    @Column(name = "nha_san_xuat")
    private String nhaSanXuat;

    @Column(name = "so_lo")
    private String soLo;

    @NotNull(message = "Hạn sử dụng không được để trống")
    @Future(message = "Hạn sử dụng phải sau ngày hiện tại")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name = "han_su_dung")
    private Date hanSuDung;

    @NotNull(message = "Giá tiền không được để trống")
    @Min(value = 1000, message = "Giá tiền phải là số nguyên dương")
    @Column(name = "gia_tien")
    private Long giaTien;

    // Getters, Setters, Constructors
    public Integer getMaVacxin() { return maVacxin; }
    public void setMaVacxin(Integer maVacxin) { this.maVacxin = maVacxin; }
    public String getTenVacxin() { return tenVacxin; }
    public void setTenVacxin(String tenVacxin) { this.tenVacxin = tenVacxin; }
    public String getNhaSanXuat() { return nhaSanXuat; }
    public void setNhaSanXuat(String nhaSanXuat) { this.nhaSanXuat = nhaSanXuat; }
    public String getSoLo() { return soLo; }
    public void setSoLo(String soLo) { this.soLo = soLo; }
    public Date getHanSuDung() { return hanSuDung; }
    public void setHanSuDung(Date hanSuDung) { this.hanSuDung = hanSuDung; }
    public Long getGiaTien() { return giaTien; }
    public void setGiaTien(Long giaTien) { this.giaTien = giaTien; }
}
