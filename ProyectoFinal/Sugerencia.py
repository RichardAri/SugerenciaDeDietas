import mysql.connector

class Receta:
    def __init__(self, id, nombre, etiquetas_dieta, etiquetas_salud, alergias, calorias, peso_total, tiempo_total, tipo_cocina, tipo_comida):
        self.id = id
        self.nombre = nombre
        self.etiquetas_dieta = etiquetas_dieta
        self.etiquetas_salud = etiquetas_salud
        self.alergias = alergias
        self.calorias = calorias
        self.peso_total = peso_total
        self.tiempo_total = tiempo_total
        self.tipo_cocina = tipo_cocina
        self.tipo_comida = tipo_comida

    def __repr__(self):
        return f"Receta({self.id}, '{self.nombre}', '{self.etiquetas_dieta}', '{self.etiquetas_salud}', '{self.alergias}', {self.calorias}, {self.peso_total}, {self.tiempo_total}, '{self.tipo_cocina}', '{self.tipo_comida}')"


class Ingrediente:
    def __init__(self, id, receta_id, nombre, cantidad, unidad, tipo, peso):
        self.id = id
        self.receta_id = receta_id
        self.nombre = nombre
        self.cantidad = cantidad
        self.unidad = unidad
        self.tipo = tipo
        self.peso = peso

    def __repr__(self):
        return f"Ingrediente({self.id}, {self.receta_id}, '{self.nombre}', {self.cantidad}, '{self.unidad}', '{self.tipo}', {self.peso})"


class Nutriente:
    def __init__(self, id, receta_id, nombre, cantidad, unidad):
        self.id = id
        self.receta_id = receta_id
        self.nombre = nombre
        self.cantidad = cantidad
        self.unidad = unidad

    def __repr__(self):
        return f"Nutriente({self.id}, {self.receta_id}, '{self.nombre}', {self.cantidad}, '{self.unidad}')"


