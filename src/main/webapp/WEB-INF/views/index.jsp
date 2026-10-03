<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Hệ Thống Quản Lý Tiêm Chủng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<jsp:include page="header.jsp"/>
<div class="container text-center py-5">
    <div class="p-5 mb-4 bg-white rounded-3 shadow">
        <h1 class="display-5 fw-bold text-primary">HỆ THỐNG QUẢN LÝ TRUNG TÂM TIÊM CHỦNG</h1>
        <p class="col-md-8 mx-auto fs-5 text-muted mt-3">Chào mừng bạn đến với hệ thống quản trị dữ liệu tiêm chủng quốc gia. Vui lòng lựa chọn các chức năng quản lý hoặc tra cứu thông tin trên thanh Menu điều hướng.</p>
        <div class="d-flex justify-content-center gap-3 mt-4">
            <a href="${pageContext.request.contextPath}/dangky/add" class="btn btn-primary btn-lg px-4">Đăng ký tiêm</a>
            <a href="${pageContext.request.contextPath}/search/lichsu" class="btn btn-outline-secondary btn-lg px-4">Tra cứu nhanh</a>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>