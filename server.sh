#!/bin/bash

# ===== AUTO SUDO =====
if [ "$EUID" -ne 0 ]; then
  exec sudo "$0" "$@"
fi

IP_LOCAL="$(hostname -I | awk '{print $1}')"

banner() {
  clear
  cat << "EOF"

███████╗███████╗██████╗ ██╗   ██╗███████╗██████╗
██╔════╝██╔════╝██╔══██╗██║   ██║██╔════╝██╔══██╗
███████╗█████╗  ██████╔╝██║   ██║█████╗  ██████╔╝
╚════██║██╔══╝  ██╔══██╗╚██╗ ██╔╝██╔══╝  ██╔══██╗
███████║███████╗██║  ██║ ╚████╔╝ ███████╗██║  ██║
╚══════╝╚══════╝╚═╝  ╚═╝  ╚═══╝  ╚══════╝╚═╝  ╚═╝

EOF
}

pause() {
  read -p "ENTER para fechar a porta e voltar..."
}

close_port()
{
  ufw delete allow "$porta"/tcp >/dev/null
  ufw reload >/dev/null

  banner
  echo "Porta $porta FECHADA"
  sleep 1
}

run_export_port() {
  banner
  read -p "Digite a porta para abrir: " porta

  if [[ ! "$porta" =~ ^[0-9]+$ ]]; then
    echo "Porta inválida."
    sleep 1
    return
  fi

  ufw allow "$porta"/tcp >/dev/null
  ufw reload >/dev/null

  banner
  echo "Porta $porta ABERTA para EXTERNO"
  echo
  echo "http://$IP_LOCAL:$porta"
  echo
  qrencode -t ANSIUTF8 "http://$IP_LOCAL:$porta"
  echo
  pause
  close_port
}

while true; do
  banner
  echo "=============================="
  echo "1) Abrir porta externa (temporário)"
  echo "0) Sair"
  echo "=============================="
  read -p "Escolha: " opcao

  case "$opcao" in
    1) run_export_port ;;
    0)
      banner
      echo "Saindo..."
      sleep 1
      exit 0
      ;;
    *)
      echo "Opção inválida"
      sleep 1
      ;;
  esac
done
