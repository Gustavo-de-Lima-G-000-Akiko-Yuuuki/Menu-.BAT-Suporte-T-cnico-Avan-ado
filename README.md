# 🖥️ Menu de Suporte Técnico Avançado

Este repositório contém um **script Batch (.bat)** para Windows que centraliza diversas ferramentas nativas de diagnóstico, manutenção e otimização do sistema operacional em um **menu interativo**.  
O objetivo é fornecer uma interface simplificada para atividades de **suporte técnico avançado** sem a necessidade de memorizar comandos ou navegar manualmente pelas ferramentas.

---
![Imagem de Propaganda](https://github.com/Gustavo-de-Lima-G-000-Akiko-Yuuuki/Menu-.BAT-Suporte-T-cnico-Avan-ado/blob/main/imagem.png?raw=true)
## 📂 Estrutura do Script

- **Verificação de privilégios de administrador**  
  - Utiliza `net session` para checar permissões elevadas.  
  - Caso o usuário não esteja em modo administrador, o script é encerrado.  

- **Menu principal** com 8 opções:  
  - Diagnóstico completo de disco/arquivos/imagem  
  - Ferramentas de rede e internet  
  - Gerenciamento de drivers e hardware  
  - Ferramentas de segurança e logs  
  - Manutenção e otimização diária  
  - Criação de ponto de restauração  
  - Limpeza avançada do sistema  
  - Encerrar script  

- **Menus secundários** para áreas específicas (Rede, Hardware, Segurança).  

- **Funções avançadas de manutenção**, como limpeza de cache, atualização de pacotes e otimização de disco.  

---

## 🔧 Funcionalidades e Comandos Técnicos

### 1. Diagnóstico de Disco/Arquivos/Imagem
- `dism /Online /Cleanup-Image /RestoreHealth` → Verifica e repara a imagem do Windows.  
- `sfc /scannow` → Scaneia e restaura arquivos de sistema corrompidos.  
- `wmic diskdrive get Caption, Status` → Checa status do hardware de discos físicos.  
- `chkdsk /f` → Corrige erros lógicos no disco.  

### 2. Ferramentas de Rede e Internet
- `ping 8.8.8.8 -n 5` → Teste de conectividade básica.  
- `netsh winsock reset` / `netsh int ip reset` → Reseta pilha TCP/IP e Winsock.  
- `netsh trace start capture=yes` → Captura tráfego de rede (salvo em `%TEMP%\NetTraces`).  
- `firewall.cpl` → Acessa configurações de firewall.  
- `tracert google.com` → Rastreia rota até host externo.  

### 3. Gerenciamento de Drivers e Hardware
- `driverquery /v | more` → Lista todos os drivers instalados com detalhes.  
- `wmic diskdrive get Caption, Status, InterfaceType, Size` → Exibe informações do hardware do disco.  
- `dfrgui` → Abre ferramenta gráfica de desfragmentação.  
- `mdsched` → Agendamento de diagnóstico de memória RAM.  

### 4. Segurança e Logs
- `eventvwr` → Visualizador de eventos.  
- `net user` → Lista e gerencia usuários locais.  
- `taskmgr` → Gerenciador de tarefas.  
- `ms-settings:windowsupdate` → Configurações do Windows Update.  

### 5. Manutenção Rápida
- `ipconfig /flushdns` → Limpa cache DNS.  
- `gpupdate /force` → Reaplica políticas de grupo.  
- `cleanmgr` → Executa limpeza de disco.  
- `winget upgrade --all --silent` → Atualiza todos os aplicativos instalados via Winget.  

### 6. Criação de Ponto de Restauração
- `powershell -Command "Checkpoint-Computer -Description 'Ponto de Restauracao Manual via Script' -Confirm:$false"`  

### 7. Limpeza Avançada
- `del /f /s /q C:\Windows\Temp\*` → Limpa temporários do sistema.  
- `del /f /s /q "%TEMP%\*"` → Limpa temporários do usuário.  
- `rd /s /q "%LOCALAPPDATA%\Microsoft\Windows\INetCache"` → Remove cache do Internet Explorer/Edge Legacy.  
- `rd /s /q "%LOCALAPPDATA%\Temp"` → Remove cache de aplicativos.  
- `rd /s /q %systemdrive%\$Recycle.bin` → Esvazia lixeira.  
- `net stop wuauserv && net stop bits` → Interrompe serviços de Windows Update.  
- `del /f /s /q C:\Windows\SoftwareDistribution\Download\*` → Remove cache de update.  
- `cleanmgr /sagerun:1` → Limpeza personalizada (precisa configuração prévia com `/sageset`).  

---

## 📋 Pré-requisitos

- **Sistema Operacional:** Windows 10/11 (alguns comandos podem não estar disponíveis em versões antigas).  
- **Permissões:** Executar sempre como **Administrador**.  
- **Ferramentas habilitadas:**  
  - [DISM](https://docs.microsoft.com/pt-br/windows-hardware/manufacture/desktop/dism)  
  - [SFC](https://docs.microsoft.com/pt-br/windows-server/administration/windows-commands/sfc)  
  - [CHKDSK](https://docs.microsoft.com/pt-br/windows-server/administration/windows-commands/chkdsk)  
  - [WMIC](https://learn.microsoft.com/pt-br/windows/win32/wmisdk/wmic) (descontinuado, mas ainda funcional em várias versões)  
  - [NETSH](https://learn.microsoft.com/pt-br/windows-server/networking/technologies/netsh/netsh)  
  - [WINGET](https://learn.microsoft.com/pt-br/windows/package-manager/winget/)  
  - PowerShell  

---

## ⚠️ Considerações de Segurança

- O script **modifica configurações críticas** do Windows (rede, update, disco).  
- Alguns comandos podem exigir **reinicialização** (ex: `CHKDSK`, `mdsched`).  
- Recomenda-se criar um **ponto de restauração** antes de executar opções destrutivas como **Limpeza Avançada**.  
- `winget` pode atualizar aplicativos automaticamente sem confirmação.  

---

## ▶️ Execução

1. Baixe o arquivo `.bat`.  
2. Clique com o botão direito → **Executar como administrador**.  
3. Navegue pelo menu digitando o número da opção desejada.  

---
