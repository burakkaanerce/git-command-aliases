@echo off
:: example: git-push "BranchName" "CommitName"
:: git checkout -b "BranchName" | git add . | git commit -m "CommitName" | git push origin "BranchName"
setlocal

@echo,
if "%~1"=="" goto usage
if "%~2"=="" goto usage
goto main
goto :eof

:usage
    @echo,
    @echo **************************************************************************************
    @echo ***                                                                                ***
    @echo *** usage: ^<git-push "BranchName" "CommitName"^>                                    ***
    @echo ***                                                                                ***
    @echo *** Create new branch and add, commit all files then push to origin.               ***
    @echo ***                                                                                ***
    @echo **************************************************************************************
    @echo,
exit /B 0

:main
    @echo,
    @echo **************************************************************************************
    @echo ***                                                                                ***
    @echo *** Checkout - Add All Files - Commit and Push Origin ^<%1^>
    @echo ***                                                                                ***
    @echo *** Checking out new branch...                                                     ***
    @echo ***                                                                                ***
    @echo,
    git checkout -b %1
    if %ERRORLEVEL% neq 0 goto ProcessError_Checkout
    @echo,
    @echo ***                                                                                ***
    @echo *** Checked Out                                                                    ***
    @echo ***                                                                                ***
    @echo ***                                                                                ***
    @echo *** Adding all files...                                                            ***
    @echo ***                                                                                ***
    @echo,
    git add .
    if %ERRORLEVEL% neq 0 goto ProcessError_Add
    @echo,
    @echo ***                                                                                ***
    @echo *** Added                                                                          ***
    @echo ***                                                                                ***
    @echo ***                                                                                ***
    @echo *** Commiting changes...                                                           ***
    @echo ***                                                                                ***
    @echo,
    git commit -m %2
    if %ERRORLEVEL% neq 0 goto ProcessError_Commit
    @echo,
    @echo ***                                                                                ***
    @echo *** Committed                                                                      ***
    @echo ***                                                                                ***
    @echo ***                                                                                ***
    @echo *** Pushing all commits to remote %1 branch...
    @echo ***                                                                                ***
    @echo,
    git push origin %1
    if %ERRORLEVEL% neq 0 goto ProcessError_Push
    @echo,
    @echo ***                                                                                ***
    @echo *** Pushed to remote %1 branch
    @echo ***                                                                                ***
    @echo **************************************************************************************
    @echo,
exit /B 0

:ProcessError_Checkout
    @echo,
    @echo ***                                                                                ***
    @echo *** ProcessError: Checkout                                                         ***
    @echo ***                                                                                ***
    @echo **************************************************************************************
    @echo,
exit /b 1

:ProcessError_Add
    @echo,
    @echo ***                                                                                ***
    @echo *** ProcessError: Add                                                              ***
    @echo ***                                                                                ***
    @echo **************************************************************************************
    @echo,
exit /b 1

:ProcessError_Commit
    @echo,
    @echo ***                                                                                ***
    @echo *** ProcessError: Commit                                                           ***
    @echo ***                                                                                ***
    @echo **************************************************************************************
    @echo,
exit /b 1

:ProcessError_Push
    @echo,
    @echo ***                                                                                ***
    @echo *** ProcessError: Push                                                             ***
    @echo ***                                                                                ***
    @echo **************************************************************************************
    @echo,
exit /b 1