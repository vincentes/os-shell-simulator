#!/bin/bash

function DisplayMenu() {
    echo "1) Opcion 1. Probar Fortaleza."
    echo "2) Opción 2. Obtener “a” o “s”."
    echo "3) Opción 3. Guardar Informe."
    echo "4) Opcion 4. Salir."
    read option
    case $option in
        1)
        echo "option 1"
        ;;
        4)
        echo "Chau!"
        exit 1
        ;;
        *)
        echo "unknown"
        ;;
    esac
}

DisplayMenu