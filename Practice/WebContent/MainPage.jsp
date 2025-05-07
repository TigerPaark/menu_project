<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    request.setCharacterEncoding("UTF-8");
    String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/main.css?after">
</head>
<body>
    <h1 class="body" style="text-align: center;">✨웹 사이트 방문에 환영합니다.ᐟ.ᐟ.ᐟ ✨</h1>
    
    <div class="styled-box">🔥원하시는 기능을 선택해주세요! 🔥</div>
    
    <div class="main-container">
        <div class="main-instruction-box">
            <strong>🚀아래 버튼을 클릭하여 원하는 기능으로 이동하세요🚀</strong>
        </div>
        
        <div class="top-features">
            <!-- 계산기 -->
            <div class="feature-box">
                <div class="feature-image-container">
                    <img src="<%=cp %>/images/calculator.jpg" alt="계산기 이미지" class="feature-image">
                </div>
                <div class="feature-description">
                    <h2>간편 계산기</h2>
                    <p>다양한 계산 기능을 제공하는 간편한 계산기입니다.</p>
                    <p>더하기, 빼기, 곱하기, 나누기, 제곱 등 여러 연산을 수행할 수 있습니다.</p>
                </div>
                <a href="<%=cp %>/Calculate.jsp" class="feature-button">계산기 이용하기</a>
            </div>
            
            <!-- 메뉴 추천 -->
            <div class="feature-box">
                <div class="feature-image-container">
                    <img src="<%=cp %>/images/food.jpg" alt="음식 이미지" class="feature-image">
                </div>
                <div class="feature-description">
                    <h2>메뉴 추천</h2>
                    <p>고민되는 식사 메뉴를 추천해드립니다.</p>
                    <p>시간대, 음식 종류, 함께하는 사람 등의 옵션을 선택하여 맞춤 메뉴를 확인하세요.</p>
                </div>
                <a href="<%=cp %>/Menu.jsp" class="feature-button">메뉴 추천받기</a>
            </div>
        </div>
        
        <div class="bottom-feature">
            <!-- 맛집 추천 -->
            <div class="feature-box wide-box">
                <div class="feature-image-container">
                    <img src="<%=cp %>/images/map.jpg" alt="지도 이미지" class="feature-image">
                </div>
                <div class="feature-description">
                    <h2>맛집 추천</h2>
                    <p>전국의 맛집을 추천해드립니다.</p>
                    <p>지도를 통해 전국의 맛집을 확인하세요.</p>
                </div>
                <a href="<%=cp %>/Map.jsp" class="feature-button">맛집 추천받기</a>
            </div>
        </div>
    </div>
    
    <footer class="main-footer">
        <p>© 2025 Tigerpaark의 개인 웹사이트.</p>
    </footer>
</body>
</html>
