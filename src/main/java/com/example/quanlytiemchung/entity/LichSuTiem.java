package com.example.quanlytiemchung.entity;

import jakarta.persistence.*;
import org.springframework.format.annotation.DateTimeFormat;
import java.util.Date;

@Entity
@Table(name = "LICH_SU_TIEM")
public class LichSuTiem {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ma_lich_su")
    private Integer maLichSu;

    @ManyToOne
    @JoinColumn(name = "ma_nguoi_tiem")
    private NguoiTiem nguoiTiem;

    @ManyToOne
    @JoinColumn(name = "ma_vacxin")
    private Vacxin vacxin;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name = "ngay_tiem")
    private Date ngayTiem;

    @Column(name = "mui_tiem_so")
    private String muiTiemSo;

    @Column(name = "trang_thai_sau_tiem")
    private String trangThaiSauTiem;

    // Getters, Setters
    public Integer getMaLichSu() { return maLichSu; }
    public void setMaLichSu(Integer maLichSu) { this.maLichSu = maLichSu; }
    public NguoiTiem getNguoiTiem() { return nguoiTiem; }
    public void setNguoiTiem(NguoiTiem nguoiTiem) { this.nguoiTiem = nguoiTiem; }
    public Vacxin getVacxin() { return vacxin; }
    public void setVacxin(Vacxin vacxin) { this.vacxin = vacxin; }
    public Date getNgayTiem() { return ngayTiem; }
    public void setNgayTiem(Date ngayTiem) { this.ngayTiem = ngayTiem; }
    public String getMuiTiemSo() { return muiTiemSo; }
    public void setMuiTiemSo(String muiTiemSo) { this.muiTiemSo = muiTiemSo; }
    public String getTrangThaiSauTiem() { return trangThaiSauTiem; }
    public void setTrangThaiSauTiem(String trangThaiSauTiem) { this.trangThaiSauTiem = trangThaiSauTiem; }
}