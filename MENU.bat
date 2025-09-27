@echo off
title MENU DE SUPORTE TECNICO AVANCADO
color 0A

:: ==============================================
:: VERIFICACAO DE PRIVILEGIOS DE ADMINISTRADOR
:: ==============================================
(
    net session >nul 2>&1
) || (
    echo.
    echo ERRO: Este script PRECISA de privilegios de Administrador.
    echo Por favor, clique com o botao direito e selecione "Executar como administrador".
    echo.
    pause
    exit /b 1
)
:: ==============================================

:MENU
cls
echo ============================================================
echo               MENU DE SUPORTE TECNICO AVANCADO
echo ============================================================
echo.
echo [1] - Diagnostico de Disco / Arquivos / Imagem (Recomendado p/ lentidao)
echo ------------------------------------------------------------------------
echo [2] - Ferramentas de Rede e Internet
echo [3] - Gerenciamento de Drivers e Hardware
echo [4] - Ferramentas de Seguranca e Logs
echo ------------------------------------------------------------------------
echo [5] - Manutencao e Otimizacao Diaria (Rapido)
echo [6] - Criar Ponto de Restauracao
echo [7] - Limpeza Completa do Sistema (Avancado)
echo [8] - Sair
echo.
echo ============================================================
echo        Desenvolvido com dedicacao por: Gustavo de Lima G
echo ============================================================
set /p opcao=Escolha uma opcao (1-8):

if "%opcao%"=="1" goto DIAGNOSTICO_COMPLETO
if "%opcao%"=="2" goto MENU_REDE
if "%opcao%"=="3" goto MENU_HARDWARE
if "%opcao%"=="4" goto MENU_SEGURANCA
if "%opcao%"=="5" goto MANUTENCAO_RAPIDA
if "%opcao%"=="6" goto CRIAR_PONTO_RESTAURACAO
if "%opcao%"=="7" goto LIMPEZA_AVANCADA
if "%opcao%"=="8" exit

goto MENU

:: ==============================================
:: FUNCOES PRINCIPAIS
:: ==============================================

:DIAGNOSTICO_COMPLETO
cls
echo ============================================================
echo        DIAGNOSTICO DE DISCO, ARQUIVOS E IMAGEM
echo ============================================================
echo.
echo Passo 1: Reparando a Imagem do Sistema (DISM /RestoreHealth)...
dism /Online /Cleanup-Image /RestoreHealth
echo.
echo Passo 2: Verificando Arquivos de Sistema (SFC /SCANNOW)...
sfc /scannow
echo.
echo Passo 3: Verificando Saude do Disco Rigido (WMIC)...
wmic diskdrive get Caption, Status
echo.
echo Passo 4: Verificando Erros no Disco (CHKDSK /F)...
chkdsk /f
echo.
echo Diagnostico concluido. Se o CHKDSK nao rodar, o sistema pedira para reiniciar.
pause
goto MENU

:MANUTENCAO_RAPIDA
cls
echo ============================================================
echo             MANUTENCAO E OTIMIZACAO DIARIA
echo ============================================================
echo.
echo 1. Limpando Cache DNS...
ipconfig /flushdns
echo.
echo 2. Forcando Politicas de Grupo...
gpupdate /force
echo.
echo 3. Abrindo Limpeza de Disco (cleanmgr)...
start cleanmgr
echo.
echo 4. Atualizando Programas Instalados (WINGET)...
winget upgrade --all --silent
echo.
echo Manutencao concluida!
pause
goto MENU

:CRIAR_PONTO_RESTAURACAO
cls
echo ============================================================
echo             CRIACAO DE PONTO DE RESTAURACAO
echo ============================================================
powershell -Command "Checkpoint-Computer -Description 'Ponto de Restauracao Manual via Script' -Confirm:$false"
echo.
echo Ponto de Restauracao Criado com Sucesso!
pause
goto MENU

:: ==============================================
:: MENUS SECUNDARIOS
:: ==============================================

:MENU_REDE
cls
echo ============================================================
echo                FERRAMENTAS DE REDE E INTERNET
echo ============================================================
echo [1] - Ping Basico (Teste de Conectividade)
echo [2] - Reiniciar Servicos de Rede (Winsock/IP Reset)
echo [3] - Diagnostico de Rede Completo (Netsh Trace)
echo [4] - Abrir Configuracoes de Firewall
echo [5] - Mostrar Rotas (TRACERT google.com)
echo [6] - Voltar ao Menu Principal
echo ============================================================
set /p rede_opcao=Escolha uma opcao (1-6):

