document.addEventListener('DOMContentLoaded', function() {
    // Smooth scrolling for navigation links
    document.querySelectorAll('nav a').forEach(anchor => {
        anchor.addEventListener('click', function(e) {
            e.preventDefault();

            const targetId = this.getAttribute('href');
            if(targetId === '#') return;

            const targetElement = document.querySelector(targetId);
            if(targetElement) {
                window.scrollTo({
                    top: targetElement.offsetTop - 80,
                    behavior: 'smooth'
                });

                // Update URL without page reload
                history.pushState(null, null, targetId);
            }
        });
    });

    // Animate course cards on scroll
    const observerOptions = {
        threshold: 0.1
    };

    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if(entry.isIntersecting) {
                entry.target.style.opacity = 1;
                entry.target.style.transform = 'translateY(0)';
            }
        });
    }, observerOptions);

    // Apply animation to course sections
    const courseSections = document.querySelectorAll('.course-detail-content');
    courseSections.forEach((section, index) => {
        section.style.opacity = 0;
        section.style.transform = 'translateY(20px)';
        section.style.transition = `all 0.5s ease ${index * 0.1}s`;
        observer.observe(section);
    });

    // Enhanced registration button interaction
    const registerBtn = document.querySelector('.register-now-btn');
    if(registerBtn) {
        registerBtn.addEventListener('mouseenter', function() {
            this.style.boxShadow = '0 6px 12px rgba(0,0,0,0.15)';
        });

        registerBtn.addEventListener('mouseleave', function() {
            this.style.boxShadow = '0 4px 8px rgba(0,0,0,0.1)';
        });
    }

    // Handle browser back/forward navigation
    window.addEventListener('popstate', function() {
        const hash = window.location.hash;
        if(hash) {
            const target = document.querySelector(hash);
            if(target) {
                window.scrollTo({
                    top: target.offsetTop - 80,
                    behavior: 'smooth'
                });
            }
        }
    });
});

// Function to handle registration form submission
function handleRegistration(event) {
    event.preventDefault();

    // Get form data
    const formData = new FormData(event.target);
    const data = Object.fromEntries(formData.entries());

    // Simple validation
    if(!data.name || !data.email) {
        alert('Please fill in all required fields');
        return;
    }

    // In a real application, you would send this to a server
    console.log('Registration data:', data);

    // Show success message
    alert('Thank you for registering! We will contact you shortly with more details.');

    // Reset form
    event.target.reset();
}