@echo off
:: example: git-check "BranchName"
:: git fetch origin "BranchName" | git checkout "BranchName" | git pull origin "BranchName"
setlocal

@echo,
if "%~1"=="" goto usage
goto main
goto :eof

:usage
    @echo,
    @echo **************************************************************************************
    @echo ***                                                                                ***
    @echo *** usage: ^<git-check "BranchName"^>                                                ***
    @echo ***                                                                                ***
    @echo *** Checkout, fetch and pull from origin.                                          ***
    @echo ***                                                                                ***
    @echo **************************************************************************************
    @echo,
exit /B 0

:main
    @echo,
    @echo **************************************************************************************
    @echo ***                                                                                ***
    @echo *** Fetch Origin - Checkout - Pull Origin from ^<%1^>
    @echo ***                                                                                ***
    @echo *** Fetching from origin...                                                        ***
    @echo ***                                                                                ***
    @echo,
    git fetch origin %1
    if %ERRORLEVEL% neq 0 goto ProcessError_Fetch
    @echo,
    @echo ***                                                                                ***
    @echo *** Fetched                                                                        ***
    @echo ***                                                                                ***
    @echo ***                                                                                ***
    @echo *** Checking out...                                                                ***
    @echo ***                                                                                ***
    @echo,
    git checkout %1
    if %ERRORLEVEL% neq 0 goto ProcessError_Checkout
    @echo,
    @echo ***                                                                                ***
    @echo *** Checked                                                                        ***
    @echo ***                                                                                ***
    @echo *** Pulling...                                                                     ***
    @echo ***                                                                                ***
    @echo,
    git pull origin %1
    if %ERRORLEVEL% neq 0 goto ProcessError_Pull
    @echo,
    @echo ***                                                                                ***
    @echo *** Pulled                                                                         ***
    @echo ***                                                                                ***
    @echo **************************************************************************************
    @echo,
exit \b 0

:ProcessError_Checkout
    @echo,
    @echo ***                                                                                ***
    @echo *** ProcessError: Checkout                                                         ***
    @echo ***                                                                                ***
    @echo **************************************************************************************
    @echo,
exit /b 1

:ProcessError_Fetch
    @echo,
    @echo ***                                                                                ***
    @echo *** ProcessError: Fetch                                                            ***
    @echo ***                                                                                ***
    @echo **************************************************************************************
    @echo,
exit /b 1

:ProcessError_Pull
    @echo,
    @echo ***                                                                                ***
    @echo *** ProcessError: Pull                                                             ***
    @echo ***                                                                                ***
    @echo **************************************************************************************
    @echo,
exit /b 1