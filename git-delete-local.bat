@echo off
:: example: git-delete-local "BranchName"
:: git branch | find /v "BranchName" | xargs git branch -D
setlocal

if "%~1"=="" goto usage
goto main
goto :eof

:usage
    @echo,
    @echo **************************************************************************************
    @echo ***                                                                                ***
    @echo *** usage: ^<git-delete-local "BranchName"^>                                         ***
    @echo ***                                                                                ***
    @echo *** Remove all local branches except it.                                           ***
    @echo ***                                                                                ***
    @echo **************************************************************************************
    @echo,
exit /B 0

:main
    @echo,
    @echo **************************************************************************************
    @echo ***                                                                                ***
    @echo *** Delete local branches that named except as ^<%1^>
    @echo ***                                                                                ***
    @echo *** Listing and deleting branches...                                               ***
    @echo ***                                                                                ***
    @echo,
    git branch | find /v "%1" | xargs git branch -D
    if %ERRORLEVEL% neq 0 goto ProcessError_Delete
    @echo,
    @echo ***                                                                                ***
    @echo *** Deleted all local branches that named except as  ^<%1^>...
    @echo ***                                                                                ***
    @echo **************************************************************************************
    @echo,
exit /B 0

:ProcessError_Delete
    @echo,
    @echo ***                                                                                ***
    @echo *** ProcessError: Delete                                                           ***
    @echo ***                                                                                ***
    @echo **************************************************************************************
    @echo,
exit /b 1