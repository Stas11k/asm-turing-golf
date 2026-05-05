@echo off
REM ===========================================================
REM  Contest test runner — run from student drive (F:)
REM  Expects: F:\tm.asm (student code), F:\tests\*.tm
REM  Usage: F:\> TESTALL
REM ===========================================================

echo === Contest Test Runner ===
echo.

REM Compile cmp.asm from shared repo
echo Compiling cmp.asm...
tasm /s /m /n /q /zn cmp.asm
if errorlevel 1 goto buildfail
tlink /3 /t /n /x cmp
if errorlevel 1 goto buildfail
echo   CMP.COM OK

REM Compile timeit.asm from shared repo (used for per-test timestamps)
tasm /s /m /n /q /zn timeit.asm
if errorlevel 1 goto buildfail
tlink /3 /t /n /x timeit
if errorlevel 1 goto buildfail
echo   TIMEIT.COM OK
echo.

REM Compile student's tm.asm
echo Compiling tm.asm...
tasm /s /m /n /q /zn tm.asm
if errorlevel 1 goto buildfail
tlink /3 /t /n /x tm
if errorlevel 1 goto buildfail
echo   TM.COM OK
dir tm.com | find "TM"
echo.

REM Write header to results file
echo RESULTS > F:\results.txt

REM Run each test
echo Running tests...

echo Running 00... >> F:\results.txt
timeit >>F:\results.txt
tm.com F:\tests\00.tm >F:\out.tmp
cmp.com F:\out.tmp F:\tests\00.ok
if errorlevel 1 goto f00
echo   [PASS] 00
echo PASS 00 >> F:\results.txt
goto n01
:f00
echo   [FAIL] 00
echo FAIL 00 >> F:\results.txt
:n01

timeit >>F:\results.txt
tm.com F:\tests\01.tm >F:\out.tmp
cmp.com F:\out.tmp F:\tests\01.ok
if errorlevel 1 goto f01
echo   [PASS] 01
echo PASS 01 >> F:\results.txt
goto n02
:f01
echo   [FAIL] 01
echo FAIL 01 >> F:\results.txt
:n02

timeit >>F:\results.txt
tm.com F:\tests\02.tm >F:\out.tmp
cmp.com F:\out.tmp F:\tests\02.ok
if errorlevel 1 goto f02
echo   [PASS] 02
echo PASS 02 >> F:\results.txt
goto n03
:f02
echo   [FAIL] 02
echo FAIL 02 >> F:\results.txt
:n03

timeit >>F:\results.txt
tm.com F:\tests\03.tm >F:\out.tmp
cmp.com F:\out.tmp F:\tests\03.ok
if errorlevel 1 goto f03
echo   [PASS] 03
echo PASS 03 >> F:\results.txt
goto n04
:f03
echo   [FAIL] 03
echo FAIL 03 >> F:\results.txt
:n04

timeit >>F:\results.txt
tm.com F:\tests\04.tm >F:\out.tmp
cmp.com F:\out.tmp F:\tests\04.ok
if errorlevel 1 goto f04
echo   [PASS] 04
echo PASS 04 >> F:\results.txt
goto n05
:f04
echo   [FAIL] 04
echo FAIL 04 >> F:\results.txt
:n05

timeit >>F:\results.txt
tm.com F:\tests\05.tm >F:\out.tmp
cmp.com F:\out.tmp F:\tests\05.ok
if errorlevel 1 goto f05
echo   [PASS] 05
echo PASS 05 >> F:\results.txt
goto n06
:f05
echo   [FAIL] 05
echo FAIL 05 >> F:\results.txt
:n06

timeit >>F:\results.txt
tm.com F:\tests\06.tm >F:\out.tmp
cmp.com F:\out.tmp F:\tests\06.ok
if errorlevel 1 goto f06
echo   [PASS] 06
echo PASS 06 >> F:\results.txt
goto n07
:f06
echo   [FAIL] 06
echo FAIL 06 >> F:\results.txt
:n07

timeit >>F:\results.txt
tm.com F:\tests\07.tm >F:\out.tmp
cmp.com F:\out.tmp F:\tests\07.ok
if errorlevel 1 goto f07
echo   [PASS] 07
echo PASS 07 >> F:\results.txt
goto n08
:f07
echo   [FAIL] 07
echo FAIL 07 >> F:\results.txt
:n08

