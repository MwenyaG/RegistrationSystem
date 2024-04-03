<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sign Up Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <script type="text/javascript" src="js/validateFirstname.js"></script>
    <script type="text/javascript" src="js/validateLastname.js"></script>
    <script type="text/javascript" src="js/validateUsername.js"></script>
    <script type="text/javascript" src="js/validatePassword.js"></script>
    <script type="text/javascript">

        <%--
            1. This is the register page, where new user can create an account with
               - a unique username [length must be between 4 and 20, contains only A-Z, a-z, 0-9 and _ ]
               - a first name [length must be at least 1, contains only A-Z, a-z, space]
               - a last name [length must be at least 1, contains only A-Z, a-z, space]
               - a password [must have the length of 9, with 4 alphabets, 4 digits and 1 special symbol from [!@#$%^&*?]; also shall not be followed character with character or digit with digit]
               - correctly repeated password

            2. For the first 4 fields, there will be a corresponding validate fucntion
            to check whether user's input meets requirements

            3. For each fields, it will refresh to check again while the content is changed

            4. When 5 fields all meet the goal, user will only be able to submit and try to create an account
            Therefore, there is a checkAllParameters, which will be called when a field is detected as correct
            once, all parameters correct, the submit button will be enabled

            5. When user submit the information, all data will be passed to logic layer and persistence layer
            to check whether the username exists or not, if not exists, user will successfully sign up; otherwise,
            user will see an alert "username exists"
         --%>


        window.onload = function () {

            /**
             * Get HTML elements
             * @type {HTMLElement}
             */
            const username = document.getElementById("username");
            const password = document.getElementById("password");
            const rptpwd = document.getElementById("rptpwd");
            const firstname = document.getElementById("firstname");
            const lastname = document.getElementById("lastname");

            const feedback1 = document.getElementById("feedback1");
            const feedback2 = document.getElementById("feedback2");
            const feedback3 = document.getElementById("feedback3");

            const feedback4 = document.getElementById("feedback4");
            const feedback5 = document.getElementById("feedback5");

            const btn_submit = document.getElementById("btn_submit");

            /**
             * bind onchange functions for all fields, and change the front-end
             * based on the result
             */
            username.onchange = function () {
                if (validateUsername(username.value)) {
                    // make the feedback valid
                    if (username.classList.contains("is-invalid")) {
                        username.classList.remove("is-invalid");
                    }
                    if (feedback1.classList.contains("invalid-feedback")) {
                        feedback1.classList.remove("invalid-feedback");
                    }
                    if (!username.classList.contains("is-valid")) {
                        username.classList.add("is-valid");
                    }
                    if (!feedback1.classList.contains("valid-feedback")) {
                        feedback1.classList.add("valid-feedback");
                    }

                    feedback1.innerText = 'Looks good!';
                    checkAllParameters();
                } else {
                    // make the feedback invalid
                    if (username.classList.contains("is-valid")) {
                        username.classList.remove("is-valid");
                    }
                    if (feedback1.classList.contains("valid-feedback")) {
                        feedback1.classList.remove("valid-feedback");
                    }
                    if (!username.classList.contains("is-invalid")) {
                        username.classList.add("is-invalid");
                    }
                    if (!feedback1.classList.contains("invalid-feedback")) {
                        feedback1.classList.add("invalid-feedback");
                    }

                    feedback1.innerText = 'Username\'s length must be between 4 and 20, contains only A-Z, a-z, 0-9 and _ ';
                    btn_submit.disabled = true;
                }

            }

            firstname.onchange = function () {
                if (validateFirstname(firstname.value)) {
                    // make the feedback valid
                    if (firstname.classList.contains("is-invalid")) {
                        firstname.classList.remove("is-invalid");
                    }
                    if (feedback4.classList.contains("invalid-feedback")) {
                        feedback4.classList.remove("invalid-feedback");
                    }
                    if (!firstname.classList.contains("is-valid")) {
                        firstname.classList.add("is-valid");
                    }
                    if (!feedback4.classList.contains("valid-feedback")) {
                        feedback4.classList.add("valid-feedback");
                    }

                    feedback4.innerText = 'Looks good!';
                    checkAllParameters();
                } else {
                    // make the feedback invalid
                    if (firstname.classList.contains("is-valid")) {
                        firstname.classList.remove("is-valid");
                    }
                    if (feedback4.classList.contains("valid-feedback")) {
                        feedback4.classList.remove("valid-feedback");
                    }
                    if (!firstname.classList.contains("is-invalid")) {
                        firstname.classList.add("is-invalid");
                    }
                    if (!feedback4.classList.contains("invalid-feedback")) {
                        feedback4.classList.add("invalid-feedback");
                    }

                    feedback4.innerText = 'First name\'s length must be at least 1, contains only A-Z, a-z, space ';
                    btn_submit.disabled = true;
                }
            }

            lastname.onchange = function () {
                if (validateLastname(lastname.value)) {
                    // make the feedback valid
                    if (lastname.classList.contains("is-invalid")) {
                        lastname.classList.remove("is-invalid");
                    }
                    if (feedback5.classList.contains("invalid-feedback")) {
                        feedback5.classList.remove("invalid-feedback");
                    }
                    if (!lastname.classList.contains("is-valid")) {
                        lastname.classList.add("is-valid");
                    }
                    if (!feedback5.classList.contains("valid-feedback")) {
                        feedback5.classList.add("valid-feedback");
                    }

                    feedback5.innerText = 'Looks good!';
                    checkAllParameters();
                } else {
                    // make the feedback invalid
                    if (lastname.classList.contains("is-valid")) {
                        lastname.classList.remove("is-valid");
                    }
                    if (feedback5.classList.contains("valid-feedback")) {
                        feedback5.classList.remove("valid-feedback");
                    }
                    if (!lastname.classList.contains("is-invalid")) {
                        lastname.classList.add("is-invalid");
                    }
                    if (!feedback5.classList.contains("invalid-feedback")) {
                        feedback5.classList.add("invalid-feedback");
                    }

                    feedback5.innerText = 'Last name\'s length must be at least 1, contains only A-Z, a-z, space ';
                    btn_submit.disabled = true;
                }
            }

            password.onchange = function () {
                if (validatePassword(password.value)) {
                    // make the feedback valid
                    if (password.classList.contains("is-invalid")) {
                        password.classList.remove("is-invalid");
                    }
                    if (feedback2.classList.contains("invalid-feedback")) {
                        feedback2.classList.remove("invalid-feedback");
                    }
                    if (!password.classList.contains("is-valid")) {
                        password.classList.add("is-valid");
                    }
                    if (!feedback2.classList.contains("valid-feedback")) {
                        feedback2.classList.add("valid-feedback");
                    }

                    feedback2.innerText = 'Looks good!';
                    checkAllParameters();
                } else {
                    // make the feedback invalid
                    if (password.classList.contains("is-valid")) {
                        password.classList.remove("is-valid");
                    }
                    if (feedback2.classList.contains("valid-feedback")) {
                        feedback2.classList.remove("valid-feedback");
                    }
                    if (!password.classList.contains("is-invalid")) {
                        password.classList.add("is-invalid");
                    }
                    if (!feedback2.classList.contains("invalid-feedback")) {
                        feedback2.classList.add("invalid-feedback");
                    }

                    feedback2.innerText = 'Password must have the length of 9, with 4 alphabets, 4 digits and 1 special symbol from [!@#$%^&*?]; also shall not be followed character with character or digit with digit';
                    btn_submit.disabled = true;
                }

            }

            rptpwd.onchange = function () {
                if (password.value.length != 0) {
                    if (rptpwd.value.localeCompare(password.value) == 0) {
                        if (rptpwd.classList.contains("is-invalid")) {
                            rptpwd.classList.remove("is-invalid");
                        }
                        if (feedback3.classList.contains("invalid-feedback")) {
                            feedback3.classList.remove("invalid-feedback");
                        }
                        if (!rptpwd.classList.contains("is-valid")) {
                            rptpwd.classList.add("is-valid");
                        }
                        if (!feedback3.classList.contains("valid-feedback")) {
                            feedback3.classList.add("valid-feedback");
                        }

                        feedback3.innerText = 'Looks good!';
                        checkAllParameters();
                    } else {
                        if (rptpwd.classList.contains("is-valid")) {
                            rptpwd.classList.remove("is-valid");
                        }
                        if (feedback3.classList.contains("valid-feedback")) {
                            feedback3.classList.remove("valid-feedback");
                        }
                        if (!rptpwd.classList.contains("is-invalid")) {
                            rptpwd.classList.add("is-invalid");
                        }
                        if (!feedback3.classList.contains("invalid-feedback")) {
                            feedback3.classList.add("invalid-feedback");
                        }

                        feedback3.innerText = 'It must be the same as above';
                        btn_submit.disabled = true;
                    }

                }
            }


            const checkAllParameters = function () {
                if (validateUsername(username.value) && validatePassword(password.value) && (rptpwd.value.localeCompare(password.value) == 0)) {
                    btn_submit.disabled = false;
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

            <form style="width: 60%; margin: auto;" action="http://localhost:8080/RegisterSystem/registerServlet"
                  method="post">
                <p class="text-center">Fill in to log in to your account</p>

                <% if (request.getAttribute("msg") != null) {%>
                <div class="alert alert-danger" role="alert">
                    <%= request.getAttribute("msg")%>
                </div>
                <% }%>

                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="username" placeholder="unique_username" name="username"
                           value="<%= request.getAttribute("username") == null ? "" : request.getAttribute("username") %>">
                    <label for="username">Username</label>
                    <div class="" id="feedback1">
                        <br>
                    </div>
                </div>

                <div style="display: flex">
                    <div class="form-floating mb-3" style="width: 47.5%;margin-right: 5%">
                        <input type="text" class="form-control" id="firstname" placeholder="firstname" name="firstname">
                        <label for="firstname">First Name</label>
                        <div class="valid-feedback" id="feedback4">
                            <br>
                        </div>
                    </div>

                    <div class="form-floating mb-3" style="width: 47.5%; ">
                        <input type="text" class="form-control" id="lastname" placeholder="lastname" name="lastname">
                        <label for="lastname">Last Name</label>
                        <div class="" id="feedback5">
                            <br>
                        </div>
                    </div>
                </div>

                <div class="form-floating mb-3">
                    <input type="password" class="form-control" id="password" placeholder="password" name="password">
                    <label for="password">Password</label>
                    <div class="" id="feedback2">
                        <br>
                    </div>
                </div>

                <div class="form-floating mb-3">
                    <input type="password" class="form-control" id="rptpwd" placeholder="repeated_password">
                    <label for="rptpwd">Repeat Your Password</label>
                    <div class="" id="feedback3">
                        <br>
                    </div>
                </div>

                <div class="form-floating mb-3" style="text-align: center; margin-top: 30px;">
                    <input type="submit" class="btn btn-success" value="SIGN UP" id="btn_submit" disabled="true">
                </div>

            </form>

            <div class="text-center" style="margin-top: 30px;">

                <p style="margin-top: 40px; color: darkgreen">Already have an account? </p>
                <p><a href="http://localhost:8080/RegisterSystem/login.jsp"
                      style="color: green; font-weight: bold">Log in here</a></p>
            </div>
        </div>
    </div>

</div>


</body>
</html>
