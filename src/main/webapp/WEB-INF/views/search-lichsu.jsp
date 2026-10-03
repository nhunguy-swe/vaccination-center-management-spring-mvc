<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Tra Cứu Lịch Sử Tiêm Chủng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<jsp:include page="header.jsp"/>
<div class="container">
    <div class="card shadow p-4 mb-4">
        <h4 class="text-primary mb-3">Tra cứu lịch sử tiêm chủng cá nhân</h4>
        <form action="${pageContext.request.contextPath}/search/lichsu" method="GET" class="row g-3">
            <div class="col-md-9">
                <select name="maNguoiTiem" class="form-select" required>
                    <option value="">-- Chọn Người cần tra cứu lịch sử --</option>
                    <c:forEach items="${danhSachNguoiTiem}" var="nt">
                        <option value="${nt.maNguoiTiem}" ${nt.maNguoiTiem == selectedMa ? 'selected' : ''}>
                                ${nt.hoTen} (CCCD: ${nt.cccd})
                        </option>
                    </c:forEach>
                </select>
            </div>
            <div class="col-md-3">
                <button type="submit" class="btn btn-success w-100">Tra cứu ngay</button>
            </div>
        </form>
    </div>

    <c:if test="${not empty lichSuList}">
        <div class="card shadow">
            <div class="card-header bg-secondary text-white fw-bold">DANH SÁCH LỊCH SỬ TIÊM CHỦNG</div>
            <div class="card-body">
                <table class="table table-hover table-bordered">
                    <thead class="table-dark">
                    <tr>
                        <th>Họ tên Người Tiêm</th>
                        <th>Tên Vắc-xin</th>
                        <th>Ngày Tiêm</th>
                        <th>Mũi Tiêm Số</th>
                        <th>Trạng Thái Sau Tiêm</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${lichSuList}" var="ls">
                        <tr>
                            <td><strong>${ls.nguoiTiem.hoTen}</strong></td>
                            <td><span class="badge bg-primary">${ls.vacxin.tenVacxin}</span></td>
                            <td><fmt:formatDate value="${ls.ngayTiem}" pattern="dd/MM/yyyy"/></td>
                            <td><span class="badge bg-info text-dark">${ls.muiTiemSo}</span></td>
                            <td>${ls.trangThaiSauTiem}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </c:if>
    <c:if test="${not empty selectedMa && empty lichSuList}">
        <div class="alert alert-warning shadow">Người này chưa thực hiện tiêm mũi vắc-xin nào tại hệ thống.</div>
    </c:if>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>