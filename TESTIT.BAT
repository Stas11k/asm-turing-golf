@echo off
echo === TM Contest Tests ===
echo.

echo Compiling cmp.asm...
tasm /s /m /n /q /zn cmp.asm
if errorlevel 1 goto buildfail
tlink /3 /t /n /x cmp
if errorlevel 1 goto buildfail

echo Compiling tm.asm...
tasm /s /m /n /q /zn tm.asm
if errorlevel 1 goto buildfail
tlink /3 /t /n /x tm
if errorlevel 1 goto buildfail
echo Build OK: TM.COM
dir tm.com
echo.

echo Running test 00...
tm.com tests\00.tm >tests\00.res
cmp.com tests\00.res tests\00.ok
if errorlevel 1 goto fail00
echo   [PASS] 00
goto done00
:fail00
echo   [FAIL] 00
:done00

echo.
echo ========================
echo Tests complete.
goto end

:buildfail
echo.
echo BUILD FAILED - fix compilation errors before running tests.

:end
