import os
import django

# Set the Django settings module
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'Yum_Base.settings')

# Initialize Django
django.setup()

# Now you can access Django settings and perform database connection testing
from django.conf import settings
from django.db import connections

def test_database_connection():
    try:
        # Attempt to access the 'default' database connection
        with connections['default'].cursor() as cursor:
            # Execute a test SQL query to confirm connection
            cursor.execute("SELECT 1")
            # If no errors occur, the connection is successful
            print("Database connection successful")
            return True
    except Exception as e:
        # If any errors occur during connection or query execution, print the error message
        print("Database connection failed:", str(e))
        return False

if __name__ == "__main__":
    test_database_connection()
