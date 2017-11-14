def imprimirSolucion(tablero)
	tablero.each do |fila|
		col = ""
		fila.each do |columna|
			col = col + "#{columna} "
		end
		puts col
	end
end

def esValido(fila, columna, tablero)
	if  fila >= 0 and fila < tablero.length and columna >= 0 and columna < tablero.length and tablero[fila][columna] == -1
		return true
	end
	return false   
end

def backtracking(fila, columna, tablero, total_movidas, movimientos)
	siguiente_fila = 0, siguiente_columna = 0
	if total_movidas == movimientos.length*movimientos.length
		return true
	end
	8.times do |k|
		siguiente_fila = fila + movimientos[k][0];
		siguiente_columna = columna + movimientos[k][1];
		if esValido(siguiente_fila, siguiente_columna, tablero)
			tablero[siguiente_fila][siguiente_columna] = total_movidas;
			if backtracking(siguiente_fila, siguiente_columna, tablero, total_movidas+1, movimientos) == true
				return true
			else
				tablero[siguiente_fila][siguiente_columna] = -1
			end
		end
	end
	return false
end

def resolverProblema(n)
	tablero = []
	movimientos = [[2,1],[1,2],[-1,2],[-2,1],[-2,-1],[-1,-2],[1,-2],[2,-1]]
	n.times do
		arreglo = []
		n.times do
			arreglo << -1
		end
		tablero << arreglo
	end
	tablero[0][0] = 0
	if backtracking(0, 0, tablero, 1, movimientos) == false
		puts "No existe Solución posible"
		return false
	else
		puts "La matriz muestra por orden desde 0 hasta X los movimientos que debe hacer el Caballo para recorrer todos los espacios del tablero"
		imprimirSolucion(tablero)
		return true
	end
end

resolverProblema(8)
