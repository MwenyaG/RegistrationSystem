<%--
  Created by IntelliJ IDEA.
  User: xiongkouqin
  Date: 2022/11/7
  Time: 19:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Homepage</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Rubik+Marker+Hatch&display=swap" rel="stylesheet">

    <style>
        body {
            width: 100%;
            height: 100%;
            position: fixed;
            background-color: #14c38e;
        }

        .content {
            position: absolute;
            top: 40%;
            left: 50%;
            transform: translate(-50%, -50%);
            height: 160px;
            overflow: hidden;
            font-family: 'Rubik Marker Hatch', cursive;
            font-size: 35px;
            line-height: 40px;
            color: #ecf0f1;
        }

        @-webkit-keyframes opacity {
            0%, 100% {
                opacity: 0;
            }
            50% {
                opacity: 1;
            }
        }

        @-webkit-keyframes change {
            0%, 12.66%, 100% {
                transform: translate3d(0, 0, 0);
            }
            16.66%, 29.32% {
                transform: translate3d(0, -25%, 0);
            }
            33.32%, 45.98% {
                transform: translate3d(0, -50%, 0);
            }
            49.98%, 62.64% {
                transform: translate3d(0, -75%, 0);
            }
            66.64%, 79.3% {
                transform: translate3d(0, -50%, 0);
            }
            83.3%, 95.96% {
                transform: translate3d(0, -25%, 0);
            }
        }

        @keyframes opacity {
            0%, 100% {
                opacity: 0;
            }
            50% {
                opacity: 1;
            }
        }

        @keyframes change {
            0%, 12.66%, 100% {
                transform: translate3d(0, 0, 0);
            }
            16.66%, 29.32% {
                transform: translate3d(0, -25%, 0);
            }
            33.32%, 45.98% {
                transform: translate3d(0, -50%, 0);
            }
            49.98%, 62.64% {
                transform: translate3d(0, -75%, 0);
            }
            66.64%, 79.3% {
                transform: translate3d(0, -50%, 0);
            }
            83.3%, 95.96% {
                transform: translate3d(0, -25%, 0);
            }
        }
    </style>
</head>
<body>

<div style="margin-top: 80px; text-align: center">
    <img src="http://localhost:8080/RegisterSystem/img/icon.png"
         style="width: 64px;" alt="logo">
</div>

<div class="content">
    <p>Welcome to Lotus user homepage</p>

    <p style="font-size: 16px;"><a href="login.jsp" style="text-decoration: none; color: #E3FCBF">Click to login</a><a
            href="register.jsp" style="text-decoration: none;color: #E3FCBF;padding-left: 360px">Click to register</a></p>

</div>

</body>
</html>
