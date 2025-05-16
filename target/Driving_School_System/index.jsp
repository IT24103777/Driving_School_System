<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Drive Eazy School</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            line-height: 1.6;
            background-image: url('https://images.unsplash.com/photo-1502224562085-639556652f33?ixlib=rb-1.2.1&auto=format&fit=crop&w=1920&q=80');
            background-size: cover;
            background-attachment: fixed;
            background-position: center;
            background-color: #f5f5f5;
        }

        body::before {
            content: "";
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(255, 255, 255, 0.85);
            z-index: -1;
        }

        header {
            background-color: #2c3e50;
            color: #fff;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
        }

        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1.5rem 3rem;
        }

        .logo {
            font-size: 1.8rem;
            font-weight: bold;
            color: #fff;
        }

        .nav-links {
            display: flex;
            gap: 2rem;
        }

        .nav-links a {
            color: #fff;
            text-decoration: none;
            font-weight: 500;
            font-size: 1rem;
            transition: all 0.3s ease;
        }

        .nav-links a:hover {
            color: #ffcc00;
            transform: translateY(-2px);
        }


        .container {
            width: 85%;
            margin: 2rem auto;
            overflow: hidden;
            padding: 2rem;
            background: rgba(255, 255, 255, 0.9);
            border-radius: 8px;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
        }

        .courses {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(320px, 1fr));
            gap: 2rem;
            margin-top: 2rem;
        }

        .course-card {
            border: 1px solid #ddd;
            padding: 1.5rem;
            border-radius: 8px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.1);
            background: white;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            overflow: hidden;
        }

        .course-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.15);
        }

        .course-image {
            width: 100%;
            height: 180px;
            object-fit: cover;
            border-radius: 5px;
            margin-bottom: 1rem;
            border: 1px solid #eee;
        }

        .course-card h3 {
            margin-top: 0;
            color: #2c3e50;
            font-size: 1.3rem;
            border-bottom: 2px solid #3498db;
            padding-bottom: 0.5rem;
        }

        .course-card p {
            color: #555;
            margin-bottom: 1.5rem;
        }

        .btn {
            display: inline-block;
            background: #3498db;
            color: white;
            padding: 0.6rem 1.2rem;
            text-decoration: none;
            border-radius: 4px;
            margin-top: 1rem;
            transition: background 0.3s ease;
            font-weight: 500;
        }

        .btn:hover {
            background: #2980b9;
        }

        .welcome-message {
            margin-top: 2rem;
            background: rgba(236, 240, 241, 0.8);
            padding: 1.2rem;
            border-radius: 8px;
            font-style: italic;
            color: #2c3e50;
            text-align: center;
            border-left: 4px solid #e74c3c;
        }

        footer {
            background-color: #2c3e50;
            color: #fff;
            text-align: center;
            padding: 1.5rem 0;
            margin-top: 3rem;
        }
    </style>
</head>
<body>
<header>
    <div class="navbar">
        <div class="logo">DRIVE EASY SCHOOL</div>
        <nav class="nav-links">
            <a href="#">Home</a>
            <a href="#">Courses</a>
            <a href="#">Schedule</a>
            <a href="#">Contact</a>
        </nav>
    </div>
</header>


<div class="container" id="home">
    <h2>Featured Courses</h2>

    <div class="courses">
        <div class="course-card">
            <img src="https://images.unsplash.com/photo-1544620347-c4fd4a3d5957?ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=80" alt="Beginner's Course" class="course-image">
            <h3>Beginner's Course</h3>
            <p>Perfect for first-time drivers. Learn the basics of road safety and vehicle control.</p>
            <a href="Course/page/BeginnerCourse.jsp" class="btn">Learn More</a>
        </div>

        <div class="course-card">
            <img src="https://images.unsplash.com/photo-1503376780353-7e6692767b70?ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=80" alt="Advanced Driving" class="course-image">
            <h3>Advanced Driving</h3>
            <p>Improve your skills with highway driving and defensive techniques.</p>
            <a href="Course/page/AdvancedCourse.jsp" class="btn">Learn More</a>
        </div>

        <div class="course-card">
            <img src="https://images.unsplash.com/photo-1558981806-ec527fa84c39?ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=80" alt="Motorcycle Course" class="course-image">
            <h3>Motorcycle Course</h3>
            <p>Special training for Motorcyclists of all levels.</p>
            <a href="Course/page/MotorcycleCourse.jsp" class="btn">Learn More</a>
        </div>

        <div class="course-card">
            <img src="https://images.unsplash.com/photo-1449965408869-eaa3f722e40d?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wxMTc3M3wwfDF8c2VhcmNofDE0fHxkZWZlbnNpdmUlMjBkcml2aW5nfGVufDB8fHx8MTY4Nzc1MTI3N3ww&ixlib=rb-4.0.3&q=80&w=2000" alt="Defensive Driving" class="course-image">
            <h3>Defensive Driving</h3>
            <p>Learn accident avoidance techniques and safe driving strategies.</p>
            <a href="#" class="btn">Learn More</a>
        </div>

        <div class="course-card">
            <img src="https://images.unsplash.com/photo-1486262715619-67b85e0b08d3?ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=80" alt="Commercial License" class="course-image">
            <h3>Commercial License</h3>
            <p>Training for those seeking CDL certification for truck or bus driving.</p>
            <a href="#" class="btn">Learn More</a>
        </div>

        <div class="course-card">
            <img src="https://images.unsplash.com/photo-1483721310020-03333e577078?ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=80" alt="Winter Driving" class="course-image">
            <h3>Winter Driving</h3>
            <p>Specialized training for driving in snow and icy conditions.</p>
            <a href="#" class="btn">Learn More</a>
        </div>

        <div class="course-card">
            <img src="https://bmwpc.nyc3.cdn.digitaloceanspaces.com/images/indy_images/bmw-m4.jpg" alt="Performance Driving" class="course-image">
            <h3>Performance Driving</h3>
            <p>For enthusiasts who want to improve their high-performance driving skills.</p>
            <a href="#" class="btn">Learn More</a>
        </div>

        <div class="course-card">
            <img src="https://greenslips4earth.com.au/wp-content/uploads/2025/01/safe-driving-tips-for-senior-drivers-in-nsw.jpg" alt="Senior Refresher" class="course-image">
            <h3>Senior Refresher</h3>
            <p>Course designed for senior drivers to refresh their skills and knowledge.</p>
            <a href="#" class="btn">Learn More</a>
        </div>
    </div>

    <div class="welcome-message">
        <p>Elite time drivers are warmly welcome!</p>
    </div>
</div>

<footer>
</footer>
</body>
</html>