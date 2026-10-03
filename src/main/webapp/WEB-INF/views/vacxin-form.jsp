<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Thêm mới Vắc-xin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<jsp:include page="header.jsp"/>
<div class="container" style="max-width: 600px;">
    <div class="card shadow">
        <div class="card-header bg-success text-white text-center fw-bold">NHẬP THÔNG TIN VẮC-XIN</div>
        <div class="card-body">
            <c:if test="${param.success == 'true'}">
                <div class="alert alert-success">Lưu thông tin vắc-xin thành công!</div>
            </c:if>
            <form:form action="${pageContext.request.contextPath}/vacxin/save" modelAttribute="vacxin" method="POST">
                <div class="mb-3">
                    <label class="form-label">Tên Vắc-xin (*):</label>
                    <form:input path="tenVacxin" class="form-control"/>
                    <form:errors path="tenVacxin" class="text-danger small"/>
                </div>
                <div class="mb-3">
                    <label class="form-label">Nhà sản xuất:</label>
                    <form:input path="nhaSanXuat" class="form-control"/>
                </div>
                <div class="mb-3">
                    <label class="form-label">Số lô:</label>
                    <form:input path="soLo" class="form-control"/>
                </div>
                <div class="mb-3">
                    <label class="form-label">Hạn sử dụng (*):</label>
                    <form:input type="date" path="hanSuDung" class="form-control"/>
                    <form:errors path="hanSuDung" class="text-danger small"/>
                </div>
                <div class="mb-3">
                    <label class="form-label">Giá tiền (VND - Tròn nghìn *):</label>
                    <form:input type="number" path="giaTien" class="form-control"/>
                    <form:errors path="giaTien" class="text-danger small"/>
                </div>
                <button type="submit" class="btn btn-success w-100">Lưu Vắc-xin</button>
            </form:form>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>