timeit >>F:\results.txt
tm.com F:\tests\08.tm >F:\out.tmp
cmp.com F:\out.tmp F:\tests\08.ok
if errorlevel 1 goto f08
echo   [PASS] 08
echo PASS 08 >> F:\results.txt
goto n09
:f08
echo   [FAIL] 08
echo FAIL 08 >> F:\results.txt
:n09

timeit >>F:\results.txt
tm.com F:\tests\09.tm >F:\out.tmp
cmp.com F:\out.tmp F:\tests\09.ok
if errorlevel 1 goto f09
echo   [PASS] 09
echo PASS 09 >> F:\results.txt
goto n10
:f09
echo   [FAIL] 09
echo FAIL 09 >> F:\results.txt
:n10

timeit >>F:\results.txt
tm.com F:\tests\10.tm >F:\out.tmp
cmp.com F:\out.tmp F:\tests\10.ok
if errorlevel 1 goto f10
echo   [PASS] 10
echo PASS 10 >> F:\results.txt
goto n11
:f10
echo   [FAIL] 10
echo FAIL 10 >> F:\results.txt
:n11

timeit >>F:\results.txt
tm.com F:\tests\11.tm >F:\out.tmp
cmp.com F:\out.tmp F:\tests\11.ok
if errorlevel 1 goto f11
echo   [PASS] 11
echo PASS 11 >> F:\results.txt
goto n12
:f11
echo   [FAIL] 11
echo FAIL 11 >> F:\results.txt
:n12

timeit >>F:\results.txt
tm.com F:\tests\12.tm >F:\out.tmp
cmp.com F:\out.tmp F:\tests\12.ok
if errorlevel 1 goto f12
echo   [PASS] 12
echo PASS 12 >> F:\results.txt
goto n13
:f12
echo   [FAIL] 12
echo FAIL 12 >> F:\results.txt
:n13

timeit >>F:\results.txt
tm.com F:\tests\13.tm >F:\out.tmp
cmp.com F:\out.tmp F:\tests\13.ok
if errorlevel 1 goto f13
echo   [PASS] 13
echo PASS 13 >> F:\results.txt
goto n14
:f13
echo   [FAIL] 13
echo FAIL 13 >> F:\results.txt
:n14

timeit >>F:\results.txt
tm.com F:\tests\14.tm >F:\out.tmp
cmp.com F:\out.tmp F:\tests\14.ok
if errorlevel 1 goto f14
echo   [PASS] 14
echo PASS 14 >> F:\results.txt
goto n15
:f14
echo   [FAIL] 14
echo FAIL 14 >> F:\results.txt
:n15

timeit >>F:\results.txt
tm.com F:\tests\15.tm >F:\out.tmp
cmp.com F:\out.tmp F:\tests\15.ok
if errorlevel 1 goto f15
echo   [PASS] 15
echo PASS 15 >> F:\results.txt
goto n16
:f15
echo   [FAIL] 15
echo FAIL 15 >> F:\results.txt
:n16

timeit >>F:\results.txt
tm.com F:\tests\16.tm >F:\out.tmp
cmp.com F:\out.tmp F:\tests\16.ok
if errorlevel 1 goto f16
echo   [PASS] 16
echo PASS 16 >> F:\results.txt
goto n17
:f16
echo   [FAIL] 16
echo FAIL 16 >> F:\results.txt
:n17

timeit >>F:\results.txt
tm.com F:\tests\17.tm >F:\out.tmp
cmp.com F:\out.tmp F:\tests\17.ok
if errorlevel 1 goto f17
echo   [PASS] 17
echo PASS 17 >> F:\results.txt
goto n18
:f17
echo   [FAIL] 17
echo FAIL 17 >> F:\results.txt
:n18

timeit >>F:\results.txt
tm.com F:\tests\18.tm >F:\out.tmp
cmp.com F:\out.tmp F:\tests\18.ok
if errorlevel 1 goto f18
echo   [PASS] 18
echo PASS 18 >> F:\results.txt
goto n19
:f18
echo   [FAIL] 18
echo FAIL 18 >> F:\results.txt
:n19

