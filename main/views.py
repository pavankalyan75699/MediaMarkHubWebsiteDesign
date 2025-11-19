from django.shortcuts import render, redirect
from django.core.mail import send_mail
from django.conf import settings
from django.contrib import messages


def home(request):
    """Render the main one-page site."""
    return render(request, "media.html")


def contact_view(request):
    """Handle contact form submission."""
    if request.method == "POST":
        name = request.POST.get("name")
        email = request.POST.get("email")
        mobile = request.POST.get("mobile")
        message = request.POST.get("message")

        full_message = (
            f"Name: {name}\n"
            f"Email: {email}\n"
            f"Mobile: {mobile}\n\n"
            f"Message:\n{message}"
        )

        try:
            send_mail(
                subject=f"New Contact Form Submission from {name}",
                message=full_message,
                from_email=settings.DEFAULT_FROM_EMAIL,
                recipient_list=["mediamarkhub@gmail.com"],
                fail_silently=False,
            )
            messages.success(request, "Your message has been sent successfully!")
            # back to home (you’ll still see the contact section when scrolling)
            return redirect("home")
        except Exception as e:
            messages.error(request, f"Error sending email: {e}")
            # re-render same page so user still sees the form and error
            return render(request, "media.html")

    # If someone hits /contact/ with GET, just show home
    return redirect("home")
