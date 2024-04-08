#!/bin/bash

echo "=============================================================="
echo "                                                              "
echo "    / __|  | | | |  | _ )   / __|   | _ \   /   \  | |/ /     "
echo "    \__ \  | |_| |  | _ \  | (__    |   /   | - |  | ' <      "
echo "    |___/   \___/   |___/   \___|   |_|_\   |_|_|  |_|\_\     "
echo "                                                              "
echo "                          By: Dexter                          "
echo "                                                              "
echo "=============================================================="
read -p "Digite o domínio que deseja pesquisar: " domain


response=$(curl -s https://shrewdeye.app/api/v1/domains/$domain)

                                         'download_valid'
if echo "$response" | grep -q "download_valid"; then
    
    download_link=$(echo "$response" | jq -r '.download_valid')
    echo "Link de download encontrado: $download_link"
    
    
    wget $download_link -O "${domain}_valid.txt"
    echo "Arquivo baixado como ${domain}_valid.txt"
else
    echo "Não foi possível encontrar o link de download na resposta da API."
fi
