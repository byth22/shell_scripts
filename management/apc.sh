#!/bin/bash 
echo "-- Automatic Protocol Changing"

function udp_tcp () {
        #sed -i -e 's/udp/tcp/g; s/1337/443/g; s/tls_auth/tls_crypt/g' *.ovpn

        echo "  [+] Troca feita para TCP"
}

function tcp_udp () {
        #sed -i -e 's/tcp/udp/g; s/443/1337/g; s/tls_crypt/tls_auth/g' *.ovpn
        echo "  [+] Troca feita para UDP"
}

function error () {
        echo "  [!] Opção inválida"
        echo "  [!] Usage: ./apc.sh [tcp/udp]"
}


if [ $# -ne 1 ]; then
        error
        exit
fi

if [ $1 == "tcp" ]; then
        udp_tcp

elif [ $1 == "udp" ]; then
        tcp_udp

else
        error
fi
