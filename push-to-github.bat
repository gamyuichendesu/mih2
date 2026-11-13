@echo off
REM ใช้: scripts\push-to-github.bat https://github.com/<ชื่อบัญชี>/mih-connect-prototype.git
if "%~1"=="" (
  echo ใส่ URL ของ repo ด้วย เช่น scripts\push-to-github.bat https://github.com/you/mih-connect-prototype.git
  exit /b 1
)
cd /d "%~dp0.."
git remote remove origin 2>nul
git remote add origin %1
git branch -M main
git push -u origin main
echo เสร็จแล้ว - ไปที่ https://vercel.com/new แล้ว Import repo นี้
