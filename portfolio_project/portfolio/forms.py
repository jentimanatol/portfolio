from django import forms
from .models import ContactMessage

class ContactForm(forms.ModelForm):
    class Meta:
        model = ContactMessage
        fields = ['name', 'email', 'subject', 'message']
        widgets = {
            'name': forms.TextInput(attrs={'id': 'name', 'required': True}),
            'email': forms.EmailInput(attrs={'id': 'email', 'required': True}),
            'subject': forms.TextInput(attrs={'id': 'subject', 'required': True}),
            'message': forms.Textarea(attrs={'id': 'message', 'required': True}),
        }