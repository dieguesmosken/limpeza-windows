@echo off

chcp 65001 > nul

echo Verificando privilégios de administrador...
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Este script requer privilégios de administrador.
    echo Por favor, execute-o como administrador.
    pause
    exit
)

echo Calculando o tamanho da Lixeira...
for /f "usebackq" %%a in (`dir /a /s /w /b C:\$Recycle.Bin ^| find /v /c ""`) do set /a "tamanho_lixeira=%%a"
echo Tamanho total da Lixeira: %tamanho_lixeira% bytes

echo Calculando o tamanho da pasta Temp...
for /f "usebackq" %%a in (`dir /a /s /w /b "%TEMP%\*.*" ^| find /v /c ""`) do set /a "tamanho_temp=%%a"
echo Tamanho total da pasta Temp: %tamanho_temp% bytes

REM Adicione aqui outras pastas que deseja calcular o tamanho
REM Exemplo:
REM echo Calculando o tamanho da pasta X...
REM for /f "usebackq" %%a in (`dir /a /s /w /b "C:\Caminho\para\a\Pasta\X\*.*" ^| find /v /c ""`) do set /a "tamanho_pastaX=%%a"
REM echo Tamanho total da pasta X: %tamanho_pastaX% bytes

echo.

set /p limpar="Deseja limpar a Lixeira e a pasta Temp? (S/N): "
if /i "%limpar%"=="S" (
    echo Limpando a Lixeira...
    rd /s /q C:\$Recycle.Bin

    echo Limpando a pasta Temp...
    del /f /q /s "%TEMP%\*.*"
    for /d %%i in ("%TEMP%\*") do rmdir /s /q "%%i"

    REM Adicione aqui outros comandos para limpar as pastas adicionais
    REM Exemplo:
    REM echo Limpando a pasta X...
    REM del /f /q /s "C:\Caminho\para\a\Pasta\X\*.*"
    REM for /d %%i in ("C:\Caminho\para\a\Pasta\X\*") do rmdir /s /q "%%i"

    echo Limpeza concluída!
) else (
    echo Operação de limpeza cancelada.
)

pause
