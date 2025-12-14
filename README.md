# 🔌 Local Port Exporter (Temporary)

Script em Bash para **abrir temporariamente portas locais para acesso externo**, facilitando a **pré-visualização de aplicações web em dispositivos móveis** (celular, tablet, etc.) sem necessidade de espelhar ou estender a tela.

---

## 🎯 Motivação

Este projeto nasceu de uma necessidade real:

Durante o desenvolvimento de aplicações web, eu queria **visualizar o projeto diretamente no celular ou tablet**, sem:
- estender a tela do notebook
- depender de monitor externo
- usar ferramentas pesadas ou serviços externos

Como vou passar o final de ano viajando e **não vou levar um monitor**, pensei:

> _“Por que não usar o tablet como um preview da aplicação?”_

A solução foi simples e eficiente:
- **exportar temporariamente uma porta local para a rede**
- acessar a aplicação diretamente pelo navegador do celular/tablet
- fechar automaticamente a porta ao finalizar o uso

---

## 🚀 O que o script faz

✔ Abre uma porta local para acesso externo (LAN)  
✔ Exibe a URL de acesso (`http://IP:PORTA`)  
✔ Gera um **QR Code** para acesso rápido pelo celular  
✔ Fecha automaticamente a porta ao pressionar ENTER  
✔ Não deixa portas abertas por engano  
✔ Ideal para ambientes de desenvolvimento  

---

## ❌ O que ele NÃO faz (por design)

- ❌ Não expõe portas permanentemente
- ❌ Não usa serviços externos (ngrok, cloudflared, etc.)
- ❌ Não gerencia processos da aplicação
- ❌ Não lista portas do sistema

O foco é **simplicidade, controle e segurança local**.

---

## 🧠 Como funciona

1. O script abre a porta no firewall (UFW)
2. Exibe o endereço local acessível na rede
3. Gera um QR Code para facilitar o acesso em dispositivos móveis
4. Ao pressionar **ENTER**, a porta é automaticamente fechada

Fluxo:

```text
Abrir porta → Testar no celular/tablet → ENTER → Porta fechada

## 📜 Licença

Este projeto está licenciado sob a **MIT License**.  
Veja o arquivo [LICENSE](LICENSE) para mais detalhes.
