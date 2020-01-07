class Dieta
	attr_reader :impactoambiental, :alimentos, :cantidad, :proteinas, :carbohidratos, :lipidos

	# Constructor de la clase Dieta
	def initialize(sexo, alimentos) #alimentos es una lista de objetos Alimento
		@alimentos = alimentos
		if sexo == "hombre"
			value = 54
		else
			value = 41
		end
		# [kgco2eq, m2anio]
		@impactoambiental = [0,0]

		aliaux = Alimento.new("", [0,0,0,0,0])
		@cantidad = []
		cuenta = 0
		nodo = alimentos.head
		while nodo != nil
			alimento = nodo.value
			aliaux = aliaux + alimento
			a = @impactoambiental[0] + alimento.kgco2eq
			b = @impactoambiental[1] + alimento.m2anio
			@impactoambiental = [ a , b ]
			cuenta = cuenta + alimento.proteinas
			nodo = nodo.next
			cantidad << 1
		end
		if (cuenta < value) #si necesitamos repetir un alimento para llegar al minimo de proteinas
			i = 2
			while cuenta < value
				j = 0
				nodo = alimentos.head
				while (nodo != nil) && (cuenta < value)
					alimento = nodo.value
					a = @impactoambiental[0] + alimento.kgco2eq
					b = @impactoambiental[1] + alimento.m2anio
					aliaux = aliaux + alimento
					@impactoambiental = [ a , b ]
					cuenta = cuenta + alimento.proteinas
					nodo = nodo.next
					cantidad[j] = i
					j = j + 1
				end
				i = i + 1
			end #hago que pille solo 1 unidad de cada uno falta hacer el + de alimento
			#desde la dieta se deberia poder sacar cualquier cosa de cada alimento
		end
		@proteinas = aliaux.proteinas.round(4)
		@carbohidratos = aliaux.carbohidratos.round(4)
		@lipidos = aliaux.lipidos.round(4)
		@impactoambiental = [ @impactoambiental[0].round(4), @impactoambiental[1].round(4) ]
 	end
end
