curl -L "https://docs.google.com/spreadsheets/d/1DRMm2H_1H9kY_Rwt40lexnXvmDHRQzAh_Jofruxj1lc/gviz/tq?tqx=out:csv&sheet=00000&range=D:D" > 2_translated/csv/00000.csv
curl -L "https://docs.google.com/spreadsheets/d/1DRMm2H_1H9kY_Rwt40lexnXvmDHRQzAh_Jofruxj1lc/gviz/tq?tqx=out:csv&sheet=sc01(Akihisa)&range=D:D" > 2_translated/csv/00001.csv
curl -L "https://docs.google.com/spreadsheets/d/1DRMm2H_1H9kY_Rwt40lexnXvmDHRQzAh_Jofruxj1lc/gviz/tq?tqx=out:csv&sheet=sc02(Akihisa)&range=D:D" > 2_translated/csv/00002.csv
curl -L "https://docs.google.com/spreadsheets/d/1DRMm2H_1H9kY_Rwt40lexnXvmDHRQzAh_Jofruxj1lc/gviz/tq?tqx=out:csv&sheet=sc03(Akihisa)&range=D:D" > 2_translated/csv/00003.csv
curl -L "https://docs.google.com/spreadsheets/d/1DRMm2H_1H9kY_Rwt40lexnXvmDHRQzAh_Jofruxj1lc/gviz/tq?tqx=out:csv&sheet=sc04(Akihisa)&range=D:D" > 2_translated/csv/00004.csv
curl -L "https://docs.google.com/spreadsheets/d/1DRMm2H_1H9kY_Rwt40lexnXvmDHRQzAh_Jofruxj1lc/gviz/tq?tqx=out:csv&sheet=sc05(Akihisa)&range=D:D" > 2_translated/csv/00005.csv
curl -L "https://docs.google.com/spreadsheets/d/1DRMm2H_1H9kY_Rwt40lexnXvmDHRQzAh_Jofruxj1lc/gviz/tq?tqx=out:csv&sheet=sc06(Akihisa)&range=D:D" > 2_translated/csv/00006.csv
curl -L "https://docs.google.com/spreadsheets/d/1DRMm2H_1H9kY_Rwt40lexnXvmDHRQzAh_Jofruxj1lc/gviz/tq?tqx=out:csv&sheet=sc07(Akihisa)&range=D:D" > 2_translated/csv/00007.csv
curl -L "https://docs.google.com/spreadsheets/d/1DRMm2H_1H9kY_Rwt40lexnXvmDHRQzAh_Jofruxj1lc/gviz/tq?tqx=out:csv&sheet=sc08(Akihisa)&range=D:D" > 2_translated/csv/00008.csv



curl -L "https://docs.google.com/spreadsheets/d/15APgtFbKWwd3qdUHaGuwOuxs16qOgO8h3ZuaiZdlM7M/gviz/tq?tqx=out:csv&sheet=sc74(Akihisa)&range=C:C" > 2_translated/csv/00074.csv



python tools/csvhelper/bakatotransfer.py 2_translated/csv 2_translated/txt


::Reduce Png to 8bpp in for the translated folder
@echo off
setlocal enabledelayedexpansion
set "pngquant= tools\Pngquant\pngquant.exe"

for /r "2_translated/cgs" %%F in (*.png) do (
    echo Processing: "%%F"
    call %pngquant% --force --verbose 256 --ext .png "%%F"
)

tools\baka\Baka.exe 1_extracted\sc 2_translated\txt 2_translated\sc
python Insert.py
pause