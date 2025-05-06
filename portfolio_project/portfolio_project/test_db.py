"""
Database connection test script.
Save as test_db.py and run with: python test_db.py
"""

import os
import django
import sys

# Set up Django environment
sys.path.append('.')  # Add current directory to Python path
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'portfolio_project.settings')
django.setup()

# Now test both MySQL connection and Django ORM
def test_mysql_direct():
    """Test direct MySQL connection"""
    try:
        import MySQLdb
        from django.conf import settings
        
        # Get database settings from Django
        db_settings = settings.DATABASES['default']
        
        # Create connection
        print("Attempting direct MySQL connection...")
        conn = MySQLdb.connect(
            host=db_settings.get('HOST', 'localhost'),
            user=db_settings.get('USER', ''),
            passwd=db_settings.get('PASSWORD', ''),
            db=db_settings.get('NAME', '')
        )
        
        # Create cursor and execute a simple query
        cursor = conn.cursor()
        cursor.execute("SHOW TABLES")
        tables = cursor.fetchall()
        
        print("Connection successful! Tables in the database:")
        for table in tables:
            print(f"- {table[0]}")
            
        # Check contact message table specifically
        cursor.execute("SELECT COUNT(*) FROM portfolio_contactmessage")
        count = cursor.fetchone()[0]
        print(f"\nNumber of contact messages in database: {count}")
        
        if count > 0:
            cursor.execute("SELECT id, name, email, subject, created_at FROM portfolio_contactmessage")
            messages = cursor.fetchall()
            print("\nLatest messages:")
            for msg in messages:
                print(f"ID: {msg[0]} - {msg[1]} ({msg[2]}) - {msg[3]} - {msg[4]}")
        
        cursor.close()
        conn.close()
        
    except Exception as e:
        print(f"MySQL direct connection error: {str(e)}")

def test_django_orm():
    """Test Django ORM connection"""
    try:
        from portfolio.models import ContactMessage
        
        print("\nAttempting Django ORM database access...")
        count = ContactMessage.objects.count()
        print(f"Number of contact messages via Django ORM: {count}")
        
        if count > 0:
            messages = ContactMessage.objects.all()
            print("Latest messages via Django ORM:")
            for msg in messages:
                print(f"ID: {msg.id} - {msg.name} ({msg.email}) - {msg.subject} - {msg.created_at}")
    
    except Exception as e:
        print(f"Django ORM error: {str(e)}")

if __name__ == "__main__":
    test_mysql_direct()
    test_django_orm()