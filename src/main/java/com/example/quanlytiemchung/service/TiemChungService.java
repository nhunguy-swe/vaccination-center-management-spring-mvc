package com.example.quanlytiemchung.service;

import com.example.quanlytiemchung.entity.*;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;

@Service
@Transactional
public class TiemChungService {

    @Autowired
    private SessionFactory sessionFactory;

    protected Session getSession() {
        return sessionFactory.getCurrentSession();
    }

    // --- XỬ LÝ VẮC-XIN ---
    public void saveVacxin(Vacxin vacxin) { getSession().saveOrUpdate(vacxin); }
    public List<Vacxin> getAllVacxin() {
        return getSession().createQuery("from Vacxin", Vacxin.class).list();
    }
    public Vacxin getVacxinById(Integer id) { return getSession().get(Vacxin.class, id); }

    // --- XỬ LÝ NGƯỜI TIÊM ---
    public void saveNguoiTiem(NguoiTiem nt) { getSession().saveOrUpdate(nt); }
    public List<NguoiTiem> getAllNguoiTiem() {
        return getSession().createQuery("from NguoiTiem", NguoiTiem.class).list();
    }
    public NguoiTiem getNguoiTiemById(Integer id) { return getSession().get(NguoiTiem.class, id); }

    // Tìm kiếm theo SĐT hoặc CCCD (Yêu cầu 3 - Form 1)
    public List<NguoiTiem> searchNguoiTiem(String keyword) {
        String hql = "from NguoiTiem where soDienThoai = :kw or cccd = :kw";
        Query<NguoiTiem> query = getSession().createQuery(hql, NguoiTiem.class);
        query.setParameter("kw", keyword);
        return query.list();
    }

    // --- XỬ LÝ LỊCH SỬ TIÊM ---
    public void saveLichSuTiem(LichSuTiem ls) { getSession().saveOrUpdate(ls); }

    // Tra cứu lịch sử tiêm của một người theo ID (Yêu cầu 3 - Form 2)
    public List<LichSuTiem> getLichSuByNguoiTiem(Integer maNguoiTiem) {
        String hql = "from LichSuTiem where nguoiTiem.maNguoiTiem = :maNT";
        Query<LichSuTiem> query = getSession().createQuery(hql, LichSuTiem.class);
        query.setParameter("maNT", maNguoiTiem);
        return query.list();
    }
}