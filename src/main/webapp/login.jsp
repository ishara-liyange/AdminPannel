<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body {
            margin: 0;
            font-family: 'Inter', sans-serif;
        }

        .Page {
            width: 100%;
            height: 100vh;
            background: #1c2751;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .PageProduct {
            max-width: 800px; /* Increased max-width to accommodate the image */
            width: 100%;
            padding: 64px;
            background: white;
            display: flex;
            border-radius: 8px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
        }

        .Image {
            flex: 1;
            background-image: url(img/side.png); /* Side image */
            background-size: cover;
            background-position: center;
            border-radius: 8px 0 0 8px; /* Rounded corners on the left */
        }

        .Column {
            flex: 1;
            display: flex;
            flex-direction: column;
            gap: 24px;
            padding: 0 32px; /* Padding for spacing */
        }

        .Body {
            display: flex;
            flex-direction: column;
            gap: 16px;
        }

        .Title {
            color: #1E1E1E;
            font-size: 24px;
            font-weight: 600;
            line-height: 28.8px;
        }

        .Text {
            color: #757575;
            font-size: 16px;
        }

        .Fields {
            display: flex;
            flex-direction: column;
            gap: 24px;
        }

        .SelectField {
            display: flex;
            flex-direction: column;
            gap: 5px;
        }

        .Label {
            color: #1E1E1E;
            font-size: 16px;
        }

        .Select {
            height: 40px;
            padding: 12px 16px;
            background: white;
            border-radius: 8px;
            border: 1px solid #D9D9D9;
            font-size: 14px;
        }

        .Button {
            padding: 12px;
            background: #1c2751;
            border-radius: 8px;
            display: flex;
            justify-content: center;
            align-items: center;
            color: #F5F5F5;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s;
            text-align: center;
        }

        .Button:hover {
            background: #1E1E1E;
        }

        /* Responsive Styles */
        @media (max-width: 768px) {
            .Page {
                flex-direction: column;
            }

            .PageProduct {
                flex-direction: column;
                padding: 32px;
                align-items: center; /* Center align on small screens */
            }

            .Image {
                width: 100%; /* Make image responsive */
                height: 200px; /* Set height for the image */
                border-radius: 8px; /* Round corners */
            }

            .Column {
                padding: 0; /* Remove padding on small screens */
            }
        }
    </style>
</head>
<body>
    <div class="Page">
        <div class="PageProduct">
            <div class="Image"></div> <!-- Side image -->
            <div class="Column">
                <div class="Body">
                    <div class="Title">Admin Login</div>
                    <div class="Text">to access Admin</div>
                </div>
                <div class="Fields">
                    <form method="POST" action="adminLogin">
                        <div class="SelectField">
                            <div class="Label">User Name</div>
                            <input type="text" class="Select" placeholder="Enter your username" id="username" name="username" required />
                        </div>
                        <div class="SelectField">
                            <div class="Label">Password</div>
                            <input type="password" class="Select" placeholder="Enter your password" id="password" name="password" required/>
                        </div>
                        <div class="Button">
                            <input type="submit" value="Sign in" style="background: none; border: none; color: inherit; cursor: pointer;">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script>
        // Accordion toggle functionality
        const accordionTitles = document.querySelectorAll('.AccordionTitle');
        accordionTitles.forEach(title => {
            title.addEventListener('click', () => {
                const content = title.nextElementSibling;
                content.style.display = content.style.display === 'block' ? 'none' : 'block';
            });
        });
    </script>
</body>
</html>
