@echo off
chcp 65001 >nul
title AI Workspace Launcher
cd /d "%~dp0"

color 0A

:MENU
cls
echo.
echo ============================================================================
echo                         AI Workspace — 模型啟動器
echo ============================================================================
echo.
echo  工作站: %COMPUTERNAME%
echo  顯卡: NVIDIA RTX 3050 Laptop (4GB VRAM)
echo.
echo ----------------------------------- 已安裝 -----------------------------------
echo.
echo [1] Holo 3.1 4B Q4_K_M        3.0 GB  — 輕量AI Agent（推薦日常使用）
echo.
echo ----------------------------------- 待下載 -----------------------------------
echo.
echo [2] Qwen3.6-35B-A3B IQ2_M    11.7 GB — 越獄模型（無審查、支援視覺）
echo [3] Gemma-4-31B Q3_K_M       15.3 GB — 越獄模型（質量與速度平衡）
echo [4] Gemma-4-31B Q4_K_M       18.7 GB — 越獄模型（畫質最佳）
echo.
echo ----------------------------------- 工具 -------------------------------------
echo.
echo [5] 下載/續傳所有模型
echo [6] 檢查系統資源
echo [7] 筆記本模式（僅CPU）
echo.
echo [0] 退出
echo.
echo ============================================================================
set /p choice=請選擇:

if "%choice%"=="1" goto HOLO
if "%choice%"=="2" goto QWEN_INSTALL
if "%choice%"=="3" goto GEMMA_INSTALL
if "%choice%"=="4" goto GEMMA_INSTALL
if "%choice%"=="5" goto DOWNLOAD
if "%choice%"=="6" goto SYSINFO
if "%choice%"=="7" goto CPU_MODE
if "%choice%"=="0" exit /b
goto MENU

:HOLO
cls
echo 啟動 Holo 3.1 4B...
rem 請先下載 llama-server.exe 並放在 scripts\ 目錄
rem 下載: https://github.com/ggml-org/llama.cpp/releases
set LLAMA=%~dp0scripts\llama-server.exe
set MODEL=%~dp0models\holo-3.1\holo-3.1-4b-q4_k_m.gguf

if not exist "%MODEL%" (
    echo [錯誤] 找不到模型！請先下載（選項5）
    echo 或從桌面複製: C:\Users\kin16\Desktop\llama-b9672-bin-win-cuda-12.4-x64\models\
    pause
    goto MENU
)

echo.
echo 選擇模式：
echo [1] GPU+CPU混合（推薦）- 將20層放在GPU
echo [2] CPU模式（最慢但穩定）
echo [3] GPU全力（嘗試全部使用GPU）
set /p gpu=選擇:

if "%gpu%"=="1" "%LLAMA%" -m "%MODEL%" -c 4096 -ngl 20 --host 127.0.0.1 --port 1234 --temp 0.2 --top-p 0.9
if "%gpu%"=="2" "%LLAMA%" -m "%MODEL%" -c 2048 -ngl 0 --threads 8 --host 127.0.0.1 --port 1234
if "%gpu%"=="3" "%LLAMA%" -m "%MODEL%" -c 4096 -ngl 999 --host 127.0.0.1 --port 1234 --temp 0.2 --top-p 0.9

pause
goto MENU

:QWEN_INSTALL
cls
echo Qwen3.6-35B 尚未下載（11.7GB）
echo.
echo 你的 4GB VRAM 無法完全載入此模型
echo 建議使用 GPU 混合模式（最多 8 層）
echo.
echo 要開始下載嗎？[Y/N]
set /p dl=
if /i "%dl%"=="Y" (
    echo 啟動下載...
    start powershell -Command "Invoke-WebRequest -Uri 'https://huggingface.co/hauffy/Qwen3.6-35B-A3B-Uncensored-HauhauCS-Aggressive-IQ2_M-GGUF/resolve/main/qwen3.6-35b-a3b-uncensored-iq2_m.gguf' -OutFile 'D:\ai-workspace\models\qwen3.6\qwen3.6-35b-a3b-uncensored-iq2_m.gguf' -Headers @{'User-Agent'='Mozilla/5.0'} -TimeoutSec 7200"
)
pause
goto MENU

:GEMMA_INSTALL
cls
echo Gemma-4-31B 尚未下載（15-18GB）
echo 你的 4GB VRAM 只能以 CPU 模式運行
echo.
pause
goto MENU

:DOWNLOAD
cls
echo ================ 大量下載管理 ================
echo.
echo   [1] Holo 3.1 4B (3 GB) — 74% 完成
echo   [2] Qwen3.6 35B (11.7 GB)
echo   [3] Gemma 4 31B Q3 (15.3 GB)
echo   [4] Gemma 4 31B Q4 (18.7 GB)
echo.
echo   注意：總計約 48GB，會花很長時間
echo   建議先完成 Holo 3.1，其他夜間下載
echo.
pause
goto MENU

:SYSINFO
cls
echo ================ 系統資源 ================
echo.
wmic path Win32_VideoController get Name,AdapterRAM /format:table
echo.
systeminfo | findstr "可用物理記憶體"
echo.
wmic os get FreePhysicalMemory /format:value
echo.
pause
goto MENU

:CPU_MODE
cls
echo ================ 筆記本模式（僅 CPU）===============
echo 所有模型將僅使用 CPU，速度較慢但節省電力
echo.
echo 建議: 使用 Holo 3.1 0.8B 模型
echo.
pause
goto MENU
