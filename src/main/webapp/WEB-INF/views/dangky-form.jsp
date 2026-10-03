<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Đăng ký Tiêm Chủng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<jsp:include page="header.jsp"/>
<div class="container" style="max-width: 600px;">
    <div class="card shadow border-0">
        <div class="card-header bg-primary text-white text-center fw-bold py-3 fs-5">
            <i class="bi bi-calendar-check me-2"></i>ĐĂNG KÝ TIÊM CHỦNG
        </div>
        <div class="card-body p-4">
            <c:if test="${param.success == 'true'}">
                <div class="alert alert-success d-flex align-items-center" role="alert">
                    <i class="bi bi-check-circle-fill me-2"></i>
                    <div>Ghi nhận lịch sử tiêm thành công!</div>
                </div>
            </c:if>
            <form:form action="${pageContext.request.contextPath}/dangky/save" modelAttribute="lichSuTiem" method="POST">

                <div class="mb-3">
                    <label class="form-label fw-semibold">Chọn Người Tiêm (*):</label>
                    <select name="maNguoiTiem" id="selectNguoiTiem" class="form-select" required onchange="CapNhatMuiTiem()">
                        <option value="">-- Chọn Người Tiêm --</option>
                        <c:forEach items="${danhSachNguoiTiem}" var="nt">
                            <option value="${nt.maNguoiTiem}">${nt.hoTen} (CCCD: ${nt.cccd})</option>
                        </c:forEach>
                    </select>
                </div>

                <div class="mb-3">
                    <label class="form-label fw-semibold">Chọn Vắc-xin (*):</label>
                    <select name="maVacxin" class="form-select" required>
                        <option value="">-- Chọn Vắc-xin --</option>
                        <c:forEach items="${danhSachVacxin}" var="vx">
                            <option value="${vx.maVacxin}">${vx.tenVacxin} (Lô: ${vx.soLo} - HSD: ${vx.hanSuDung})</option>
                        </c:forEach>
                    </select>
                </div>

                <div class="mb-3">
                    <label class="form-label fw-semibold">Ngày tiêm (*):</label>
                    <form:input type="date" path="ngayTiem" class="form-control" required="required"/>
                </div>

                <div class="mb-3">
                    <label class="form-label fw-semibold">Mũi tiêm số (*):</label>
                    <select name="muiTiemSo" id="selectMuiTiem" class="form-select" required>
                        <option value="">-- Vui lòng chọn người tiêm trước --</option>
                    </select>
                </div>

                <div class="mb-3">
                    <label class="form-label fw-semibold">Trạng thái sau tiêm:</label>
                    <form:input path="trangThaiSauTiem" class="form-control" placeholder="Ví dụ: Theo dõi tại trung tâm 30p..."/>
                </div>

                <button type="submit" class="btn btn-primary w-100 py-2 fw-bold shadow-sm">
                    <i class="bi bi-check-lg me-2"></i>Xác Nhận Đăng Ký
                </button>
            </form:form>
        </div>
    </div>
</div>

<script>
    function CapNhatMuiTiem() {
        var maNguoiTiem = document.getElementById("selectNguoiTiem").value;
        var selectMuiTiem = document.getElementById("selectMuiTiem");

        // Nếu chưa chọn ai, reset về trạng thái ban đầu
        if (!maNguoiTiem) {
            selectMuiTiem.innerHTML = '<option value="">-- Vui lòng chọn người tiêm trước --</option>';
            return;
        }

        // Gọi AJAX cực ngắn bằng Fetch API có sẵn của trình duyệt
        var url = "${pageContext.request.contextPath}/dangky/get-da-tiem?maNguoiTiem=" + maNguoiTiem;

        fetch(url)
            .then(response => response.text())
            .then(data => {
                var soMuiDaTiem = parseInt(data.trim());
                var htmlOptions = "";

                if (soMuiDaTiem === 0) {
                    // Chưa tiêm mũi nào -> Chỉ được tiêm mũi 1
                    htmlOptions += '<option value="Mũi 1">Mũi 1</option>';
                } else if (soMuiDaTiem === 1) {
                    // Đã tiêm mũi 1 -> Được tiêm mũi 2 hoặc mũi nhắc lại
                    htmlOptions += '<option value="Mũi 2">Mũi 2</option>';
                    htmlOptions += '<option value="Mũi nhắc lại">Mũi nhắc lại</option>';
                } else {
                    // Đã tiêm cả mũi 1 và mũi 2 -> Chỉ còn mũi nhắc lại
                    htmlOptions += '<option value="Mũi nhắc lại">Mũi nhắc lại</option>';
                }

                selectMuiTiem.innerHTML = htmlOptions;
            })
            .catch(error => {
                console.error('Lỗi khi tải lịch sử mũi tiêm:', error);
                selectMuiTiem.innerHTML = '<option value="Mũi 1">Mũi 1</option><option value="Mũi 2">Mũi 2</option><option value="Mũi nhắc lại">Mũi nhắc lại</option>';
            });
    }
</script>
<jsp:include page="footer.jsp" />
</body>
</html>