timeit >>F:\results.txt
tm.com F:\tests\19.tm >F:\out.tmp
cmp.com F:\out.tmp F:\tests\19.ok
if errorlevel 1 goto f19
echo   [PASS] 19
echo PASS 19 >> F:\results.txt
goto n20
:f19
echo   [FAIL] 19
echo FAIL 19 >> F:\results.txt
:n20

timeit >>F:\results.txt
tm.com F:\tests\20.tm >F:\out.tmp
cmp.com F:\out.tmp F:\tests\20.ok
if errorlevel 1 goto f20
echo   [PASS] 20
echo PASS 20 >> F:\results.txt
goto n01a
:f20
echo   [FAIL] 20
echo FAIL 20 >> F:\results.txt
:n01a

timeit >>F:\results.txt
tm.com F:\tests\01a.tm >F:\out.tmp
cmp.com F:\out.tmp F:\tests\01a.ok
if errorlevel 1 goto f01a
echo   [PASS] 01a
echo PASS 01a >> F:\results.txt
goto n02a
:f01a
echo   [FAIL] 01a
echo FAIL 01a >> F:\results.txt
:n02a

timeit >>F:\results.txt
tm.com F:\tests\02a.tm >F:\out.tmp
cmp.com F:\out.tmp F:\tests\02a.ok
if errorlevel 1 goto f02a
echo   [PASS] 02a
echo PASS 02a >> F:\results.txt
goto n03a
:f02a
echo   [FAIL] 02a
echo FAIL 02a >> F:\results.txt
:n03a

timeit >>F:\results.txt
tm.com F:\tests\03a.tm >F:\out.tmp
cmp.com F:\out.tmp F:\tests\03a.ok
if errorlevel 1 goto f03a
echo   [PASS] 03a
echo PASS 03a >> F:\results.txt
goto n04a
:f03a
echo   [FAIL] 03a
echo FAIL 03a >> F:\results.txt
:n04a

timeit >>F:\results.txt
tm.com F:\tests\04a.tm >F:\out.tmp
cmp.com F:\out.tmp F:\tests\04a.ok
if errorlevel 1 goto f04a
echo   [PASS] 04a
echo PASS 04a >> F:\results.txt
goto n05a
:f04a
echo   [FAIL] 04a
echo FAIL 04a >> F:\results.txt
:n05a

timeit >>F:\results.txt
tm.com F:\tests\05a.tm >F:\out.tmp
cmp.com F:\out.tmp F:\tests\05a.ok
if errorlevel 1 goto f05a
echo   [PASS] 05a
echo PASS 05a >> F:\results.txt
goto n06a
:f05a
echo   [FAIL] 05a
echo FAIL 05a >> F:\results.txt
:n06a

timeit >>F:\results.txt
tm.com F:\tests\06a.tm >F:\out.tmp
cmp.com F:\out.tmp F:\tests\06a.ok
if errorlevel 1 goto f06a
echo   [PASS] 06a
echo PASS 06a >> F:\results.txt
goto ne01
:f06a
echo   [FAIL] 06a
echo FAIL 06a >> F:\results.txt
:ne01

timeit >>F:\results.txt
tm.com F:\tests\e01.tm >F:\out.tmp
cmp.com F:\out.tmp F:\tests\e01.ok
if errorlevel 1 goto fe01
echo   [PASS] e01
echo PASS e01 >> F:\results.txt
goto ne02
:fe01
echo   [FAIL] e01
echo FAIL e01 >> F:\results.txt
:ne02

timeit >>F:\results.txt
tm.com F:\tests\e02.tm >F:\out.tmp
cmp.com F:\out.tmp F:\tests\e02.ok
if errorlevel 1 goto fe02
echo   [PASS] e02
echo PASS e02 >> F:\results.txt
goto ne03
:fe02
echo   [FAIL] e02
echo FAIL e02 >> F:\results.txt
:ne03

timeit >>F:\results.txt
tm.com F:\tests\e03.tm >F:\out.tmp
cmp.com F:\out.tmp F:\tests\e03.ok
if errorlevel 1 goto fe03
echo   [PASS] e03
echo PASS e03 >> F:\results.txt
goto ne04
:fe03
echo   [FAIL] e03
echo FAIL e03 >> F:\results.txt
:ne04

