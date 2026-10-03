package com.example.quanlytiemchung.controller;

import com.example.quanlytiemchung.entity.*;
import com.example.quanlytiemchung.service.TiemChungService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/")
public class TiemChungController {

    @Autowired
    private TiemChungService service;

    // Trang chủ điều hướng nhanh
    @GetMapping
    public String index() { return "index"; }

    // ==========================================
    // YÊU CẦU 2: CÁC TRANG WEB NHẬP DỮ LIỆU
    // ==========================================

    // Form Vắc-xin
    @GetMapping("/vacxin/add")
    public String showVacxinForm(Model model) {
        model.addAttribute("vacxin", new Vacxin());
        return "vacxin-form";
    }

    @PostMapping("/vacxin/save")
    public String saveVacxin(@Valid @ModelAttribute("vacxin") Vacxin vacxin, BindingResult result) {
        // Kiểm tra nghiệp vụ: Giá tiền tròn nghìn
        if (vacxin.getGiaTien() != null && vacxin.getGiaTien() % 1000 != 0) {
            result.rejectValue("giaTien", "error.vacxin", "Giá tiền phải là số tròn nghìn (Ví dụ: 50000, 120000).");
        }
        if (result.hasErrors()) {
            return "vacxin-form";
        }
        service.saveVacxin(vacxin);
        return "redirect:/vacxin/add?success=true";
    }

    // Form Người Tiêm
    @GetMapping("/nguoitiem/add")
    public String showNguoiTiemForm(Model model) {
        model.addAttribute("nguoiTiem", new NguoiTiem());
        return "nguoitiem-form";
    }

    @PostMapping("/nguoitiem/save")
    public String saveNguoiTiem(@Valid @ModelAttribute("nguoiTiem") NguoiTiem nt, BindingResult result) {
        if (result.hasErrors()) {
            return "nguoitiem-form";
        }
        service.saveNguoiTiem(nt);
        return "redirect:/nguoitiem/add?success=true";
    }

    // Form Đăng ký Tiêm Chủng
    @GetMapping("/dangky/add")
    public String showDangKyForm(Model model) {
        model.addAttribute("lichSuTiem", new LichSuTiem());
        model.addAttribute("danhSachNguoiTiem", service.getAllNguoiTiem());
        model.addAttribute("danhSachVacxin", service.getAllVacxin());

        // Danh sách cố định cho mũi tiêm số
        List<String> muiSoList = new ArrayList<>();
        muiSoList.add("Mũi 1");
        muiSoList.add("Mũi 2");
        muiSoList.add("Mũi nhắc lại");
        model.addAttribute("danhSachMui", muiSoList);

        return "dangky-form";
    }

    @PostMapping("/dangky/save")
    public String saveDangKy(@ModelAttribute("lichSuTiem") LichSuTiem ls,
                             @RequestParam("maNguoiTiem") Integer maNT,
                             @RequestParam("maVacxin") Integer maVX) {
        ls.setNguoiTiem(service.getNguoiTiemById(maNT));
        ls.setVacxin(service.getVacxinById(maVX));
        service.saveLichSuTiem(ls);
        return "redirect:/dangky/add?success=true";
    }

    @GetMapping("/dangky/get-da-tiem")
    @ResponseBody
    public String getSoMuiDaTiem(@RequestParam("maNguoiTiem") Integer maNguoiTiem) {
        List<LichSuTiem> lichSu = service.getLichSuByNguoiTiem(maNguoiTiem);

        // Đếm số mũi hợp lệ đã tiêm (Mũi 1, Mũi 2)
        int count = 0;
        boolean daMui1 = false;
        boolean daMui2 = false;

        for (LichSuTiem ls : lichSu) {
            if ("Mũi 1".equals(ls.getMuiTiemSo())) daMui1 = true;
            if ("Mũi 2".equals(ls.getMuiTiemSo())) daMui2 = true;
        }

        if (daMui1 && daMui2) return "2";
        if (daMui1) return "1";

        return "0";
    }

    // ==========================================
    // YÊU CẦU 3: CÁC TRANG WEB TÌM KIẾM THÔNG TIN
    // ==========================================

    // Form 1: Tìm kiếm Người tiêm theo SĐT/CCCD
    @GetMapping("/search/nguoitiem")
    public String searchNguoiTiemForm(@RequestParam(value = "keyword", required = false) String keyword, Model model) {
        if (keyword != null && !keyword.trim().isEmpty()) {
            model.addAttribute("results", service.searchNguoiTiem(keyword.trim()));
            model.addAttribute("keyword", keyword);
        }
        return "search-nguoitiem";
    }

    // Form 2: Tra cứu lịch sử tiêm chủng
    @GetMapping("/search/lichsu")
    public String searchLichSuForm(@RequestParam(value = "maNguoiTiem", required = false) Integer maNguoiTiem, Model model) {
        model.addAttribute("danhSachNguoiTiem", service.getAllNguoiTiem());
        if (maNguoiTiem != null) {
            model.addAttribute("lichSuList", service.getLichSuByNguoiTiem(maNguoiTiem));
            model.addAttribute("selectedMa", maNguoiTiem);
        }
        return "search-lichsu";
    }
}
