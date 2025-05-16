document.addEventListener('DOMContentLoaded', function() {
    // Add smooth scrolling to all links
    const links = document.querySelectorAll('a[href^="#"]');

    for (const link of links) {
        link.addEventListener('click', function(e) {
            e.preventDefault();

            const targetId = this.getAttribute('href');
            if (targetId === '#') return;

            const targetElement = document.querySelector(targetId);
            if (targetElement) {
                targetElement.scrollIntoView({
                    behavior: 'smooth'
                });
            }
        });
    }

    // Highlight current page in navigation
    const currentPage = window.location.pathname.split('/').pop();
    const navLinks = document.querySelectorAll('nav ul li a');

    navLinks.forEach(link => {
        if (link.getAttribute('href') === currentPage) {
            link.classList.add('active');
        }
    });

    // Add animation to course details sections
    const courseSections = document.querySelectorAll('.course-detail-content');

    function animateOnScroll() {
        courseSections.forEach(section => {
            const sectionPosition = section.getBoundingClientRect().top;
            const screenPosition = window.innerHeight / 1.3;

            if (sectionPosition < screenPosition) {
                section.style.opacity = '1';
                section.style.transform = 'translateY(0)';
            }
        });
    }

    // Set initial state
    courseSections.forEach(section => {
        section.style.opacity = '0';
        section.style.transform = 'translateY(20px)';
        section.style.transition = 'opacity 0.5s ease, transform 0.5s ease';
    });

    // Add event listener for scroll
    window.addEventListener('scroll', animateOnScroll);

    // Trigger once on page load
    animateOnScroll();

    // Registration button click handler
    const registerBtn = document.querySelector('.register-now-btn');
    if (registerBtn) {
        registerBtn.addEventListener('click', function(e) {
            // You can add additional functionality here
            console.log('Register button clicked for Beginner Course');
            // For example, track analytics or show a confirmation
        });
    }
});