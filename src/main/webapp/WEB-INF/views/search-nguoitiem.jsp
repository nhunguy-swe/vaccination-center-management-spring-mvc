<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Tìm Kiếm Người Tiêm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<jsp:include page="header.jsp"/>
<div class="container">
    <div class="card shadow p-4 mb-4">
        <h4 class="text-primary mb-3">Tìm kiếm Người tiêm theo Số điện thoại / CCCD</h4>
        <form action="${pageContext.request.contextPath}/search/nguoitiem" method="GET" class="row g-3">
            <div class="col-md-9">
                <input type="text" name="keyword" class="form-control" value="${keyword}" placeholder="Nhập số điện thoại hoặc mã định danh/CCCD cần tìm..." required>
            </div>
            <div class="col-md-3">
                <button type="submit" class="btn btn-primary w-100">Tìm kiếm</button>
            </div>
        </form>
    </div>

    <c:if test="${not empty keyword}">
        <div class="card shadow">
            <div class="card-header bg-dark text-white fw-bold">KẾT QUẢ TÌM KIẾM</div>
            <div class="card-body">
                <table class="table table-bordered table-striped align-middle">
                    <thead class="table-primary">
                    <tr>
                        <th>Mã</th>
                        <th>Họ Tên</th>
                        <th>Ngày Sinh</th>
                        <th>Số Điện Thoại</th>
                        <th>CCCD / Hộ Chiếu</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${results}" var="nt">
                        <tr>
                            <td>${nt.maNguoiTiem}</td>
                            <td class="fw-bold">${nt.hoTen}</td>
                            <td>${nt.ngaySinh}</td>
                            <td>${nt.soDienThoai}</td>
                            <td>${nt.cccd}</td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty results}">
                        <tr>
                            <td colspan="5" class="text-center text-danger">Không tìm thấy người tiêm nào phù hợp.</td>
                        </tr>
                    </c:if>
                    </tbody>
                </table>
            </div>
        </div>
    </c:if>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>