import requests
import time
import json

extinct_in_wild_url = 'https://api.iucnredlist.org/api/v4/taxa/possibly_extinct_in_the_wild'

headers = {

    "Authorization": "YOUR_KEY"
}

extinct_response = requests.get(extinct_in_wild_url, headers=headers)
extinct_data = extinct_response.json()

assessment_id_set = set()

for item in extinct_data['assessments']:
    assessment_id_set.add(item['assessment_id'])

assessment_id_url = 'https://api.iucnredlist.org/api/v4/assessment/'

animal_list = []

for item in assessment_id_set:
    assessment_response = requests.get(assessment_id_url + str(item), headers=headers)
    time.sleep(2)
    animal_list.append(assessment_response.json())

with open('animal_data.json', 'w') as f:
    json.dump(animal_list, f, indent=4)

print("Animal data has been saved to 'animal_data.json'.")
