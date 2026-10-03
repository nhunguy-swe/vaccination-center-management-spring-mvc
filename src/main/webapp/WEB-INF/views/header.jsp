<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">

    <style>
        body {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            background-color: #f8f9fa;
        }
        .main-content {
            flex: 1;
        }
        .navbar-brand-custom {
            font-weight: 700;
            letter-spacing: 0.5px;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-primary mb-4 shadow border-bottom border-white border-2">
    <div class="container">
        <a class="navbar-brand navbar-brand-custom" href="${pageContext.request.contextPath}/">
            <i class="bi bi-shield-plus me-2"></i>TT. TIÊM CHỦNG
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link text-white text-opacity-75" href="${pageContext.request.contextPath}/vacxin/add">
                        <i class="bi bi-capsule me-1"></i> Thêm Vắc-xin
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white text-opacity-75" href="${pageContext.request.contextPath}/nguoitiem/add">
                        <i class="bi bi-person-plus me-1"></i> Thêm Người Tiêm
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white text-opacity-75" href="${pageContext.request.contextPath}/dangky/add">
                        <i class="bi bi-calendar-check me-1"></i> Đăng ký Tiêm
                    </a>
                </li>
                <li class="nav-item ms-lg-3">
                    <a class="nav-link text-warning fw-bold" href="${pageContext.request.contextPath}/search/nguoitiem">
                        <i class="bi bi-search me-1"></i> Tìm Người Tiêm
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-warning fw-bold" href="${pageContext.request.contextPath}/search/lichsu">
                        <i class="bi bi-journal-medical me-1"></i> Tra Cứu Lịch Sử
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="main-content">