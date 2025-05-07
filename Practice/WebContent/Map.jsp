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
<title>맛집 지도</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- 외부 스타일시트 -->
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/map.css?after">
<!-- Kakao Map SDK: autoload false 설정 -->
<script
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1808e822aee4f866ec7748aef18494a6&autoload=false"></script>
</head>
<body>
	<h1 class="body" style="text-align: center;">🍽️ 맛집 지도 🍽️</h1>
	<div class="styled-box">추천 맛집들을 지도로 확인해보세요!</div>

	<div class="instruction-box">
		<strong>지도에서 마커를 클릭하면 맛집 정보를 확인할 수 있습니다.</strong>
	</div>

	<!-- 지도 컨테이너 -->
	<div class="map-container">
		<div id="map" style="width: 100%; height: 500px;"></div>
	</div>

	<!-- 선택된 맛집 정보 표시 -->
	<div class="restaurant-info-container" id="restaurantInfo">
		<h3>맛집 정보</h3>
		<p>지도에서 맛집 마커를 클릭하면 정보가 표시됩니다.</p>
	</div>

	<!-- 하단 버튼 -->
	<a href="<%=cp%>/main.jsp" class="recommend-button">메인으로 돌아가기</a>

	<!-- 지도 및 마커 JS 코드 -->
	<script>
        const restaurantData = [
            { name: "을지로 필동면옥", lat: 37.5658, lng: 126.9926, description: "70년 전통의 평양냉면 전문점", category: "한식", rating: "⭐⭐⭐⭐" },
            { name: "봉피양", lat: 37.5744, lng: 126.9812, description: "정갈한 평양냉면과 만두", category: "한식", rating: "⭐⭐⭐⭐⭐" },
            { name: "광화문국밥", lat: 37.5720, lng: 126.9769, description: "깔끔한 선지해장국과 소고기국밥", category: "한식", rating: "⭐⭐⭐⭐" },
            { name: "두툼 삼청점", lat: 37.5826, lng: 126.9832, description: "두툼한 고기가 올라간 연어덮밥", category: "일식", rating: "⭐⭐⭐⭐" },
            { name: "이치에", lat: 37.5273, lng: 127.0276, description: "가성비 좋은 정통 일식 오마카세", category: "일식", rating: "⭐⭐⭐⭐⭐" }
        ];

        let map;
        let currentMarkers = [];

        // Kakao Map API가 로드된 후 실행
        kakao.maps.load(function() {
            initMap();
        });

        // 지도 초기화
        function initMap() {
            const mapContainer = document.getElementById('map');
            const mapOption = {
                center: new kakao.maps.LatLng(37.566826, 126.9786567),
                level: 7
            };
            map = new kakao.maps.Map(mapContainer, mapOption);
            displayRestaurants();
        }

        // 마커 표시
        function displayRestaurants() {
            restaurantData.forEach((restaurant) => {
                const markerPosition = new kakao.maps.LatLng(restaurant.lat, restaurant.lng);
                const imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png';
                const imageSize = new kakao.maps.Size(24, 35);
                const markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

                const marker = new kakao.maps.Marker({
                    map: map,
                    position: markerPosition,
                    title: restaurant.name,
                    image: markerImage
                });

                kakao.maps.event.addListener(marker, 'click', function () {
                    showRestaurantInfo(restaurant);
                });

                currentMarkers.push(marker);
            });
        }

        // 맛집 정보 표시
        function showRestaurantInfo(restaurant) {
            const infoContainer = document.getElementById('restaurantInfo');
            infoContainer.innerHTML = `
                <h3>${restaurant.name}</h3>
                <div class="restaurant-details">
                    <p><strong>카테고리:</strong> ${restaurant.category}</p>
                    <p><strong>평점:</strong> ${restaurant.rating}</p>
                    <p><strong>설명:</strong> ${restaurant.description}</p>
                    <a href="#" class="menu-button" onclick="alert('준비 중인 기능입니다.'); return false;">메뉴 보기</a>
                    <a href="#" class="menu-button" onclick="alert('준비 중인 기능입니다.'); return false;">리뷰 작성</a>
                </div>
            `;
            infoContainer.classList.add('show');
        }
    </script>
</body>
</html>
