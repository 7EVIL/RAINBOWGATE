# LUCID Language Switch Fix — Main Menu + Settings (th / zh-Hans)

อัปเดตล่าสุด: 2026-11-06 (Asia/Bangkok)

## สรุป

เมนูหลักและ Settings อ่านข้อความจาก String Table เป็นหลัก:
- `/Game/Document/DocTable/ST_GameSettings` (namespace ว่างใน Game.archive)
- `/Game/Document/DocTable/ST_Difficulty` (Settings difficulty)
- `/Game/Document/DocTable/Continue` (NewStringTable: Continue / ContinueGame)

แปลครบเฉพาะ UI เมนู/Settings เป็น **Thai (th)** และ **Simplified Chinese (zh-Hans)** โดยคงภาษาอังกฤษต้นทางไว้

## Categories ที่แปลแล้ว

### Main menu / navigation (ST_GameSettings)
| Key | EN | TH | zh-Hans |
|---|---|---|---|
| NewGame | NEW GAME | เริ่มเกมใหม่ | 新游戏 |
| ResumeGame | RESUME | เล่นต่อ | 继续 |
| ResumeNormal | Resume | เล่นต่อ | 继续 |
| LoadGame | Load Game | โหลดเกม | 读取游戏 |
| Load | Load | โหลด | 读取 |
| Settings | SETTINGS | ตั้งค่า | 设置 |
| Credits | Credits | เครดิต | 制作人员 |
| QuitGame | QUIT | ออกจากเกม | 退出游戏 |
| ExittoMainMenu | EXIT TO MAIN MENU | กลับเมนูหลัก | 返回主菜单 |
| Extra | Bonus Chapter (Coming Soon) | บทโบนัส (เร็วๆ นี้) | 额外章节（即将推出） |
| Back | Back | ย้อนกลับ | 返回 |
| Apply | Apply | ใช้ | 应用 |
| Delete | Delete | ลบ | 删除 |
| GameLoaded | Game Loaded | โหลดเกมแล้ว | 游戏已读取 |
| GameSave | Game Saved | บันทึกเกมแล้ว | 游戏已保存 |

### Gameplay / Audio (ST_GameSettings)
GAMEPLAYSETTINGS, Languages, Difficulty, Fov, MouseSensitivity, HeadBobbing, SmoothCamera, Subtitles, Notifications, PlayerBreathing, Dof, VHSNoise, MasterVolume, MusicVolume, EffectsVolume, DialogueVolume

### Video / Display (ST_GameSettings)
VideoSettings, ScreenMode, ScreenResolution, ScreenPercentage, FPSLimit, VSync, ShowFPS, RayTracing, AntiAliasingQuality, ShadowQuality, TextureQuality, PostProcessingQuality, VisualEffectsQuality, ViewDistanceQuality, FoliageQuality, ShadingQuality, ReflectionQuality, ReflectionMethod, GlobalIlluminationQuality, GlobalIlluminationMethod, VolumetricFogQuality, TemporalUpsample, Fullscreen, Windowed, Borderless, Low/Medium/High/Extreme, On/Off, Unlimited, Lumen, ScreenSpace

### Input
InputSettings, RestoreDefaults

### Difficulty (ST_Difficulty)
Continue, Difficulty, NormalMode, StoryMode, NormalDescription, StoryDescription, NormalModechallenges, Prolouge

### Continue string table (NewStringTable)
Continue, ContinueGame

## สถิติรอบนี้ (t307u)

- **ST_GameSettings**: 67/67 keys มีคำแปล th + zh-Hans (ก่อนหน้านี้ทำไปแล้ว ~10 ปุ่มเมนูหลัก → รอบนี้เติมที่เหลือ + ยืนยันของเดิม)
- **ST_Difficulty**: 8/8
- **Continue table**: 2/2
- รวมแถวที่เกี่ยวกับเมนู/Settings ที่แตะรอบนี้: **77 key identities × 2 cultures**

## Compile

ใช้ ini เดิม:

`
Saved/SpiderTmp/Game_Compile_Menu.ini
`

คำสั่ง:

`
UnrealEditor-Cmd.exe C:/WORK/RAINBOWGATE/LUCID.uproject -run=GatherText -config=C:/WORK/RAINBOWGATE/Saved/SpiderTmp/Game_Compile_Menu.ini -unattended -nop4 -nosplash
`

ผล: regenerate `Content/Localization/Game/th/Game.locres` และ `zh-Hans/Game.locres`

ตรวจ binary: สตริงไทย/จีนของ MasterVolume, VideoSettings, StoryMode ฯลฯ อยู่ใน .locres แล้ว

## Live refresh

- Settings → ApplyGameplay ตั้ง `SetCurrentLanguage` ด้วย `SaveToConfig=true` แล้ว (งานก่อนหน้า)
- ข้อความที่ bind เป็น FText จาก String Table จะอัปเดตหลังเปลี่ยน culture โดยไม่ต้องเปิดเลเวลใหม่ ใน **Standalone Game** (แนะนำ `-dx11` ชั่วคราวถ้า D3D12 path-tracing ยังแครช)
- ใน Editor/PIE ธรรมดา `text_from_string_table` มักโชว์ source EN จนกว่าจะใช้ Game Localization Preview / Standalone — นี่เป็นข้อจำกัดของ editor ไม่ใช่ .locres ว่าง

## สิ่งที่ยังไม่แปล (จงใจ)

- ชื่อภาษาใน ComboBox (เช่น English / Français) — เป็น native culture display name จากระบบ ไม่ได้อยู่ใน ST_GameSettings
- ป้ายชื่อ action ของ keybinding จาก Enhanced Input — ไม่ได้อยู่ในเมนู String Table
- Dialogue / HUD / objectives นอกเมนู-Settings
- Cultures อื่นนอก th / zh-Hans

## Font

ใช้ `Font_Menu_HE` (Prompt Light fallback สำหรับไทย) ตามเดิม

## Backup

`Saved/Backup/MenuSettingsTranslate_20261106_230027`

## ไฟล์ที่เปลี่ยน

- `Content/Localization/Game/th/Game.archive`
- `Content/Localization/Game/th/Game.locres`
- `Content/Localization/Game/zh-Hans/Game.archive`
- `Content/Localization/Game/zh-Hans/Game.locres`
- `Content/Localization/Game/Game.locmeta` (regen)
- `docs/LUCID_Language_Switch_Fix.md` (ไฟล์นี้)