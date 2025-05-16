document.addEventListener('DOMContentLoaded', function() {
    // Get URL parameters to set the course
    const urlParams = new URLSearchParams(window.location.search);
    const courseType = urlParams.get('course');
    const courseSelect = document.getElementById('courseSelect');

    // Set course selection if coming from a course page
    if (courseType && courseSelect) {
        courseSelect.value = courseType;
    }

    // Form validation
    const form = document.getElementById('registrationForm');
    const requiredFields = form.querySelectorAll('[required]');

    // Add real-time validation
    requiredFields.forEach(field => {
        field.addEventListener('input', function() {
            validateField(this);
        });

        field.addEventListener('blur', function() {
            validateField(this);
        });
    });

    function validateField(field) {
        const errorElement = field.parentElement.querySelector('.error-message');

        if (field.checkValidity()) {
            field.classList.remove('invalid');
            errorElement.textContent = '';
        } else {
            field.classList.add('invalid');

            if (field.validity.valueMissing) {
                if (field.id === 'courseSelect') {
                    errorElement.textContent = 'Please select a course';
                } else {
                    errorElement.textContent = 'This field is required';
                }
            } else if (field.validity.typeMismatch) {
                if (field.type === 'email') {
                    errorElement.textContent = 'Please enter a valid email address';
                }
            } else if (field.validity.patternMismatch) {
                if (field.id === 'phone') {
                    errorElement.textContent = 'Please enter a valid phone number';
                }
            }
        }
    }

    // Phone number formatting
    const phoneInput = document.getElementById('phone');
    if (phoneInput) {
        phoneInput.addEventListener('input', function(e) {
            const x = e.target.value.replace(/\D/g, '').match(/(\d{0,3})(\d{0,3})(\d{0,4})/);
            e.target.value = !x[2] ? x[1] : '(' + x[1] + ') ' + x[2] + (x[3] ? '-' + x[3] : '');
        });
    }

    // Form submission
    if (form) {
        form.addEventListener('submit', function(e) {
            e.preventDefault();

            let isValid = true;

            // Validate all required fields
            requiredFields.forEach(field => {
                validateField(field);
                if (!field.checkValidity()) {
                    isValid = false;
                }
            });

            // Validate terms checkbox separately
            const termsCheckbox = document.getElementById('agreeTerms');
            const termsError = termsCheckbox ? termsCheckbox.parentElement.querySelector('.error-message') : null;

            if (termsCheckbox && !termsCheckbox.checked) {
                termsError.textContent = 'You must agree to the terms and conditions';
                isValid = false;
            } else if (termsError) {
                termsError.textContent = '';
            }

            if (isValid) {
                showSuccessModal();

                // In production, you would uncomment and use this AJAX call:
                /*
                const formData = new FormData(form);
                fetch(form.action, {
                    method: 'POST',
                    body: formData
                })
                .then(response => {
                    if (response.ok) {
                        showSuccessModal();
                        form.reset();
                    } else {
                        alert('There was an error submitting your form. Please try again.');
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                    alert('There was an error submitting your form. Please try again.');
                });
                */
            } else {
                // Scroll to the first error
                const firstError = form.querySelector('.invalid');
                if (firstError) {
                    firstError.scrollIntoView({
                        behavior: 'smooth',
                        block: 'center'
                    });
                }
            }
        });
    }

    // Success modal handling
    const successModal = document.getElementById('successModal');
    const closeSuccessModal = document.getElementById('closeSuccessModal');

    function showSuccessModal() {
        if (successModal) {
            successModal.style.display = 'block';
            document.body.style.overflow = 'hidden';
        }
    }

    function hideSuccessModal() {
        if (successModal) {
            successModal.style.display = 'none';
            document.body.style.overflow = 'auto';
        }
    }

    if (closeSuccessModal) {
        closeSuccessModal.addEventListener('click', hideSuccessModal);
    }

    // Close modal when clicking outside
    window.addEventListener('click', function(e) {
        if (e.target === successModal) {
            hideSuccessModal();
        }
    });

    // Date picker max date (must be at least 16 years old)
    const dobInput = document.getElementById('dob');
    if (dobInput) {
        const today = new Date();
        const minDate = new Date();
        minDate.setFullYear(today.getFullYear() - 16);
        dobInput.max = minDate.toISOString().split('T')[0];
    }
});