import json

def quitar_tildes(nombre_archivo):
    tilde_mapping = {
        'á': 'a', 'é': 'e', 'í': 'i', 'ó': 'o', 'ú': 'u',
        'Á': 'A', 'É': 'E', 'Í': 'I', 'Ó': 'O', 'Ú': 'U',
        'ü': 'u', 'Ü': 'U', 'ñ': 'n', 'Ñ': 'N'
    }

    with open(nombre_archivo, 'r') as file:
        data = json.load(file)

    for plato in data['platos']:
        plato['nombre'] = ''.join(tilde_mapping.get(char, char) for char in plato['nombre'])
        plato['descripcion'] = ''.join(tilde_mapping.get(char, char) for char in plato['descripcion'])
        plato['ingredientes'] = [''.join(tilde_mapping.get(char, char) for char in ingrediente) for ingrediente in plato['ingredientes']]

    with open(nombre_archivo, 'w') as file:
        json.dump(data, file, indent=2, ensure_ascii=False)

nombre_archivo = 'platillos.json'
quitar_tildes(nombre_archivo)
