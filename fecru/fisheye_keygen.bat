@echo off
set DIR=%CD%
set JAR=fisheye_keygen.jar
if not exist "%DIR%\%JAR%" goto noJar
start javaw -jar %JAR%
IF ERRORLEVEL 1 goto noJava
goto end
:noJar
echo.
echo Failed to locate %JAR%.
echo.
pause
goto end
:noJava
echo.
echo Failed to locate java executable!
echo Please install Java Runtime Environment (JRE) and try again.
echo.
pause
goto end
:end