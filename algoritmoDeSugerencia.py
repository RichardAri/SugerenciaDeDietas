import json

# Función para calcular el IMC
def calcular_imc(peso, altura):
    return peso / (altura ** 2)

# Función para solicitar datos al usuario y calcular el IMC
def calcular_imc_usuario():
    print("Calculadora de IMC")
    peso = float(input("Ingrese su peso en kilogramos: "))
    altura = float(input("Ingrese su altura en metros: "))
    imc = calcular_imc(peso, altura)
    print("Su IMC es:", imc)
    return imc

# Función para preguntar sobre alergias
def preguntar_alergias():
    print("¿Tiene alguna alergia? (Ingrese los números correspondientes separados por comas o '0' si no tiene alergias)")
    with open("alergias.json") as file:
        alergias = json.load(file)
        for i, alergia in enumerate(alergias, start=1):
            print(f"{i}. {alergia}")
        opciones = input("Opciones: ")
        if opciones == '0':
            return []
        seleccionadas = [alergias[int(opcion)-1] for opcion in opciones.split(',')]
        print("Ha seleccionado:", ", ".join(seleccionadas))
        return seleccionadas

# Función para preguntar sobre la actividad física
def preguntar_actividad_fisica():
    print("¿Cuál es su nivel de actividad física?")
    print("1. Sedentaria")
    print("2. Ligera")
    print("3. Moderada")
    print("4. Alta")
    print("5. Atleta profesional")
    opcion = int(input("Opción: "))
    niveles_actividad = {
        1: "Sedentaria",
        2: "Ligera",
        3: "Moderada",
        4: "Alta",
        5: "Atleta profesional"
    }
    print("Ha seleccionado:", niveles_actividad[opcion])
    return niveles_actividad[opcion]

# Función para guardar el perfil del usuario en un archivo JSON
def guardar_perfil(nombre, edad, peso, altura, imc, alergias, actividad_fisica, genero):
    perfil = {
        "nombre": nombre,
        "edad": edad,
        "peso": peso,
        "altura": altura,
        "imc": imc,
        "alergias": alergias,
        "actividad_fisica": actividad_fisica,
        "genero": genero
    }
    with open("perfil_usuario.json", "w") as file:
        json.dump(perfil, file, indent=4)
    print("Perfil de usuario guardado correctamente.")

def cargar_perfil():
    with open("perfil_usuario.json") as file:
        perfil = json.load(file)
    return perfil

# Cargar la lista de platillos
def cargar_platillos():
    with open("platillos.json") as file:
        platillos = json.load(file)["platos"]
    return platillos

# Función para recomendar platillos al usuario
def recomendar_platillos(perfil, platillos):
    recomendaciones = []
    for plato in platillos:
        # Verificar si el plato cumple con las restricciones de edad
        edad = perfil["edad"]
        if not (plato["edad_recomendada"]["min"] <= edad <= plato["edad_recomendada"]["max"]):
            continue
        
        genero = perfil["genero"]
        if plato["genero_recomendado"] != "Ambos" and plato["genero_recomendado"] != genero:
            continue

        alergias = perfil["alergias"]
        if any(alergia in plato["ingredientes"] for alergia in alergias):
            continue

        imc = perfil["imc"]
        if not (plato["imc_recomendado"]["min"] <= imc <= plato["imc_recomendado"]["max"]):
            continue

        actividad_fisica = perfil["actividad_fisica"]
        if plato["actividad_fisica_recomendada"] != actividad_fisica:
            continue
        
        recomendaciones.append(plato)
    
    return recomendaciones

# Función para mostrar las recomendaciones al usuario
def mostrar_recomendaciones(recomendaciones):
    if not recomendaciones:
        print("Lo sentimos, no hay platillos recomendados para ti en este momento.")
    else:
        print("¡Te recomendamos los siguientes platillos!")
        for plato in recomendaciones:
            print(f"Nombre: {plato['nombre']}")
            print(f"Descripción: {plato['descripcion']}")
            print("Ingredientes:", ", ".join(plato['ingredientes']))
            print("Nutrientes:")
            for nutriente, cantidad in plato['nutrientes'].items():
                print(f"- {nutriente.capitalize()}: {cantidad}")
            print("-------------")

def main():
    nombre = input("Ingrese su nombre: ")
    edad = int(input("Ingrese su edad: "))
    peso = float(input("Ingrese su peso en kilogramos: "))
    altura = float(input("Ingrese su altura en metros: "))
    imc = calcular_imc(peso, altura)
    alergias = preguntar_alergias()
    actividad_fisica = preguntar_actividad_fisica()
    genero = input("Ingrese su género (Masculino/Femenino/Otro): ")
    
    # Guardar el perfil del usuario
    guardar_perfil(nombre, edad, peso, altura, imc, alergias, actividad_fisica, genero)
    perfil = cargar_perfil()
    platillos = cargar_platillos()
    recomendaciones = recomendar_platillos(perfil, platillos)
    mostrar_recomendaciones(recomendaciones)

if __name__ == "__main__":
    main()