timeit >>F:\results.txt
tm.com F:\tests\e04.tm >F:\out.tmp
cmp.com F:\out.tmp F:\tests\e04.ok
if errorlevel 1 goto fe04
echo   [PASS] e04
echo PASS e04 >> F:\results.txt
goto ne05
:fe04
echo   [FAIL] e04
echo FAIL e04 >> F:\results.txt
:ne05

timeit >>F:\results.txt
tm.com F:\tests\e05.tm >F:\out.tmp
cmp.com F:\out.tmp F:\tests\e05.ok
if errorlevel 1 goto fe05
echo   [PASS] e05
echo PASS e05 >> F:\results.txt
goto ne06
:fe05
echo   [FAIL] e05
echo FAIL e05 >> F:\results.txt
:ne06

timeit >>F:\results.txt
tm.com F:\tests\e06.tm >F:\out.tmp
cmp.com F:\out.tmp F:\tests\e06.ok
if errorlevel 1 goto fe06
echo   [PASS] e06
echo PASS e06 >> F:\results.txt
goto ne07
:fe06
echo   [FAIL] e06
echo FAIL e06 >> F:\results.txt
:ne07

timeit >>F:\results.txt
tm.com F:\tests\e07.tm >F:\out.tmp
cmp.com F:\out.tmp F:\tests\e07.ok
if errorlevel 1 goto fe07
echo   [PASS] e07
echo PASS e07 >> F:\results.txt
goto ne08
:fe07
echo   [FAIL] e07
echo FAIL e07 >> F:\results.txt
:ne08

timeit >>F:\results.txt
tm.com F:\tests\e08.tm >F:\out.tmp
cmp.com F:\out.tmp F:\tests\e08.ok
if errorlevel 1 goto fe08
echo   [PASS] e08
echo PASS e08 >> F:\results.txt
goto ne09
:fe08
echo   [FAIL] e08
echo FAIL e08 >> F:\results.txt
:ne09

timeit >>F:\results.txt
tm.com F:\tests\e09.tm >F:\out.tmp
cmp.com F:\out.tmp F:\tests\e09.ok
if errorlevel 1 goto fe09
echo   [PASS] e09
echo PASS e09 >> F:\results.txt
goto ne10
:fe09
echo   [FAIL] e09
echo FAIL e09 >> F:\results.txt
:ne10

timeit >>F:\results.txt
tm.com F:\tests\e10.tm >F:\out.tmp
cmp.com F:\out.tmp F:\tests\e10.ok
if errorlevel 1 goto fe10
echo   [PASS] e10
echo PASS e10 >> F:\results.txt
goto ne11
:fe10
echo   [FAIL] e10
echo FAIL e10 >> F:\results.txt
:ne11

timeit >>F:\results.txt
tm.com F:\tests\e11.tm >F:\out.tmp
cmp.com F:\out.tmp F:\tests\e11.ok
if errorlevel 1 goto fe11
echo   [PASS] e11
echo PASS e11 >> F:\results.txt
goto ne12
:fe11
echo   [FAIL] e11
echo FAIL e11 >> F:\results.txt
:ne12

timeit >>F:\results.txt
tm.com F:\tests\e12.tm >F:\out.tmp
cmp.com F:\out.tmp F:\tests\e12.ok
if errorlevel 1 goto fe12
echo   [PASS] e12
echo PASS e12 >> F:\results.txt
goto ne13
:fe12
echo   [FAIL] e12
echo FAIL e12 >> F:\results.txt
:ne13

timeit >>F:\results.txt
tm.com F:\tests\e13.tm >F:\out.tmp
cmp.com F:\out.tmp F:\tests\e13.ok
if errorlevel 1 goto fe13
echo   [PASS] e13
echo PASS e13 >> F:\results.txt
goto ne14
:fe13
echo   [FAIL] e13
echo FAIL e13 >> F:\results.txt
:ne14

