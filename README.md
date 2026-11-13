# MIH Connect · Prototype (เว็บ static สำหรับ Vercel)

ต้นแบบระบบ MIH Connect v4 ครบทุกหน้า (บริษัทยา / หน่วยงาน / นักวิจัย) ข้อมูลทั้งหมดเป็นข้อมูลสมมุติ
ไม่มีฐานข้อมูลหรือ backend · กดรีเฟรชแล้วข้อมูลที่กรอกจะกลับเป็นค่าเริ่มต้น

## ขึ้น GitHub แล้ว Deploy Vercel

โฟลเดอร์นี้เป็น git repo พร้อมแล้ว (มี commit แรกในสาขา `main`) เลือก 1 วิธี

**วิธี A · อัปโหลดผ่านหน้าเว็บ GitHub (ไม่ต้องใช้คำสั่ง)**
1. github.com/new → ตั้งชื่อ `mih-connect-prototype` → เลือก **Private** → Create repository
2. กด **uploading an existing file** → ลากไฟล์และโฟลเดอร์ทั้งหมดในโฟลเดอร์นี้ไปวาง → **Commit changes**
   (โฟลเดอร์ที่ขึ้นต้นด้วยจุด เช่น `.github` อาจถูกซ่อนในเครื่อง ไม่จำเป็นต้องอัปโหลด)

**วิธี B · ใช้ git (เก็บประวัติ commit ไว้ด้วย)**
1. github.com/new → สร้าง repo ว่าง (ไม่ต้องติ๊ก Add README)
2. เปิด Terminal ในโฟลเดอร์นี้ แล้วรัน
   - Mac / Linux: `./scripts/push-to-github.sh https://github.com/<บัญชี>/mih-connect-prototype.git`
   - Windows: `scripts\push-to-github.bat https://github.com/<บัญชี>/mih-connect-prototype.git`

**จากนั้น Deploy**
1. vercel.com/new → Import repo `mih-connect-prototype`
2. Framework Preset: **Other** · Build Command: เว้นว่าง · Output Directory: เว้นว่าง → **Deploy**
3. ครั้งต่อไปแค่ push / อัปโหลดไฟล์ใหม่ Vercel deploy ให้อัตโนมัติ

> `.github/workflows/deploy-vercel.yml` เป็นทางเลือกสำรอง ใช้เมื่อไม่ได้เชื่อม repo กับ Vercel โดยตรง
> ปิดไว้เป็นค่าเริ่มต้น เปิดใช้โดยตั้ง Variable `USE_GITHUB_ACTIONS_DEPLOY=true` และ Secrets `VERCEL_TOKEN`, `VERCEL_ORG_ID`, `VERCEL_PROJECT_ID`

**หรือไม่ผ่าน GitHub:** `npx vercel --prod` ในโฟลเดอร์นี้

## โครงสร้างไฟล์
| ไฟล์ | หน้าที่ |
|---|---|
| `index.html` | ตัว prototype ทั้งหมด (สร้างจากแคนวาส v4) |
| `support.js` | runtime ที่แสดงผล prototype |
| `vendor/` | React 18.3.1, ReactDOM, Babel — เก็บไว้ในเว็บเอง ไม่พึ่ง CDN |
| `assets/` | โลโก้ ตรา สธ. ภาพประกอบ 3 กลุ่ม และไฟล์ตัวอย่างนำเข้า (.xlsx) |
| `vercel.json` | ตั้งค่า noindex, cache, และให้ทุก URL เปิดหน้า prototype |
| `.vercelignore` | ไม่เอา `scripts/` และ `.github/` ขึ้นเว็บ |
| `scripts/` | สคริปต์ push ขึ้น GitHub (Mac/Linux และ Windows) |
| `.github/workflows/` | deploy ผ่าน GitHub Actions (สำรอง ปิดไว้) |

## หมายเหตุ
- ตั้ง `noindex` ไว้ทั้งเว็บ (Google ไม่เก็บ) และมีป้าย "Prototype · ข้อมูลสมมุติ" ที่ขอบล่าง เพื่อไม่ให้ถูกเข้าใจว่าเป็นระบบจริงของกระทรวง
- ฟอนต์ Inter + IBM Plex Sans Thai โหลดจาก Google Fonts
- ถ้าต้องการจำกัดคนเข้าดู: Vercel → Project → Settings → **Deployment Protection** (Vercel Authentication หรือ Password Protection)
- มุมล่างซ้ายของ sidebar มี "สลับมุมมอง (เดโม)" ใช้สลับบทบาทระหว่างนำเสนอ
