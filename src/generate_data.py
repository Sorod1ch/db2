from faker import Faker
import psycopg2
import random

def generate_and_insert_dummy_data(num_records=1000):
    conn = psycopg2.connect(
        dbname='myhw5',
        user='rodion1',
        password='12345',
        host='localhost'

    )
    cur = conn.cursor()
    fake = Faker()

    for i in range(num_records):
        # Генерируем уникальный email
        unique_number = random.randint(100000, 999999)
        email = f"{fake.email().split('@')[0]}{unique_number}@{fake.email().split('@')[1]}"

        cur.execute(
            "INSERT INTO users (last_name, first_name, birth_date, profession, nationality, phone_number, email) VALUES (%s, %s, %s, %s, %s, %s, %s)",
            (
                fake.last_name(), 
                fake.first_name(), 
                fake.date_of_birth(minimum_age=18, maximum_age=60),
                fake.job(), 
                fake.country(), 
                fake.phone_number()[:20], 
                email
            )
        )
    conn.commit()
    cur.close()
    conn.close()

if __name__ == "__main__":
    generate_and_insert_dummy_data()
