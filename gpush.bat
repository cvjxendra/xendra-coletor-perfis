@echo off
if "%~1"=="" (
    echo Uso: git-commit.bat "mensagem do commit"
    exit /b 1
)

echo Adicionando todos os arquivos...
git add -A

echo Fazendo commit com a mensagem: %~1
git commit -m "%~1"

echo Fazendo push...
git push

