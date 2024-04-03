<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sign Up Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <script type="text/javascript">
        <%--
            1. get DOM objects from html page
            2. bind reaction function for submit button
            3. bind reaction fucntions for username field and password field
            since the sign in feature requires username existence and password match,
            so on the browser side, it will only check whether the two fields are empty or not

            NOTE: the page mainly use BootStrap to decorate the font-end
            therefore, for more details about usage of "is-valid/is-invalid", please refer to BootStrap Docs
        --%>

        window.onload = function () {
            const username = document.getElementById("username");
            const password = document.getElementById("password");
            const btn_submit = document.getElementById("btn_submit");

            const feedback1 = document.getElementById("feedback1");
            const feedback2 = document.getElementById("feedback2");

            btn_submit.onclick = function () {
                if(!username.value || !password.value){
                    if(!username.value){
                        feedback1.hidden = false;
                        username.classList.add("is-invalid");
                        feedback1.innerText = 'Username cannot be empty!';
                    }
                    if(!password.value){
                        feedback2.hidden = false;
                        password.classList.add("is-invalid");
                        feedback2.innerText = 'Password cannot be empty!';
                    }
                    return false;
                }
                return true;
            }

            username.onchange = function () {
                if(username.value){
                    if(username.classList.contains("is-invalid")){
                        username.classList.remove("is-invalid");
                    }
                    feedback1.hidden = true;
                }
            }

            password.onchange = function () {
                if(password.value){
                    if(password.classList.contains("is-invalid")){
                        password.classList.remove("is-invalid");
                    }
                    feedback2.hidden = true;
                }
            }
        }
    </script>
</head>
<body>

<div class="gradient-form">

    <div class="card" style="width: 50%; margin: auto; margin-top: 50px;">
        <div class="card-body">
            <div class="text-center">
                <img src="http://localhost:8080/RegisterSystem/img/icon.png"
                     style="width: 64px;" alt="logo">
                <h4 class="mt-1 mb-3 pb-1">We are The Lotus Team</h4>
            </div>

            <form style="width: 60%; margin: auto" action="http://localhost:8080/RegisterSystem/loginServlet" method="post">
                <p class="text-center">Fill in to create a new account</p>

                <% if(request.getAttribute("msg") != null ) {%>
                <div class="alert alert-danger" role="alert">
                    <%= request.getAttribute("msg")%>
                </div>
                <% }%>



                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="username" placeholder="unique_username" name="username" value="<%= request.getAttribute("username") == null ? "" : request.getAttribute("username") %>">
                    <label for="username">Username</label>
                    <div class="invalid-feedback" id="feedback1">
                        wtf
                    </div>
                </div>

                <div class="form-floating mb-3">
                    <input type="password" class="form-control" id="password" placeholder="password" name="password">
                    <label for="password">Password</label>
                    <div class="invalid-feedback" id="feedback2">
                        <br>
                    </div>
                </div>

                <div class="form-floating mb-3" style="text-align: center; margin-top: 60px;">
                    <input type="submit" class="btn btn-success" value="LOG IN" id="btn_submit">
                </div>


            </form>

            <div class="text-center" style="margin-top: 60px;">

                <p style="margin-top: 40px; color: darkgreen">Still don't have an account? </p>
                <p><a href="http://localhost:8080/RegisterSystem/register.jsp" style="color: green; font-weight: bold">Sign up here</a></p>
            </div>
        </div>
    </div>

</div>


</body>
</html>
