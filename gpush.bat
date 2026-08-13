@echo off
if "%~1"=="" (
    echo Uso: git-commit.bat "mensagem do commit"
    exit /b 1
)

echo Adicionando todos os arquivos...
git add -A
if errorlevel 1 exit /b %errorlevel%

echo Fazendo commit com a mensagem: %~1
git commit -m "%~1"
if errorlevel 1 (
    git diff --cached --quiet
    if errorlevel 1 exit /b %errorlevel%
    echo Nenhuma alteracao nova para commit.
)

echo Atualizando a referencia remota...
git fetch origin
if errorlevel 1 exit /b %errorlevel%

echo Espelhando o historico local no GitHub...
git push --force-with-lease
