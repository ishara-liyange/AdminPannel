<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="sideBarAd.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Admin</title>
  	<style>
  	/* General Styles */
	body {
	    font-family: Arial, sans-serif;
	    background-color: #1c2751;
	    margin: 0;
	    padding: 0;
	}

	.main-content {
	    max-width: 600px;
	    margin: 50px auto;
	    padding: 20px;
	    background-color: #1c2751;
	}

	h2 {
	    text-align: center;
	    color: #ececec;
	}

	/* Form Styles */
	.form-outliner {
	    margin-top: 20px;
	}

	.main-form {
	    display: flex;
	    flex-direction: column;
	}

	label {
	    margin-bottom: 5px;
	    font-weight: bold;
	    color: #ffffff;
	}

	input[type="text"],
	input[type="email"],
	input[type="password"] {
	    padding: 10px;
	    border: 1px solid #ccc;
	    border-radius: 4px;
	    margin-bottom: 15px;
	    font-size: 16px;
	}

	input[type="text"]:focus,
	input[type="email"]:focus,
	input[type="password"]:focus {
	    border-color: #444444;
	    outline: none;
	}

	/* Button Styles */
	.add-group {
	    display: flex;
	    justify-content: center;
	}

	.add-btn {
	    background-color: #ffffff;
	    color: rgb(0, 0, 0);
	    border: none;
	    border-radius: 4px;
	    padding: 10px 15px;
	    font-size: 16px;
	    cursor: pointer;
	    transition: background-color 0.3s;
	}

	.add-btn:hover {
	    background-color: #6a8097;
	}

	.form-list {
	    list-style-type: none; /* Remove default list styling */
	    padding: 0; /* Remove padding */
	}

	.form-list li {
	    margin-bottom: 15px; /* Space between each list item */
	}

	label {
	    display: block; /* Make labels block elements to stack above inputs */
	    margin-bottom: 5px; /* Space between label and input */
	    font-weight: bold;
	    color: #fdfdfd;
	}

	input[type="text"],
	input[type="email"],
	input[type="password"] {
	    padding: 10px;
	    border: 1px solid #ccc;
	    border-radius: 4px;
	    font-size: 16px;
	    width: 100%; /* Make inputs full-width */
	    box-sizing: border-box; /* Include padding and border in the element's total width */
	}
  	</style>

    <!-- JavaScript for form validation -->
    <script>
        function validateForm() {
            // Get form fields
            var phone = document.getElementById("phone").value;
            var email = document.getElementById("email").value;
            var password = document.getElementById("password").value;
            var nic = document.getElementById("nic").value;

            // Phone validation: 10 characters
            if (phone.length !== 10 || isNaN(phone)) {
                alert("Phone number must be exactly 10 digits.");
                return false;
            }

            // Email validation: must contain '@'
            if (email.indexOf("@") === -1) {
                alert("Email must contain '@'.");
                return false;
            }

            // Password validation: at least 4 characters
            if (password.length < 4) {
                alert("Password must be at least 4 characters long.");
                return false;
            }

            // NIC validation: exactly 12 characters
            if (nic.length !== 12) {
                alert("NIC must be exactly 12 characters long.");
                return false;
            }

            return true; // If all validations pass
        }
    </script>
</head>
<body>

    <div class="main-content">
        <h2 style="text-align: center; margin: 5px auto; font-size: 30px;">Add Admin</h2>
        <div class="form-container">
            <div class="form-outliner">
                <form action="AddAdminServlet" method="POST" onsubmit="return validateForm()">
                    <div class="main-form">
                        <label for="name">Name:</label>
                        <input type="text" id="name" name="a_name" required>

                        <label for="nic">NIC:</label>
                        <input type="text" id="nic" name="a_nic" required>

                        <label for="phone">Phone:</label>
                        <input type="text" id="phone" name="a_phone" required>

                        <label for="email">Email:</label>
                        <input type="email" id="email" name="a_email" required>

                        <label for="username">Username:</label>
                        <input type="text" id="username" name="a_username" required>

                        <label for="password">Password:</label>
                        <input type="password" id="password" name="a_password" required>
                    </div>

                    <div class="add-group">
                        <input class="add-btn" type="submit" value="Add Admin">
                    </div>
                </form>
            </div>
        </div>
    </div>

</body>
</html>
