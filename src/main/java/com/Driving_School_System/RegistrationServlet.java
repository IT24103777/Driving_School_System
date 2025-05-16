package com.Driving_School_System;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeParseException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/processRegistration")
public class RegistrationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Set character encoding and content type
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        // Get form parameters
        String fullName = sanitizeInput(request.getParameter("fullName"));
        String email = sanitizeInput(request.getParameter("email"));
        String phone = sanitizeInput(request.getParameter("phone"));
        String dobStr = request.getParameter("dob");
        String gender = sanitizeInput(request.getParameter("gender"));
        String courseType = sanitizeInput(request.getParameter("courseType"));
        String experience = sanitizeInput(request.getParameter("experience"));
        String hasPermit = request.getParameter("hasPermit");
        String agreeTerms = request.getParameter("agreeTerms");

        // Validate required fields
        boolean hasErrors = false;
        StringBuilder errorMessage = new StringBuilder();

        if (fullName == null || fullName.trim().isEmpty() || !fullName.matches("[A-Za-z ]{3,50}")) {
            hasErrors = true;
            errorMessage.append("Full name is required and should be 3-50 alphabetic characters.<br>");
        }

        if (email == null || email.trim().isEmpty() || !email.matches("^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$")) {
            hasErrors = true;
            errorMessage.append("Valid email is required.<br>");
        }

        if (phone == null || phone.trim().isEmpty() || !phone.matches("^[0-9]{10,15}$")) {
            hasErrors = true;
            errorMessage.append("Valid phone number (10-15 digits) is required.<br>");
        }

        LocalDate dob = null;
        try {
            dob = LocalDate.parse(dobStr);
            // Check if age is at least 16
            if (dob.plusYears(16).isAfter(LocalDate.now())) {
                hasErrors = true;
                errorMessage.append("You must be at least 16 years old to register.<br>");
            }
        } catch (DateTimeParseException e) {
            hasErrors = true;
            errorMessage.append("Valid date of birth is required.<br>");
        }

        if (courseType == null || courseType.trim().isEmpty() ||
                !(courseType.equals("beginner") || courseType.equals("intermediate") ||
                        courseType.equals("advanced") || courseType.equals("defensive"))) {
            hasErrors = true;
            errorMessage.append("Please select a valid course.<br>");
        }

        if (experience == null || experience.trim().isEmpty() ||
                !(experience.equals("none") || experience.equals("some") || experience.equals("licensed"))) {
            hasErrors = true;
            errorMessage.append("Please select your experience level.<br>");
        }

        if (agreeTerms == null) {
            hasErrors = true;
            errorMessage.append("You must agree to the terms and conditions.<br>");
        }

        // If there are errors, forward back to the form with error messages
        if (hasErrors) {
            request.setAttribute("errorMessage", errorMessage.toString());
            // Preserve user input
            request.setAttribute("fullName", fullName);
            request.setAttribute("email", email);
            request.setAttribute("phone", phone);
            request.setAttribute("dob", dobStr);
            request.setAttribute("gender", gender);
            request.setAttribute("courseType", courseType);
            request.setAttribute("experience", experience);
            request.setAttribute("hasPermit", hasPermit);
            request.setAttribute("agreeTerms", agreeTerms);

            request.getRequestDispatcher("/Course/page/register.jsp").forward(request, response);
            return;
        }

        // Process the registration (in a real app, you'd save to database here)
        try {
            // Simulate processing delay
            Thread.sleep(1000);

            // Set success attributes
            request.setAttribute("success", true);
            request.setAttribute("fullName", fullName);
            request.setAttribute("courseTypeDisplay", getCourseDisplayName(courseType));

            // Forward to the JSP to show success message
            request.getRequestDispatcher("/Course/page/Successfully.jsp").forward(request, response);

        } catch (InterruptedException e) {
            errorMessage.append("An error occurred during registration. Please try again.");
            request.setAttribute("errorMessage", errorMessage.toString());
            request.getRequestDispatcher("/Course/page/register.jsp").forward(request, response);
        }
    }

    private String getCourseDisplayName(String courseType) {
        switch (courseType) {
            case "beginner": return "Beginner's Course";
            case "intermediate": return "Intermediate Course";
            case "advanced": return "Advanced Driving Course";
            case "defensive": return "Defensive Driving Course";
            default: return "Selected Course";
        }
    }

    private String sanitizeInput(String input) {
        if (input == null) {
            return "";
        }
        return input.trim();
    }
}