timeit >>F:\results.txt
tm.com F:\tests\e14.tm >F:\out.tmp
cmp.com F:\out.tmp F:\tests\e14.ok
if errorlevel 1 goto fe14
echo   [PASS] e14
echo PASS e14 >> F:\results.txt
goto ne15
:fe14
echo   [FAIL] e14
echo FAIL e14 >> F:\results.txt
:ne15

timeit >>F:\results.txt
tm.com F:\tests\e15.tm >F:\out.tmp
cmp.com F:\out.tmp F:\tests\e15.ok
if errorlevel 1 goto fe15
echo   [PASS] e15
echo PASS e15 >> F:\results.txt
goto ns01
:fe15
echo   [FAIL] e15
echo FAIL e15 >> F:\results.txt
:ns01

timeit >>F:\results.txt
tm.com F:\tests\s01.tm >F:\out.tmp
cmp.com F:\out.tmp F:\tests\s01.ok
if errorlevel 1 goto fs01
echo   [PASS] s01
echo PASS s01 >> F:\results.txt
goto ns02
:fs01
echo   [FAIL] s01
echo FAIL s01 >> F:\results.txt
:ns02

timeit >>F:\results.txt
tm.com F:\tests\s02.tm >F:\out.tmp
cmp.com F:\out.tmp F:\tests\s02.ok
if errorlevel 1 goto fs02
echo   [PASS] s02
echo PASS s02 >> F:\results.txt
goto ns03
:fs02
echo   [FAIL] s02
echo FAIL s02 >> F:\results.txt
:ns03

timeit >>F:\results.txt
tm.com F:\tests\s03.tm >F:\out.tmp
cmp.com F:\out.tmp F:\tests\s03.ok
if errorlevel 1 goto fs03
echo   [PASS] s03
echo PASS s03 >> F:\results.txt
goto ns04
:fs03
echo   [FAIL] s03
echo FAIL s03 >> F:\results.txt
:ns04

timeit >>F:\results.txt
tm.com F:\tests\s04.tm >F:\out.tmp
cmp.com F:\out.tmp F:\tests\s04.ok
if errorlevel 1 goto fs04
echo   [PASS] s04
echo PASS s04 >> F:\results.txt
goto ns05
:fs04
echo   [FAIL] s04
echo FAIL s04 >> F:\results.txt
:ns05

timeit >>F:\results.txt
tm.com F:\tests\s05.tm >F:\out.tmp
cmp.com F:\out.tmp F:\tests\s05.ok
if errorlevel 1 goto fs05
echo   [PASS] s05
echo PASS s05 >> F:\results.txt
goto nc01
:fs05
echo   [FAIL] s05
echo FAIL s05 >> F:\results.txt
:nc01

timeit >>F:\results.txt
tm.com F:\tests\c01.tm >F:\out.tmp
cmp.com F:\out.tmp F:\tests\c01.ok
if errorlevel 1 goto fc01
echo   [PASS] c01
echo PASS c01 >> F:\results.txt
goto nc02
:fc01
echo   [FAIL] c01
echo FAIL c01 >> F:\results.txt
:nc02

timeit >>F:\results.txt
tm.com F:\tests\c02.tm >F:\out.tmp
cmp.com F:\out.tmp F:\tests\c02.ok
if errorlevel 1 goto fc02
echo   [PASS] c02
echo PASS c02 >> F:\results.txt
goto nc03
:fc02
echo   [FAIL] c02
echo FAIL c02 >> F:\results.txt
:nc03

timeit >>F:\results.txt
tm.com F:\tests\c03.tm >F:\out.tmp
cmp.com F:\out.tmp F:\tests\c03.ok
if errorlevel 1 goto fc03
echo   [PASS] c03
echo PASS c03 >> F:\results.txt
goto nc04
:fc03
echo   [FAIL] c03
echo FAIL c03 >> F:\results.txt
:nc04

timeit >>F:\results.txt
tm.com F:\tests\c04.tm >F:\out.tmp
cmp.com F:\out.tmp F:\tests\c04.ok
if errorlevel 1 goto fc04
echo   [PASS] c04
echo PASS c04 >> F:\results.txt
goto nc05
:fc04
echo   [FAIL] c04
echo FAIL c04 >> F:\results.txt
:nc05

