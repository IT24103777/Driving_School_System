<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register | DRIVE EASY SCHOOL</title>
    <link rel="stylesheet" href="../../Course/css/register.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<div class="registration-container">
    <div class="registration-header">
        <h1><i class="fas fa-car"></i> Course Registration</h1>
        <p>Please fill out this form to register for your selected course</p>
    </div>

    <%-- Display error message if present --%>
    <% if (request.getAttribute("errorMessage") != null) { %>
    <div class="error-alert">
        <i class="fas fa-exclamation-circle"></i>
        ${errorMessage}
    </div>
    <% } %>

    <form id="registrationForm" class="registration-form" action="${pageContext.request.contextPath}/processRegistration" method="POST">
        <!-- Personal Information Section -->
        <fieldset>
            <legend><i class="fas fa-user"></i> Personal Information</legend>

            <div class="form-group">
                <label for="fullName">Full Name*</label>
                <input type="text" id="fullName" name="fullName"
                       value="${not empty param.fullName ? param.fullName : (not empty fullName ? fullName : '')}"
                       required pattern="[A-Za-z ]{3,50}" title="Name should be 3-50 alphabetic characters">
                <span class="error-message"></span>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label for="email">Email*</label>
                    <input type="email" id="email" name="email"
                           value="${not empty param.email ? param.email : (not empty email ? email : '')}" required>
                    <span class="error-message"></span>
                </div>

                <div class="form-group">
                    <label for="phone">Phone*</label>
                    <input type="tel" id="phone" name="phone"
                           value="${not empty param.phone ? param.phone : (not empty phone ? phone : '')}"
                           required pattern="[0-9]{10,15}" title="Phone number should be 10-15 digits">
                    <span class="error-message"></span>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label for="dob">Date of Birth*</label>
                    <input type="date" id="dob" name="dob"
                           value="${not empty param.dob ? param.dob : (not empty dob ? dob : '')}" required>
                    <span class="error-message"></span>
                </div>

                <div class="form-group">
                    <label for="gender">Gender</label>
                    <select id="gender" name="gender">
                        <option value="">Select</option>
                        <option value="male" ${(param.gender == 'male' || gender == 'male') ? 'selected' : ''}>Male</option>
                        <option value="female" ${(param.gender == 'female' || gender == 'female') ? 'selected' : ''}>Female</option>
                        <option value="other" ${(param.gender == 'other' || gender == 'other') ? 'selected' : ''}>Other</option>
                        <option value="prefer-not-to-say" ${(param.gender == 'prefer-not-to-say' || gender == 'prefer-not-to-say') ? 'selected' : ''}>Prefer not to say</option>
                    </select>
                </div>
            </div>
        </fieldset>

        <!-- Course Information Section -->
        <fieldset>
            <legend><i class="fas fa-book"></i> Course Information</legend>

            <div class="form-group">
                <label for="courseSelect">Select Course*</label>
                <select id="courseSelect" name="courseType" required>
                    <option value="">-- Select a course --</option>
                    <option value="beginner" ${(param.courseType == 'beginner' || courseType == 'beginner') ? 'selected' : ''}>Beginner's Course</option>
                    <option value="intermediate" ${(param.courseType == 'intermediate' || courseType == 'intermediate') ? 'selected' : ''}>Intermediate Course</option>
                    <option value="advanced" ${(param.courseType == 'advanced' || courseType == 'advanced') ? 'selected' : ''}>Advanced Driving Course</option>
                    <option value="defensive" ${(param.courseType == 'defensive' || courseType == 'defensive') ? 'selected' : ''}>Defensive Driving Course</option>
                </select>
                <span class="error-message"></span>
            </div>

            <div class="form-group">
                <label for="experience">Driving Experience*</label>
                <select id="experience" name="experience" required>
                    <option value="">Select your experience level</option>
                    <option value="none" ${(param.experience == 'none' || experience == 'none') ? 'selected' : ''}>No experience</option>
                    <option value="some" ${(param.experience == 'some' || experience == 'some') ? 'selected' : ''}>Some experience (no license)</option>
                    <option value="licensed" ${(param.experience == 'licensed' || experience == 'licensed') ? 'selected' : ''}>Licensed driver (refresher course)</option>
                </select>
            </div>

            <div class="form-group checkbox-group">
                <input type="checkbox" id="hasPermit" name="hasPermit"
                ${(param.hasPermit == 'on' || hasPermit == 'on') ? 'checked' : ''}>
                <label for="hasPermit">I already have a learner's permit</label>
            </div>
        </fieldset>

        <!-- Terms and Submission -->
        <div class="form-group checkbox-group terms-group">
            <input type="checkbox" id="agreeTerms" name="agreeTerms" required
            ${(param.agreeTerms == 'on' || agreeTerms == 'on') ? 'checked' : ''}>
            <label for="agreeTerms">I agree to the <a href="${pageContext.request.contextPath}/terms" target="_blank">terms and conditions</a>*</label>
            <span class="error-message"></span>
        </div>

        <div class="form-actions">
            <button type="submit" class="submit-btn">
                <i class="fas fa-paper-plane"></i> Submit Application
            </button>
            <a href="${pageContext.request.contextPath}/courses" class="cancel-btn">
                <i class="fas fa-times"></i> Cancel
            </a>
        </div>
    </form>
