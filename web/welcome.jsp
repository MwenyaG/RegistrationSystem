<%--
This is the entry page for the register/login system,
where user will see the logo and name of our team,
also two buttons available to choose register/login
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Welcome</title>
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
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            height: 160px;
            overflow: hidden;
            font-family: 'Rubik Marker Hatch', cursive;
            font-size: 35px;
            line-height: 40px;
            color: #ecf0f1;
        }

        .content__container {
            font-weight: 600;
            overflow: hidden;
            height: 40px;
            padding: 0 40px;
        }

        .content__container:before {
            content: "[";
            left: 0;
        }

        .content__container:after {
            content: "]";
            position: absolute;
            right: 0;
        }

        .content__container:after, .content__container:before {
            position: absolute;
            top: 0;
            color: #E3FCBF;
            font-size: 42px;
            line-height: 40px;
            -webkit-animation-name: opacity;
            -webkit-animation-duration: 2s;
            -webkit-animation-iteration-count: infinite;
            animation-name: opacity;
            animation-duration: 2s;
            animation-iteration-count: infinite;
        }

        .content__container__text {
            display: inline;
            float: left;
            margin: 0;
        }

        .content__container__list {
            margin-top: 0;
            padding-left: 110px;
            text-align: left;
            list-style: none;
            -webkit-animation-name: change;
            -webkit-animation-duration: 10s;
            -webkit-animation-iteration-count: infinite;
            animation-name: change;
            animation-duration: 10s;
            animation-iteration-count: infinite;
        }

        .content__container__list__item {
            line-height: 40px;
            margin: 0;
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
    <div class="content__container">
        <p class="content__container__text">
            Hello
        </p>

        <ul class="content__container__list">
            <li class="content__container__list__item"><%= request.getAttribute("username")%> !</li>
            <li class="content__container__list__item"><%= request.getAttribute("fullname")%> !</li>
            <li class="content__container__list__item"><%= request.getAttribute("username")%> !</li>
            <li class="content__container__list__item"><%= request.getAttribute("fullname")%> !</li>
        </ul>
    </div>

    <div style="text-align: center; font-size: 16px; margin-top: 80px">
        <p>by Lotus</p>
    </div>
</div>

</body>
</html>
