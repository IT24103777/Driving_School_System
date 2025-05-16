document.addEventListener('DOMContentLoaded', function() {
    // Enhanced smooth scrolling for navigation
    document.querySelectorAll('nav a').forEach(anchor => {
        anchor.addEventListener('click', function(e) {
            if(this.getAttribute('href').startsWith('#')) {
                e.preventDefault();
                const target = document.querySelector(this.getAttribute('href'));
                if(target) {
                    window.scrollTo({
                        top: target.offsetTop - 80,
                        behavior: 'smooth'
                    });
                    history.pushState(null, null, this.getAttribute('href'));
                }
            }
        });
    });

    // Animate course sections on scroll
    const animateOnScroll = () => {
        const sections = document.querySelectorAll('.course-detail-content');
        const windowHeight = window.innerHeight;

        sections.forEach(section => {
            const sectionTop = section.getBoundingClientRect().top;
            const sectionVisible = 150;

            if(sectionTop < windowHeight - sectionVisible) {
                section.style.opacity = '1';
                section.style.transform = 'translateY(0)';
            }
        });
    };

    // Set initial state for animations
    document.querySelectorAll('.course-detail-content').forEach(section => {
        section.style.opacity = '0';
        section.style.transform = 'translateY(30px)';
        section.style.transition = 'all 0.6s ease-out';
    });

    // Run once on load
    animateOnScroll();

    // Then run on scroll
    window.addEventListener('scroll', animateOnScroll);

    // Enhanced registration button effects
    const registerBtn = document.querySelector('.register-now-btn');
    if(registerBtn) {
        // Pulse animation
        registerBtn.style.animation = 'pulse 2s infinite';

        registerBtn.addEventListener('mouseenter', () => {
            registerBtn.style.animation = 'none';
            registerBtn.style.transform = 'scale(1.05)';
        });

        registerBtn.addEventListener('mouseleave', () => {
            registerBtn.style.animation = 'pulse 2s infinite';
            registerBtn.style.transform = 'scale(1)';
        });

        registerBtn.addEventListener('click', function(e) {
            if(!this.getAttribute('href').startsWith('#')) {
                // Add click effect
                this.style.transform = 'scale(0.95)';
                setTimeout(() => {
                    this.style.transform = 'scale(1)';
                }, 200);
            }
        });
    }

    // Add animation styles dynamically
    const style = document.createElement('style');
    style.textContent = `
        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.03); }
            100% { transform: scale(1); }
        }
    `;
    document.head.appendChild(style);

    // Handle form submission if present
    const registrationForm = document.querySelector('form');
    if(registrationForm) {
        registrationForm.addEventListener('submit', function(e) {
            e.preventDefault();
            // Form validation
            const formData = new FormData(this);
            const data = Object.fromEntries(formData.entries());

            if(!data.name || !data.email) {
                alert('Please fill in all required fields');
                return;
            }

            // Simulate form submission
            console.log('Form submitted:', data);
            alert('Thank you for registering for the Beginner Course! We will contact you shortly.');
            this.reset();
        });
    }
});