</div>

<!-- Success Modal -->
<div id="successModal" class="modal" style="display: ${success != null ? 'block' : 'none'};">
    <div class="modal-content">
        <div class="success-icon">
            <i class="fas fa-check-circle"></i>
        </div>
        <h2>Registration Successful!</h2>
        <p>Thank you ${not empty fullName ? fullName : ''} for registering with Drive Easy School.</p>
        <p>Your registration for <strong>${not empty courseTypeDisplay ? courseTypeDisplay : 'the course'}</strong> has been received.</p>
        <p>We'll contact you within 24 hours to confirm your enrollment.</p>
        <button id="closeSuccessModal" class="modal-close-btn">Continue</button>
    </div>
</div>

<script>
    $(document).ready(function() {
        // Set max date for date of birth (minimum age 16)
        const today = new Date();
        const maxDobDate = new Date(today.getFullYear() - 16, today.getMonth(), today.getDate());
        document.getElementById('dob').max = maxDobDate.toISOString().split('T')[0];

        // Close modal handlers
        $('#closeSuccessModal').click(function() {
            $('#successModal').hide();
            window.location.href = '${pageContext.request.contextPath}/courses';
        });

        window.onclick = function(event) {
            if (event.target == document.getElementById('successModal')) {
                $('#successModal').hide();
                window.location.href = '${pageContext.request.contextPath}/courses';
            }
        };

        // Client-side validation
        $('#registrationForm').submit(function(e) {
            let isValid = true;

            // Clear previous errors
            $('.error-message').text('');
            $('input, select').removeClass('error-input');

            // Validate required fields
            $('[required]').each(function() {
                if (!$(this).val()) {
                    $(this).addClass('error-input');
                    $(this).next('.error-message').text('This field is required');
                    isValid = false;
                }
            });

            // Validate email format
            const email = $('#email').val();
            if (email && !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
                $('#email').addClass('error-input');
                $('#email').next('.error-message').text('Please enter a valid email');
                isValid = false;
            }

            // Validate phone format
            const phone = $('#phone').val();
            if (phone && !/^[0-9]{10,15}$/.test(phone)) {
                $('#phone').addClass('error-input');
                $('#phone').next('.error-message').text('Phone should be 10-15 digits');
                isValid = false;
            }

            if (!isValid) {
                e.preventDefault();
                $('.error-alert').remove();
                $('.registration-header').after(
                    '<div class="error-alert"><i class="fas fa-exclamation-circle"></i> Please correct the errors in the form.</div>'
                );
                $('html, body').animate({
                    scrollTop: $('.error-alert').offset().top - 20
                }, 500);
            }
        });
    });
</script>
</body>
</html>