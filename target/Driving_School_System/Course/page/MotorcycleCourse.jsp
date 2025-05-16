<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DRIVE EASY SCHOOL - Motorcycle Course</title>
    <link rel="stylesheet" href="../css/MotorcycleCourse.css">
</head>
<body>
<header>
    <div class="header-container">
        <h1>DRIVE EASY SCHOOL</h1>
        <nav>
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="courses.jsp">Courses</a></li>
                <li><a href="schedule.jsp">Schedule</a></li>
                <li><a href="contact.jsp">Contact</a></li>
            </ul>
        </nav>
    </div>
</header>

<main class="main-container">
    <section class="course-detail-section">
        <div class="course-detail-header">
            <h2 class="course-detail-title">Motorcycle Riding Course</h2>
            <span class="course-detail-badge">New</span>
        </div>

        <div class="course-detail-description">
            <p>Comprehensive training for motorcycle riders of all levels, from beginners to experienced riders looking to refine their skills.</p>
            <div class="course-details">
                <span><i class="icon-clock"></i><strong>Duration:</strong> 18 hours</span>
                <span><i class="icon-price"></i><strong>Price:</strong> $400</span>
            </div>
        </div>

        <div class="course-detail-content">
            <h3>Course Overview</h3>
            <p>Our Motorcycle Safety Foundation-certified course provides hands-on training to develop the skills and knowledge needed to ride safely on today's roads.</p>
        </div>

        <div class="course-detail-content">
            <h3>What You'll Learn</h3>
            <ul class="course-modules">
                <li>Motorcycle controls and operation</li>
                <li>Basic riding skills and techniques</li>
                <li>Street riding strategies</li>
                <li>Cornering and swerving techniques</li>
                <li>Emergency braking</li>
                <li>Riding in traffic</li>
                <li>Protective gear selection</li>
                <li>Motorcycle maintenance basics</li>
            </ul>
        </div>

        <div class="course-detail-content">
            <h3>Course Structure</h3>
            <p>The course consists of 6 classroom sessions (1.5 hours each) and 6 range sessions (2 hours each) with our provided motorcycles.</p>
        </div>

        <div class="course-detail-content">
            <h3>Requirements</h3>
            <p>To enroll in this course, you must:</p>
            <div class="course-requirements">
                <ul>
                    <li>Be at least 16 years old</li>
                    <li>Have a valid driver's license or learner's permit</li>
                    <li>Wear appropriate riding gear (helmet, gloves, etc.)</li>
                    <li>No prior motorcycle experience required for beginner course</li>
                </ul>
            </div>
        </div>

        <a href="register.jsp?course=motorcycle" class="register-now-btn">Register Now</a>
    </section>
</main>

<script src="../js/MotorcycleCourse.js"></script>
</body>
</html>
