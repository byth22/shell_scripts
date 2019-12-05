#!/bin/bash

echo "-- b Tracer --"
echo""
echo -n "[*] Entre com o ip/domain: "
read ip
seq 1 255 | while read ttl; do
        salto=$(ping $ip -n -c 1 -t $ttl -w 2 | grep '^From' | awk '{print $2}')
        salto1=$(ping $ip -n -c 1 -t $ttl -w 2 | grep 'from' | sed 's/[:]//' | awk '{print $4}')
        if [ ! -e $salto ]; then
                echo "    [+] Salto $ttl - $salto"
        else
                if [ ! -e $salto1 ]; then
                        echo "    [+] Salto $ttl - $salto1"
                        echo""
                        echo "    [+] finished!"
                        exit
                        else
                                echo "    [-] Salto $ttl - Sem resposta "
                fi
        fi
done
