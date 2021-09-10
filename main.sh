#!/bin/bash

history=""

function VerifyLength() {
    len="${#1}"
    if [ $len -lt 3 ] ; then 
        echo "La contraseña es demasiado corta."
    fi
}

function VerifyNumeric() {
    if ! [[ $1 =~ [0-9] ]] ; then
        echo "Debe contener números."
    fi
}

function VerifyNonDictionary() {
    stripped=${1//[0-9]/}
    filename='diccionario.txt'
    while read line; do
    if [[ $line == $stripped ]] ; then
        echo "Existe en el diccionario."
    fi
    # reading each line
    done < $filename
}

function RetrieveWords() {
    filename='diccionario.txt'
    while read line; do
    if [[ $line == s* ]] || [[ $line = *a ]] ; then
        if [ $1 -eq 0 ]
        then
            echo $line
        fi
        if [ $1 -eq 1 ]
        then
            mkdir -p "informes"
            echo "$line" >> "informes/letras.txt"
        fi
    fi
    # reading each line
    done < $filename
}

function DisplayMenu() {
    echo "1) Opcion 1. Probar Fortaleza."
    echo "2) Opción 2. Obtener “a” o “s”."
    echo "3) Opción 3. Guardar Informe."
    echo "4) Opcion 4. Salir."
    read option
    case $option in
        1)
        echo "Introducir contraseña"
        read password
        VerifyLength $password
        VerifyNumeric $password
        VerifyNonDictionary $password
        ;;
        2)
        RetrieveWords 0
        ;;
        3)
        echo "Generando reporte."
        RetrieveWords 1
        echo "El reporte ha sido generado."
        ;;
        4)
        echo "Chau!"
        exit 1
        ;;
        *)
        echo "Comando desconocido."
        DisplayMenu
        ;;
    esac
}

DisplayMenu