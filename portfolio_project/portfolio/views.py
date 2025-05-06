from django.shortcuts import render, redirect
from django.contrib import messages
from .forms import ContactForm
from django.http import HttpResponse
import json
from .models import ContactMessage

def home(request):
    return render(request, 'portfolio/home.html')

def about(request):
    return render(request, 'portfolio/about.html')

def projects(request):
    return render(request, 'portfolio/projects.html')

def contact(request):
    if request.method == 'POST':
        form = ContactForm(request.POST)
        if form.is_valid():
            try:
                # Save the form and get the instance
                contact_message = form.save()
                
                # Debug: Print the ID of the saved instance
                print(f"Message saved with ID: {contact_message.id}")
                
                messages.success(request, 'Your message has been sent successfully!')
                return redirect('contact')
            except Exception as e:
                # Debug: Print any exception that occurs
                print(f"Error saving form: {str(e)}")
                messages.error(request, f'Database Error: {str(e)}')
        else:
            # Debug: Print form errors
            print(f"Form validation errors: {form.errors}")
            messages.error(request, 'Error! Please check your form data.')
    else:
        form = ContactForm()
    
    # Check if there are any messages in the database
    message_count = ContactMessage.objects.count()
    print(f"Current message count in database: {message_count}")
    
    return render(request, 'portfolio/contact.html', {'form': form})

def debug_db(request):
    """A debug view to check database connection and contents"""
    try:
        # Get all messages from the database
        all_messages = ContactMessage.objects.all()
        
        # Format them as JSON
        messages_data = [
            {
                'id': msg.id,
                'name': msg.name,
                'email': msg.email,
                'subject': msg.subject,
                'message': msg.message,
                'created_at': str(msg.created_at)
            }
            for msg in all_messages
        ]
        
        # Also get database connection info
        from django.db import connection
        db_info = {
            'engine': connection.settings_dict['ENGINE'],
            'name': connection.settings_dict['NAME'],
            'user': connection.settings_dict.get('USER', 'Not specified'),
            'host': connection.settings_dict.get('HOST', 'Not specified'),
        }
        
        # Return as JSON response
        response_data = {
            'db_info': db_info,
            'message_count': len(messages_data),
            'messages': messages_data
        }
        
        return HttpResponse(
            json.dumps(response_data, indent=2),
            content_type='application/json'
        )
    except Exception as e:
        return HttpResponse(f"Error: {str(e)}", status=500)