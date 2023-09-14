<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
/*             justify-content: center; */
/*             align-items: center; */
            height: 100vh;
            margin: 0;
        }
        .otp-container {
            background-color: #ffffff;
            border-radius: 8px;
            padding: 90px;
            box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        h1 {
            margin-bottom: 20px;
            color: #333;
        }
        label {
            font-weight: bold;
            color: #666;
        }
        input[type="text"] {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            width: 100%;
            margin-top: 6px;
        }
        input[type="submit"] {
            background-color: #007bff;
            color: #ffffff;
            border: none;
            border-radius: 4px;
            padding: 10px 20px;
            cursor: pointer;
        }
    </style>
<script>
        function showAlert() {
            var inputOTP = document.getElementById("otp").value;
            
            var serverOTP = "${otpNum}"; // 서버에서 받아온 OTP 값
			console.log(serverOTP);
            if (inputOTP === serverOTP) {
                alert("2차 인증 성공");
                location.href = "${pageContext.request.contextPath}/index.do";
            } else {
                alert("2차 인증 실패");
                location.reload();
            }
        }
    </script>

    <div class="otp-container">
        <h1>OTP 2차 인증</h1>
        <form action="javascript:void(0);" onsubmit="showAlert(); return false;">
            <br>
            <input type="text" name="otp" id="otp" required>
            <br><br><br>
            <input type="submit" value="확인">
        </form>
    </div>

