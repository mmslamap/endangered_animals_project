import json
import psycopg2

conn = psycopg2.connect(
    dbname="endangered_animals",
    user="YOUR_USERNAME",
    password="YOUR_PASSWORD",
    host="localhost",
    port="5432"
)

cur = conn.cursor()

with open('country_set.json', 'r') as f:
    country_data = json.load(f)

with open('threat_list.json', 'r') as f:
    threat_data = json.load(f)

with open("parsed_animal_data.json") as f:
    animal_data = json.load(f)

def insert_countries():
    for country in country_data:
        cur.execute("""
            INSERT INTO countries (name)
            VALUES (%s)
            ON CONFLICT (name) DO NOTHING
        """, (country,))

def insert_threats():
    for threat in threat_data:
        cur.execute("""
            INSERT INTO threats (name)
            VALUES (%s)
            ON CONFLICT (name) DO NOTHING
        """, (threat,))

def insert_animals():
    for animal in animal_data:
        cur.execute("""
            INSERT INTO animals (id, common_name, scientific_name, red_list_category, possibly_extinct_in_the_wild)
            VALUES (%s, %s, %s, %s, %s) RETURNING id
        """, (animal['id'], animal['common_name'], animal['scientific_name'], animal['red_list_category'], animal['possibly_extinct_in_the_wild']))
        
        animal_id = cur.fetchone()[0]

        for location in animal["locations"]:
            cur.execute("""
                SELECT id FROM countries WHERE name = %s
            """, (location,))
            country_id = cur.fetchone()
            if country_id:
                cur.execute("""
                    INSERT INTO animal_countries (animal_id, country_id)
                    VALUES (%s, %s)
                """, (animal_id, country_id[0]))

        for threat in animal['threats']:
            cur.execute("""
                SELECT id FROM threats WHERE name = %s
            """, (threat,))
            threat_id = cur.fetchone()
            if threat_id:
                cur.execute("""
                    INSERT INTO animal_threats (animal_id, threat_id)
                    VALUES (%s, %s)
                """, (animal_id, threat_id[0]))

try:
    insert_countries()
    insert_threats()
    insert_animals()
    conn.commit()  
except Exception as e:
    print(f"Error occurred: {e}")
    conn.rollback()  
finally:
    cur.close()  
    conn.close()  

print("Data insertion complete.")
