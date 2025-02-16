import json

with open('animal_data.json', 'r') as f:
    animal_data = json.load(f)

parsed_animal_data = []
threat_set = set()
country_set = set()

for animal in animal_data:
    species_taxa = animal.get("taxon", {}).get("species_taxa", [])
    common_name = species_taxa[0].get("common_names", [{}])[0].get("name", "N/A") if species_taxa else "N/A"

    locations = animal.get("locations", [])
    location_descriptions = [loc.get("description", {}).get("en", "N/A") for loc in locations]
    
    for location in location_descriptions:
        country_set.add(location)

    threats = animal.get("threats", [])
    excluded_phrases = ["Unspecified species", "Named species", "Unintentional", "Intentional", "Type Unknown/Unrecorded"]
    threat_descriptions = [
        threat.get("description", {}).get("en", "N/A")
        for threat in threats
            if not any(phrase in threat.get("description", {}).get("en", "N/A") for phrase in excluded_phrases)
    ]

    for threat in threat_descriptions:
        threat_set.add(threat)

    parsed_animal_data.append({
        "id": animal.get("assessment_id", "ERROR"),
        "possibly_extinct_in_the_wild": animal.get("possibly_extinct_in_the_wild", "N/A"),
        "scientific_name": animal.get("taxon", {}).get("scientific_name", "N/A"),
        "common_name": common_name,
        "population_trend": animal.get("population_trend", {}).get("description", {}).get("en", "N/A"),
        "red_list_category": animal.get("red_list_category", {}).get("description", {}).get("en", "N/A"),
        "locations": location_descriptions,
        "threats": threat_descriptions
    })

with open("threat_list.json", "w") as f:
    json.dump(list(threat_set), f)

with open("country_set.json", "w") as f:
    json.dump(list(country_set), f)

with open("parsed_animal_data.json", "w") as f:
    json.dump(parsed_animal_data, f, indent = 4)

print("Parsing complete.")