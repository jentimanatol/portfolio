"""
Quick script to check your Django database settings.
Save this as check_settings.py in your project root directory.
Run with: python check_settings.py
"""

import os
import importlib
import sys

# Add the project directory to the Python path
current_dir = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, current_dir)

# Set Django settings module environment variable
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'portfolio_project.settings')

# Import settings
try:
    settings_module = importlib.import_module('portfolio_project.settings')
    
    # Print DATABASE settings
    print("\nDATABASE SETTINGS:")
    print("-----------------")
    for key, db_config in settings_module.DATABASES.items():
        print(f"Database: {key}")
        print(f"  ENGINE: {db_config.get('ENGINE', 'Not specified')}")
        print(f"  NAME: {db_config.get('NAME', 'Not specified')}")
        print(f"  USER: {db_config.get('USER', 'Not specified')}")
        print(f"  HOST: {db_config.get('HOST', 'Not specified')}")
        print(f"  PORT: {db_config.get('PORT', 'Not specified')}")
        print()
    
    # Print INSTALLED_APPS
    print("INSTALLED APPS:")
    print("--------------")
    for app in settings_module.INSTALLED_APPS:
        print(f"  {app}")
    
except ImportError as e:
    print(f"Error importing settings: {e}")
    print("Make sure you're in the correct directory and that settings.py exists.")
except AttributeError as e:
    print(f"Attribute error: {e}")
    print("Make sure DATABASES is defined in your settings file.")
except Exception as e:
    print(f"Unexpected error: {e}")