#!/bin/bash
#Este codigo nos regala un imei segun el algoritmo luhn
#esperamos continuar su desarrollo, y lograr que lo implemente segun sea el modelo y arquitectura
#Comprobando si los parametros estan correctos en el script
if [[ $# -ne 1 ]];then
  echo "usage: cambio_de_imei [imei|'rand']"
  exit 1
fi

imei=$1

if [[ $imei == 'rand' ]];then
  #Generar un imei valido
  imei="35"
  range=10;
  for i in {0..11}; do
    r=$RANDOM;
    let "r %= $range";
    imei="$imei""$r";
  done;

  #genera y valida los imei segun el algoritmo luhn
  a=$((${imei:0:1} + ${imei:2:1} + ${imei:4:1} + ${imei:6:1} + ${imei:8:1} + ${imei:10:1} + ${imei:12:1}))
  b="$((${imei:1:1}*2))$((${imei:3:1}*2))$((${imei:5:1}*2))$((${imei:7:1}*2))$((${imei:9:1}*2))$((${imei:11:1}*2))$((${imei:13:1}*2))"
  c=0

  for (( i=0; i<${#b}; i++ )); do
    c=$(($c+${b:$i:1}))
  done

  d=$(($a + $c))
  luhn=$((10-$(($d%10))))
  if [[ "$luhn" -eq 10 ]]; then luhn=0; fi
  
  #Obtenido el imei 
  imei="$imei$luhn"
else
  #comprueba si la longitud del imei es valida
  if [[ ${#1} -ne 15 ]];then
    echo "imei incorrecto"
    exit 1
  fi
fi
