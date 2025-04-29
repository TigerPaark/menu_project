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
<title>식사메뉴선택</title>

<link rel="stylesheet" type="text/css" href="<%=cp %>/css/MainPage.css?after">

<script>
    function selectButton(button, category) {
        // 해당 카테고리의 모든 버튼에서 active 클래스 제거
        var buttons = document.querySelectorAll('.' + category + '-button');
        buttons.forEach(function(btn) {
            btn.classList.remove('active');
        });
        
        // 클릭한 버튼에 active 클래스 추가
        button.classList.add('active');
    }
</script>

</head>
<body>

	<h1 class= "body">🍽️메뉴선택🍽️</h1>
	<div class="styled-box">🍱오늘의 식사메뉴를 추천해드립니다.ᐟ.ᐟ.ᐟ🍜</div>
	<div class="image-container">
    	<img src="<%=cp %>/images/food.jpg" alt="음식 이미지" class="food-image">
	</div>
	
	<div class="instruction-box">
		<strong>옵션을 선택하고 '메뉴를 추천해줘!'를 눌러주세요.</strong>
	</div>
	
	<!-- 첫 번째 카테고리: 식사 시간대 -->
	<div class="button-group">
		<button class="menu-button time-button active" onclick="selectButton(this, 'time')">전체</button>
		<button class="menu-button time-button" onclick="selectButton(this, 'time')">아침</button>
		<button class="menu-button time-button" onclick="selectButton(this, 'time')">점심</button>
		<button class="menu-button time-button" onclick="selectButton(this, 'time')">저녁</button>
	</div>
	
	<!-- 두 번째 카테고리: 음식 종류 -->
	<div class="button-group">
		<button class="menu-button cuisine-button active" onclick="selectButton(this, 'cuisine')">전체</button>
		<button class="menu-button cuisine-button" onclick="selectButton(this, 'cuisine')">한식</button>
		<button class="menu-button cuisine-button" onclick="selectButton(this, 'cuisine')">중식</button>
		<button class="menu-button cuisine-button" onclick="selectButton(this, 'cuisine')">일식</button>
		<button class="menu-button cuisine-button" onclick="selectButton(this, 'cuisine')">양식</button>
		<button class="menu-button cuisine-button" onclick="selectButton(this, 'cuisine')">패스트푸드</button>
		<button class="menu-button cuisine-button" onclick="selectButton(this, 'cuisine')">분식</button>
	</div>
	
	<!-- 세 번째 카테고리: 함께 식사할 인원 -->
	<div class="button-group">
		<button class="menu-button company-button active" onclick="selectButton(this, 'company')">전체</button>
		<button class="menu-button company-button" onclick="selectButton(this, 'company')">혼밥</button>
		<button class="menu-button company-button" onclick="selectButton(this, 'company')">가족</button>
		<button class="menu-button company-button" onclick="selectButton(this, 'company')">연인</button>
		<button class="menu-button company-button" onclick="selectButton(this, 'company')">직장동료</button>
		<button class="menu-button company-button" onclick="selectButton(this, 'company')">친구</button>
		<button class="menu-button company-button" onclick="selectButton(this, 'company')">모임</button>
	</div>
	
	<!-- 추천 버튼 -->
	<button class="recommend-button">메뉴를 추천해줘!</button>
	
</body>
</html>