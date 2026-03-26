import mysql.connector
import time
from datetime import datetime

# Database configuration
db_config = {
    'host': 'localhost',
    'port': 3306,
    'user': 'root',
    'password': 'Welcome123',
    'database': 'food_app'
}

def check_expiry():
    conn = None
    cursor = None

    try:
        print(f"[{datetime.now()}] Checking for expired donations...")

        # Connect to database
        conn = mysql.connector.connect(**db_config)
        cursor = conn.cursor()

        # Update expired donations using MySQL server time
        query = """
        UPDATE donations
        SET status = 'EXPIRED'
        WHERE expiry_time <= NOW()
        AND status = 'CREATED'
        """

        cursor.execute(query)
        affected_rows = cursor.rowcount

        if affected_rows > 0:
            conn.commit()
            print(f"{affected_rows} donation(s) marked as EXPIRED.")
        else:
            print("No expired donations found.")

    except mysql.connector.Error as err:
        print(f"Database Error: {err}")

    finally:
        # Close cursor and connection safely
        if cursor:
            cursor.close()
        if conn and conn.is_connected():
            conn.close()

if __name__ == "__main__":
    print("Expiry Worker Started...")

    while True:
        check_expiry()

        # Wait for 60 seconds before next check
        time.sleep(60)