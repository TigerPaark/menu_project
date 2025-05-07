<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    request.setCharacterEncoding("UTF-8");
    String cp = request.getContextPath();
    
    // 계산 결과 저장 변수
    double result = 0;
    String num1 = request.getParameter("num1");
    String num2 = request.getParameter("num2");
    String operator = request.getParameter("operator");
    
    // 계산 수행
    if(num1 != null && num2 != null && operator != null) {
        try {
            double n1 = Double.parseDouble(num1);
            double n2 = Double.parseDouble(num2);
            
            switch(operator) {
                case "add":
                    result = n1 + n2;
                    break;
                case "subtract":
                    result = n1 - n2;
                    break;
                case "multiply":
                    result = n1 * n2;
                    break;
                case "divide":
                    if(n2 != 0) {
                        result = n1 / n2;
                    } else {
                        request.setAttribute("errorMessage", "0으로 나눌 수 없습니다.");
                    }
                    break;
                case "modulo":
                    if(n2 != 0) {
                        result = n1 % n2;
                    } else {
                        request.setAttribute("errorMessage", "0으로 나눌 수 없습니다.");
                    }
                    break;
                case "power":
                    result = Math.pow(n1, n2);
                    break;
            }
        } catch(NumberFormatException e) {
            request.setAttribute("errorMessage", "유효한 숫자를 입력해주세요.");
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>간편 계산기</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/calculate.css?after">
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
    
    function validateForm() {
        var num1 = document.getElementById("num1").value;
        var num2 = document.getElementById("num2").value;
        
        if(num1 === "" || num2 === "") {
            alert("두 숫자를 모두 입력해주세요.");
            return false;
        }
        return true;
    }
</script>
</head>
<body>
    <h1 class="body">🧮 간편 계산기 🧮</h1>
    <div class="styled-box">✨ 원하는 계산을 해보세요! ✨</div>
    
    <div class="image-container">
        <img src="<%=cp %>/images/calculator.jpg" alt="계산기 이미지" class="food-image">
    </div>
    
    <div class="instruction-box">
        <strong>두 개의 숫자를 입력하고, 원하는 연산을 선택한 후 '계산하기'를 눌러주세요.</strong>
    </div>
    
    <form action="" method="post" onsubmit="return validateForm()">
        <div class="calculator-container">
            <div class="input-group">
                <label for="num1">첫번째 숫자:</label>
                <input type="text" id="num1" name="num1" placeholder="숫자 입력" value="<%= num1 != null ? num1 : "" %>">
            </div>
            
            <div class="input-group">
                <label for="num2">두번째 숫자:</label>
                <input type="text" id="num2" name="num2" placeholder="숫자 입력" value="<%= num2 != null ? num2 : "" %>">
            </div>
            
            <!-- 연산자 선택 -->
            <div class="button-group">
                <button type="submit" class="menu-button operation-button <%= "add".equals(operator) ? "active" : "" %>" 
                    name="operator" value="add" onclick="selectButton(this, 'operation')">더하기 (+)</button>
                <button type="submit" class="menu-button operation-button <%= "subtract".equals(operator) ? "active" : "" %>" 
                    name="operator" value="subtract" onclick="selectButton(this, 'operation')">빼기 (-)</button>
                <button type="submit" class="menu-button operation-button <%= "multiply".equals(operator) ? "active" : "" %>" 
                    name="operator" value="multiply" onclick="selectButton(this, 'operation')">곱하기 (×)</button>
                <button type="submit" class="menu-button operation-button <%= "divide".equals(operator) ? "active" : "" %>" 
                    name="operator" value="divide" onclick="selectButton(this, 'operation')">나누기 (÷)</button>
                <button type="submit" class="menu-button operation-button <%= "modulo".equals(operator) ? "active" : "" %>" 
                    name="operator" value="modulo" onclick="selectButton(this, 'operation')">나머지 (%)</button>
                <button type="submit" class="menu-button operation-button <%= "power".equals(operator) ? "active" : "" %>" 
                    name="operator" value="power" onclick="selectButton(this, 'operation')">제곱 (^)</button>
            </div>
            
            <!-- 계산 버튼 -->
            <button type="submit" class="recommend-button">계산하기!</button>
        </div>
    </form>
    
    <!-- 결과 표시 영역 -->
    <c:if test="${not empty errorMessage}">
        <div class="result-box error">
            <p>${errorMessage}</p>
        </div>
    </c:if>
    
    <% if(num1 != null && num2 != null && operator != null && request.getAttribute("errorMessage") == null) { %>
        <div class="result-box">
            <p>계산 결과: <strong><%= result %></strong></p>
            <p class="operation-detail">
                <%= num1 %> 
                <% if("add".equals(operator)) { %>+<% } %>
                <% if("subtract".equals(operator)) { %>-<% } %>
                <% if("multiply".equals(operator)) { %>×<% } %>
                <% if("divide".equals(operator)) { %>÷<% } %>
                <% if("modulo".equals(operator)) { %>%<% } %>
                <% if("power".equals(operator)) { %>^<% } %>
                <%= num2 %> = <%= result %>
            </p>
        </div>
    <% } %>
</body>
</html>