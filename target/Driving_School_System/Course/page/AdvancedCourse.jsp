<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DRIVE EASY SCHOOL - Advanced Course</title>
    <link rel="stylesheet" href="../css/AdvancedCourse.css">
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
            <h2 class="course-detail-title">Advanced Course</h2>
            <span class="course-detail-badge">Most Popular</span>
        </div>

        <div class="course-detail-description">
            <p>The best option for first-time drivers. Learn the basics of vehicle operation, traffic rules, and safe driving practices.</p>
            <div class="course-details">
                <span><i class="icon-clock"></i><strong>Duration:</strong> 20 hours</span>
                <span><i class="icon-price"></i><strong>Price:</strong> $300</span>
            </div>
        </div>

        <div class="course-detail-content">
            <h3>Course Overview</h3>
            <p>This comprehensive beginner's course is designed to take you from no experience to a confident, safe driver. Our certified instructors will guide you through every step of the learning process.</p>
        </div>

        <div class="course-detail-content">
            <h3>What You'll Learn</h3>
            <ul class="course-modules">
                <li>Vehicle controls and operation</li>
                <li>Basic traffic laws and regulations</li>
                <li>Starting, stopping, and steering techniques</li>
                <li>Parking maneuvers (parallel, angle, and perpendicular)</li>
                <li>Defensive driving fundamentals</li>
                <li>Handling intersections and traffic signals</li>
                <li>City and highway driving techniques</li>
                <li>Emergency procedures</li>
            </ul>
        </div>

        <div class="course-detail-content">
            <h3>Course Structure</h3>
            <p>The course consists of 10 classroom sessions (2 hours each) and 10 behind-the-wheel training sessions (1 hour each).</p>
        </div>

        <div class="course-detail-content">
            <h3>Requirements</h3>
            <p>To enroll in this course, you must:</p>
            <div class="course-requirements">
                <ul>
                    <li>Be at least 16 years old</li>
                    <li>Have a valid learner's permit</li>
                    <li>Complete a vision test</li>
                    <li>No prior driving experience required</li>
                </ul>
            </div>
        </div>

        <a href="register.jsp?course=beginner" class="register-now-btn">Register Now</a>
    </section>
</main>

<script src="../js/AdvancedCourse.js"></script>
</body>
</html>
