import json

def calcular_imc(peso, altura):
    return peso / (altura ** 2)

def calcular_imc_usuario():
    print("Calculadora de IMC")
    peso = float(input("Ingrese su peso en kilogramos: "))
    altura = float(input("Ingrese su altura en metros ejemplo 1.70 : "))
    imc = calcular_imc(peso, altura)
    print("Su IMC es:", imc)
    return imc

def preguntar_alergias():
    print("¿Tiene alguna alergia? (Ingrese los números correspondientes separados por comas o '0' si no tiene alergias)")
    with open("alergias.json") as file:
        alergias = json.load(file)
        for i, alergia in enumerate(alergias, start=1):
            print(f"{i}. {alergia}")
        opciones = input("Opciones: ")
        if opciones == '0':
            return ["Ninguna"]
        seleccionadas = [alergias[int(opcion)-1] for opcion in opciones.split(',')]
        print("Ha seleccionado:", ", ".join(seleccionadas))
        return seleccionadas

def preguntar_enfermedades():
    print("¿Tiene alguna enfermedad? (Ingrese los números correspondientes separados por comas o '0' si no tiene enfermedades)")
    with open("enfermedades.json") as file:
        enfermedades = json.load(file)
        for i, enfermedad in enumerate(enfermedades["enfermedades"], start=1):
            print(f"{i}. {enfermedad}")
        opciones = input("Opciones: ")
        if opciones == '0':
            return ["Ninguna"]
        seleccionadas = [enfermedades["enfermedades"][int(opcion)-1] for opcion in opciones.split(',')]
        print("Ha seleccionado:", ", ".join(seleccionadas))
        return seleccionadas

def preguntar_preferencias():
    with open("preferencias.json") as file:
        preferencias = json.load(file)

    preferencias_totales = []

    print("Preferencias de proteínas:")
    for i, preferencia in enumerate(preferencias["proteinas"], start=1):
        print(f"{i}. {preferencia}")
    seleccion_proteinas = input("Ingrese los números correspondientes a sus preferencias de proteínas (separados por comas): ").split(',')
    preferencias_totales.extend([preferencias["proteinas"][int(opcion)-1] for opcion in seleccion_proteinas])

    print("Preferencias de grasas:")
    for i, preferencia in enumerate(preferencias["grasas"], start=1):
        print(f"{i}. {preferencia}")
    seleccion_grasas = input("Ingrese los números correspondientes a sus preferencias de grasas (separados por comas): ").split(',')
    preferencias_totales.extend([preferencias["grasas"][int(opcion)-1] for opcion in seleccion_grasas])

    print("Preferencias de carbohidratos:")
    for i, preferencia in enumerate(preferencias["carbohidratos"], start=1):
        print(f"{i}. {preferencia}")
    seleccion_carbohidratos = input("Ingrese los números correspondientes a sus preferencias de carbohidratos (separados por comas): ").split(',')
    preferencias_totales.extend([preferencias["carbohidratos"][int(opcion)-1] for opcion in seleccion_carbohidratos])

    return preferencias_totales

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

def guardar_perfil(nombre, edad, peso, altura, imc, alergias, actividad_fisica, enfermedades, preferencias):
    perfil = {
        "nombre": nombre,
        "edad": edad,
        "peso": peso,
        "altura": altura,
        "imc": imc,
        "alergias": alergias,
        "actividad_fisica": actividad_fisica,
        "enfermedades": enfermedades,
        "preferencias": preferencias
    }
    with open("perfil_usuario.json", "w") as file:
        json.dump(perfil, file, indent=4)
    print("Perfil de usuario guardado correctamente.")

def cargar_perfil():
    with open("perfil_usuario.json") as file:
        perfil = json.load(file)
    return perfil

def cargar_platillos():
    with open("platillos.json") as file:
        platillos = json.load(file)["platos"]
    return platillos

def recomendar_platillos(perfil, platillos):
    recomendaciones = []
    for plato in platillos:
        edad = perfil["edad"]
        if not (plato["imc_recomendado"]["min"] <= perfil["imc"] <= plato["imc_recomendado"]["max"]):
            continue

        alergias = perfil["alergias"]
        if any(alergia in plato["ingredientes"] for alergia in alergias):
            continue

        actividad_fisica = perfil["actividad_fisica"]
        if plato["actividad_fisica_recomendada"] != actividad_fisica:
            continue
        
        enfermedades = perfil["enfermedades"]
        if any(enfermedad in plato["ingredientes"] for enfermedad in enfermedades):
            continue
        
        recomendaciones.append(plato)
    return recomendaciones

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
            print(f"- Proteínas: {plato['nutrientes']['proteinas']}")
            print(f"- Grasas: {plato['nutrientes']['grasas']}")
            print(f"- Carbohidratos: {plato['nutrientes']['carbohidratos']}")
            print("-------------")

def main():
    nombre = input("Ingrese su nombre: ")
    edad = int(input("Ingrese su edad: "))
    peso = float(input("Ingrese su peso en kilogramos: "))
    altura = float(input("Ingrese su altura en metros: "))
    imc = calcular_imc(peso, altura)
    alergias = preguntar_alergias()
    actividad_fisica = preguntar_actividad_fisica()
    enfermedades = preguntar_enfermedades()
    preferencias = preguntar_preferencias()
    guardar_perfil(nombre, edad, peso, altura, imc, alergias, actividad_fisica, enfermedades, preferencias)
    perfil = cargar_perfil()
    platillos = cargar_platillos()
    recomendaciones = recomendar_platillos(perfil, platillos)
    mostrar_recomendaciones(recomendaciones)

if __name__ == "__main__":
    main()