if "%rede_opcao%"=="1" ping 8.8.8.8 -n 5 & pause
if "%rede_opcao%"=="2" netsh winsock reset & netsh int ip reset & echo. & echo REINICIALIZACAO NECESSARIA! & pause
if "%rede_opcao%"=="3" netsh trace start capture=yes & echo. & echo Capturando trafego de rede... Pressione qualquer tecla para parar. & pause & netsh trace stop & echo. & echo Log gerado em %%TEMP%%\NetTraces\NetTrace.etl & pause
if "%rede_opcao%"=="4" start firewall.cpl
if "%rede_opcao%"=="5" tracert google.com & pause
if "%rede_opcao%"=="6" goto MENU
goto MENU_REDE

:MENU_HARDWARE
cls
echo ============================================================
echo             GERENCIAMENTO DE DRIVERS E HARDWARE
echo ============================================================
echo [1] - Listar Todos os Drivers Instalados (DRIVERQUERY)
echo [2] - Verificar Saude do Disco Rigido (WMIC)
echo [3] - Desfragmentar/Otimizar Disco
echo [4] - Verificar Erros de Memoria (MDSCHED)
echo [5] - Voltar ao Menu Principal
echo ============================================================
set /p hardware_opcao=Escolha uma opcao (1-5):

if "%hardware_opcao%"=="1" driverquery /v | more & pause
if "%hardware_opcao%"=="2" wmic diskdrive get Caption, Status, InterfaceType, Size & pause
if "%hardware_opcao%"=="3" start dfrgui
if "%hardware_opcao%"=="4" start mdsched
if "%hardware_opcao%"=="5" goto MENU
goto MENU_HARDWARE

:MENU_SEGURANCA
cls
echo ============================================================
echo             FERRAMENTAS DE SEGURANCA E LOGS
echo ============================================================
echo [1] - Ver Logs de Eventos (EventVwr)
echo [2] - Gerenciar Usuarios (NET USER)
echo [3] - Gerenciar Processos (Task Manager)
echo [4] - Abrir Configuracoes do Windows Update
echo [5] - Voltar ao Menu Principal
echo ============================================================
set /p seg_opcao=Escolha uma opcao (1-5):

if "%seg_opcao%"=="1" start eventvwr
if "%seg_opcao%"=="2" net user & echo. & echo Para adicionar: net user [usuario] [senha] /add & echo Para editar: net user [usuario] * & pause
if "%seg_opcao%"=="3" start taskmgr
if "%seg_opcao%"=="4" start ms-settings:windowsupdate
if "%seg_opcao%"=="5" goto MENU
goto MENU_SEGURANCA

:: ==============================================
:: FUNCOES AVANCADAS E DE LIMPEZA
:: ==============================================

:LIMPEZA_AVANCADA
cls
echo ============================================================
echo               ATENCAO: LIMPEZA AVANCADA
echo ============================================================
echo.
echo Esta operacao fara:
echo 1. Limpeza de Temporarios (Sistema e Usuario)
echo 2. Limpeza de Cache de Aplicativos e Lixeira
echo 3. Limpeza de Cache do Windows Update
echo 4. Executar Limpeza de Disco Completa (cleanmgr /sagerun:1)
echo.
set /p confirmar_limpeza=Deseja realmente continuar? (S/N):

if /i not "%confirmar_limpeza%"=="S" goto MENU

echo.
echo > INICIANDO LIMPEZA...
echo.

del /f /s /q C:\Windows\Temp\* >nul 2>&1
del /f /s /q "%TEMP%\*" >nul 2>&1
rd /s /q "%LOCALAPPDATA%\Microsoft\Windows\INetCache" >nul 2>&1
rd /s /q "%LOCALAPPDATA%\Temp" >nul 2>&1
rd /s /q %systemdrive%\$Recycle.bin >nul 2>&1
md %systemdrive%\$Recycle.bin >nul 2>&1
takeown /f %systemdrive%\$Recycle.bin /r /d y >nul 2>&1
icacls %systemdrive%\$Recycle.bin /grant administrators:F /t >nul 2>&1
net stop wuauserv >nul 2>&1
net stop bits >nul 2>&1
del /f /s /q C:\Windows\SoftwareDistribution\Download\* >nul 2>&1
net start wuauserv >nul 2>&1
net start bits >nul 2>&1
ipconfig /flushdns >nul 2>&1
cleanmgr /sagerun:1

echo.
echo ✅ LIMPEZA AVANCADA FINALIZADA!
echo.
pause
goto MENU