timeit >>F:\results.txt
tm.com F:\tests\c05.tm >F:\out.tmp
cmp.com F:\out.tmp F:\tests\c05.ok
if errorlevel 1 goto fc05
echo   [PASS] c05
echo PASS c05 >> F:\results.txt
goto nc06
:fc05
echo   [FAIL] c05
echo FAIL c05 >> F:\results.txt
:nc06

timeit >>F:\results.txt
tm.com F:\tests\c06.tm >F:\out.tmp
cmp.com F:\out.tmp F:\tests\c06.ok
if errorlevel 1 goto fc06
echo   [PASS] c06
echo PASS c06 >> F:\results.txt
goto nc07
:fc06
echo   [FAIL] c06
echo FAIL c06 >> F:\results.txt
:nc07

timeit >>F:\results.txt
tm.com F:\tests\c07.tm >F:\out.tmp
cmp.com F:\out.tmp F:\tests\c07.ok
if errorlevel 1 goto fc07
echo   [PASS] c07
echo PASS c07 >> F:\results.txt
goto nc08
:fc07
echo   [FAIL] c07
echo FAIL c07 >> F:\results.txt
:nc08

timeit >>F:\results.txt
tm.com F:\tests\c08.tm >F:\out.tmp
cmp.com F:\out.tmp F:\tests\c08.ok
if errorlevel 1 goto fc08
echo   [PASS] c08
echo PASS c08 >> F:\results.txt
goto nc09
:fc08
echo   [FAIL] c08
echo FAIL c08 >> F:\results.txt
:nc09

timeit >>F:\results.txt
tm.com F:\tests\c09.tm >F:\out.tmp
cmp.com F:\out.tmp F:\tests\c09.ok
if errorlevel 1 goto fc09
echo   [PASS] c09
echo PASS c09 >> F:\results.txt
goto nc10
:fc09
echo   [FAIL] c09
echo FAIL c09 >> F:\results.txt
:nc10

timeit >>F:\results.txt
tm.com F:\tests\c10.tm >F:\out.tmp
cmp.com F:\out.tmp F:\tests\c10.ok
if errorlevel 1 goto fc10
echo   [PASS] c10
echo PASS c10 >> F:\results.txt
goto nc11
:fc10
echo   [FAIL] c10
echo FAIL c10 >> F:\results.txt
:nc11

timeit >>F:\results.txt
tm.com F:\tests\c11.tm >F:\out.tmp
cmp.com F:\out.tmp F:\tests\c11.ok
if errorlevel 1 goto fc11
echo   [PASS] c11
echo PASS c11 >> F:\results.txt
goto nc12
:fc11
echo   [FAIL] c11
echo FAIL c11 >> F:\results.txt
:nc12

timeit >>F:\results.txt
tm.com F:\tests\c12.tm >F:\out.tmp
cmp.com F:\out.tmp F:\tests\c12.ok
if errorlevel 1 goto fc12
echo   [PASS] c12
echo PASS c12 >> F:\results.txt
goto nc13
:fc12
echo   [FAIL] c12
echo FAIL c12 >> F:\results.txt
:nc13

timeit >>F:\results.txt
tm.com F:\tests\c13.tm >F:\out.tmp
cmp.com F:\out.tmp F:\tests\c13.ok
if errorlevel 1 goto fc13
echo   [PASS] c13
echo PASS c13 >> F:\results.txt
goto nc14
:fc13
echo   [FAIL] c13
echo FAIL c13 >> F:\results.txt
:nc14

timeit >>F:\results.txt
tm.com F:\tests\c14.tm >F:\out.tmp
cmp.com F:\out.tmp F:\tests\c14.ok
if errorlevel 1 goto fc14
echo   [PASS] c14
echo PASS c14 >> F:\results.txt
goto alldone
:fc14
echo   [FAIL] c14
echo FAIL c14 >> F:\results.txt
timeit >>F:\results.txt
:alldone

echo.
echo ========================
echo Tests complete. Results saved to F:\results.txt
echo DONE >> F:\results.txt
goto end

:buildfail
echo.
echo BUILD FAILED
echo BUILD_FAILED >> F:\results.txt
echo DONE >> F:\results.txt

:end