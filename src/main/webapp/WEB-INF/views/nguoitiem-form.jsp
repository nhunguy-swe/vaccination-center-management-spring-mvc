<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Thêm Người Tiêm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<jsp:include page="header.jsp"/>
<div class="container" style="max-width: 600px;">
    <div class="card shadow">
        <div class="card-header bg-info text-white text-center fw-bold">NHẬP THÔNG TIN NGƯỜI TIÊM</div>
        <div class="card-body">
            <c:if test="${param.success == 'true'}">
                <div class="alert alert-success">Lưu hồ sơ người tiêm thành công!</div>
            </c:if>
            <form:form action="${pageContext.request.contextPath}/nguoitiem/save" modelAttribute="nguoiTiem" method="POST">
                <div class="mb-3">
                    <label class="form-label">Họ tên người tiêm (*):</label>
                    <form:input path="hoTen" class="form-control"/>
                    <form:errors path="hoTen" class="text-danger small"/>
                </div>
                <div class="mb-3">
                    <label class="form-label">Ngày sinh (*):</label>
                    <form:input type="date" path="ngaySinh" class="form-control"/>
                    <form:errors path="ngaySinh" class="text-danger small"/>
                </div>
                <div class="mb-3">
                    <label class="form-label">Số điện thoại:</label>
                    <form:input path="soDienThoai" class="form-control"/>
                </div>
                <div class="mb-3">
                    <label class="form-label">Mã định danh / CCCD:</label>
                    <form:input path="cccd" class="form-control"/>
                </div>
                <button type="submit" class="btn btn-info text-white w-100">Đăng Ký Hồ Sơ</button>
            </form:form>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>