class SistemaRecomendacion:
    def __init__(self, conn):
        self.conn = conn

    def calcular_tmb(self, genero, peso, altura, edad):
        if genero.lower() == 'masculino':
            tmb = 10 * peso + 6.25 * altura - 5 * edad + 5
        elif genero.lower() == 'femenino':
            tmb = 10 * peso + 6.25 * altura - 5 * edad - 161
        else:
            raise ValueError("El sexo debe ser 'masculino' o 'femenino'")
        return tmb

    def calcular_ingesta_calorica(self, tmb, nivel_actividad, objetivo):
        if nivel_actividad == 'sedentario':
            factor_actividad = 1.2
        elif nivel_actividad == 'ligero':
            factor_actividad = 1.375
        elif nivel_actividad == 'moderado':
            factor_actividad = 1.55
        elif nivel_actividad == 'activo':
            factor_actividad = 1.725
        else:
            raise ValueError("Nivel de actividad no válido")

        if objetivo == 'mantener':
            ingesta_calorica = tmb * factor_actividad
        elif objetivo == 'perder':
            ingesta_calorica = tmb * factor_actividad * 0.8
        elif objetivo == 'ganar':
            ingesta_calorica = tmb * factor_actividad * 1.2
        else:
            raise ValueError("Objetivo no válido")
        return ingesta_calorica

    def preguntar_alergias(self):
        alergias_disponibles = ["Mani", "Soja", "Trigo", "Lacteos", "Shellfish"]
        print("\nSeleccione sus alergias:")
        for i, alergia in enumerate(alergias_disponibles):
            print(f"{i+1}. {alergia}")

        while True:
            opcion_seleccion = input("Ingrese el número de las alergias que tiene (separadas por comas): ")
            try:
                alergias_seleccionadas = [alergias_disponibles[int(opcion) - 1] for opcion in opcion_seleccion.split(',')]
                break
            except (ValueError, IndexError):
                print("Las opciones ingresadas no son válidas. Intente nuevamente.")
        return alergias_seleccionadas

    def calcular_imc_usuario(self, peso, altura):
        return peso / (altura ** 2)

    def preguntar_actividad_fisica(self):
        nivel_actividad = input("¿Cuál es su nivel de actividad física? (sedentario, ligero, moderado, activo): ")
        return nivel_actividad

    def obtener_recomendaciones(self, diet_labels=None, health_labels=None, allergies=None):
        cursor = self.conn.cursor(dictionary=True)
        query = "SELECT * FROM Recipe WHERE 1=1"

        if diet_labels:
            diet_labels_str = "', '".join(diet_labels)
            query += f" AND dietLabels IN ('{diet_labels_str}')"

        if health_labels:
            health_labels_str = "', '".join(health_labels)
            query += f" AND healthLabels IN ('{health_labels_str}')"

        if allergies:
            allergies_str = "', '".join(allergies)
            query += f" AND allergies NOT IN ('{allergies_str}')"

        cursor.execute(query)
        recipes = cursor.fetchall()

        recomendaciones = []
        for recipe in recipes:
            receta = Receta(recipe['id'], recipe['name'], recipe['dietLabels'], recipe['healthLabels'], recipe['allergies'], recipe['calories'], recipe['totalWeight'], recipe['totalTime'], recipe['cuisineType'], recipe['mealType'])

            cursor.execute("SELECT * FROM Ingredient WHERE recipe_id = %s", (receta.id,))
            ingredientes = [Ingrediente(ingredient['id'], ingredient['recipe_id'], ingredient['name'], ingredient['quantity'], ingredient['measure'], ingredient['type'], ingredient['weight']) for ingredient in cursor.fetchall()]

            cursor.execute("SELECT name, quantity, unit FROM Nutrient WHERE recipe_id = %s", (receta.id,))
            nutrientes = {nutrient['name']: f"{nutrient['quantity']} {nutrient['unit']}" for nutrient in cursor.fetchall()}

            plato = {
                'nombre': receta.nombre,
                'tipo_cocina': receta.tipo_cocina,
                'tipo_comida': receta.tipo_comida,
                'calorias': receta.calorias,
                'peso_total': receta.peso_total,
                'tiempo_total': receta.tiempo_total,
                'ingredientes': ingredientes,
                'nutrientes': nutrientes
            }
            recomendaciones.append(plato)

        cursor.close()
        return recomendaciones
    
    def seleccionar_etiquetas_dieta(self):
        etiquetas_dieta_disponibles = ["Vegetariano", "Vegano", "Sin Gluten", "Bajo en Carbohidratos", "Alto en Proteínas"]
        print("\nEtiquetas de dieta disponibles:")
        for i, etiqueta in enumerate(etiquetas_dieta_disponibles):
            print(f"{i+1}. {etiqueta}")

        while True:
            opcion_seleccion = input("Ingrese el número de las etiquetas que desea seleccionar (separadas por comas): ")
            try:
                etiquetas_seleccionadas = [etiquetas_dieta_disponibles[int(opcion) - 1] for opcion in opcion_seleccion.split(',')]
                break
            except (ValueError, IndexError):
                print("Las opciones ingresadas no son válidas. Intente nuevamente.")

        return etiquetas_seleccionadas

    def seleccionar_etiquetas_salud(self):
        etiquetas_salud_disponibles = ["Bajo en Grasas", "Bajo en Colesterol", "Alto en Fibra", "Sin Azúcar Añadida", "Cardiosaludable"]
        print("\nEtiquetas de salud disponibles:")
        for i, etiqueta in enumerate(etiquetas_salud_disponibles):
            print(f"{i+1}. {etiqueta}")

        while True:
            opcion_seleccion = input("Ingrese el número de las etiquetas que desea seleccionar (separadas por comas): ")
            try:
                etiquetas_seleccionadas = [etiquetas_salud_disponibles[int(opcion) - 1] for opcion in opcion_seleccion.split(',')]
                break
            except (ValueError, IndexError):
                print("Las opciones ingresadas no son válidas. Intente nuevamente.")

        return etiquetas_seleccionadas

    def seleccionar_alergias(self):
        alergias_disponibles = ["Mani", "Soja", "Trigo", "Lacteos", "Shellfish"]
        print("\nSeleccione sus alergias:")
        for i, alergia in enumerate(alergias_disponibles):
            print(f"{i+1}. {alergia}")

        while True:
            opcion_seleccion = input("Ingrese el número de las alergias que tiene (separadas por comas): ")
            try:
                alergias_seleccionadas = [alergias_disponibles[int(opcion) - 1] for opcion in opcion_seleccion.split(',')]
                break
            except (ValueError, IndexError):
                print("Las opciones ingresadas no son válidas. Intente nuevamente.")

        return alergias_seleccionadas

    def seleccionar_ingredientes_no_gustan(self):
        ingredientes_no_gustan_ingresados = input("Ingrese ingredientes no deseados separados por comas sin espacios (presione Enter para continuar): ")
        if ingredientes_no_gustan_ingresados == "0":
            return None
        elif ingredientes_no_gustan_ingresados:
            return ingredientes_no_gustan_ingresados.split(',')
        else:
            return None

    def formatear_recomendaciones(self,recomendaciones):
        for receta in recomendaciones:
            print("Nombre:", receta['nombre'])
            print("Tipo de cocina:", receta['tipo_cocina'])
            print("Tipo de comida:", receta['tipo_comida'])
            print("Calorías:", receta['calorias'])
            print("Peso total:", receta['peso_total'])
            print("Tiempo total:", receta['tiempo_total'])
            print("Ingredientes:")
            for ingrediente in receta['ingredientes']:
                print("\t", ingrediente)
            print("Nutrientes:")
            for nutrient, value in receta['nutrientes'].items():
                print("\t", nutrient, ":", value)
            print("\n")

    def main(self):
        nombre = input("Ingrese su nombre: ")
        edad = int(input("Ingrese su edad: "))
        peso = float(input("Ingrese su peso en kilogramos: "))
        altura = float(input("Ingrese su altura en metros(1.45): "))
        genero = input("Ingrese su sexo (masculino/femenino): ")
        objetivo = input("¿Cuál es tu objetivo? (mantener/perder/ganar): ")

        # Calcular datos básicos del usuario
        tmb = self.calcular_tmb(genero, peso, altura, edad)
        nivel_actividad = self.preguntar_actividad_fisica()
        ingesta_calorica = self.calcular_ingesta_calorica(tmb, nivel_actividad, objetivo)
        imc = self.calcular_imc_usuario(peso, altura)
        alergias = self.preguntar_alergias()
        ingredientes_no_gustan = self.seleccionar_ingredientes_no_gustan()

        # Mostrar recomendaciones iniciales
        recomendaciones_iniciales = self.obtener_recomendaciones()
        print("\nRecomendaciones iniciales:")
        #for recomendacion in recomendaciones_iniciales:
        self.formatear_recomendaciones(recomendaciones_iniciales)
        
        filtros = {}
        while True:
            print("\n¿Desea refinar las recomendaciones? (sí/no)")
            opcion = input().lower()

            if opcion == 'sí':
                # Menú de filtros
                print("\nOpciones de filtro:")
                print("1. Etiquetas de dieta")
                print("2. Etiquetas de salud")
                print("3. Alergias")
                print("4. Ingredientes no deseados")
                print("5. Salir")

                opcion_filtro = input("Seleccione una opción (1-5): ")

                
                if opcion_filtro == '1':
                    # Filtrar por etiquetas de dieta
                    diet_labels = self.seleccionar_etiquetas_dieta()
                    if diet_labels:
                        filtros['diet_labels'] = diet_labels

                elif opcion_filtro == '2':
                    # Filtrar por etiquetas de salud
                    health_labels = self.seleccionar_etiquetas_salud()
                    if health_labels:
                        filtros['health_labels'] = health_labels

                elif opcion_filtro == '3':
                    # Filtrar por alergias
                    alergias_adicionales = self.seleccionar_alergias()
                    if alergias_adicionales:
                        alergias.extend(alergias_adicionales)

                elif opcion_filtro == '4':
                    # Filtrar por ingredientes no deseados
                    ingredientes_no_gustan_adicionales = self.seleccionar_ingredientes_no_gustan()
                    if ingredientes_no_gustan_adicionales:
                        ingredientes_no_gustan.extend(ingredientes_no_gustan_adicionales)

                elif opcion_filtro == '5':
                    break
                else:
                    print("Opción no válida.")

            elif opcion == 'no':
                break
            else:
                print("Opción no válida.")
                
        recomendaciones_finales = self.obtener_recomendaciones(diet_labels=filtros.get('diet_labels'), health_labels=filtros.get('health_labels'), allergies=alergias)
        self.formatear_recomendaciones(recomendaciones_finales)

if __name__ == "__main__":
    conn = mysql.connector.connect(
        host="localhost",
        user="root",
        password="Alumno$1",
        database="RecipesDB"
    )

    sistema = SistemaRecomendacion(conn)
    sistema.main()

