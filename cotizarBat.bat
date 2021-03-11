
<?php
error_reporting(0);

function obtenerCotizacion($montoenPesos, $moneda){ //Se crea la función obtenerCotizacion con parámetros $montoenPesos y $moneda
$data = file_get_contents("http://www.cronista.com/MercadosOnline/dolar.html"); //Convierte el archivo de la web Mercados Online a una cadena 

if (preg_match('/class=buy-value>(.*?)<\/span>/is', $data, $r)) { //Busca una coincidencia (el primer parámetro)en el contenido de $data y lo almacena en el array $r
   	
	$cotizacion=substr($r[1],0,4); //Se obtiene sólo el monto de la cotización de la web
	echo "La cotizacion es:".$cotizacion."\n\n\n";//Se muestra la cotización
	
	if (is_numeric($montoenPesos) && is_string($moneda) && strlen($moneda)==3)//Se Controla que sea la cantidad numérica y que la moneda sea en texto e igual a 3 caracteres
		{
		$enUSD=$montoenPesos/$cotizacion;//Se realiza el cálculo del $montoenPesos en dólares
		echo "Cantidad total en USD:".round($enUSD,2). $moneda; //Se muestra la cantidad en dólares , redondeándolo a 2 dígitos de decimales
		}
	else {
		echo "Ingrese una cantidad numeral para el monto en Pesos y para moneda ingrese un texto igual a 3 caracteres, por favor";
		}
} else {
    echo "Ejecute la funcion al menos 3 veces hasta que cargue la web";
}

}

obtenerCotizacion(120000, "ARS"); //Ejecutar la función obtenerCotizacion


?>
