# LESSON - RAINBOWGATE / LUCID

## Use This Project Without Repeating MCP Setup

This folder is already prepared for Codex + Unreal MCP.

Open Codex from:

```text
C:\WORK\RAINBOWGATE
```

Open Unreal with:

```powershell
& "C:\Program Files\Epic Games\UE_5.8\Engine\Binaries\Win64\UnrealEditor.exe" "C:\WORK\RAINBOWGATE\LUCID.uproject" -ModelContextProtocolStartServer -ModelContextProtocolPort=8010
```

Codex should use:

```text
http://127.0.0.1:8010/mcp
```

The project-scoped config already exists at:

```text
C:\WORK\RAINBOWGATE\.codex\config.toml
```

## What Was Set Up

- `LUCID.uproject` enables `ModelContextProtocol`.
- `LUCID.uproject` enables `AllToolsets`.
- LUCID uses dedicated MCP port `8010`.
- User-level Codex config was left unchanged.
- Disposable test-project port `8000` remains separate.

## First Check Every Session

1. Check git status.
2. Confirm Unreal is open on LUCID.
3. Confirm port `8010` responds.
4. Confirm MCP can list toolsets.
5. Only then write assets or make Blueprint/editor changes.

## Do Not Repeat Unless Broken

- Do not re-enable plugins if already enabled.
- Do not recreate `.codex/config.toml` unless missing or wrong.
- Do not change port `8010` unless there is a real conflict.
- Do not edit `C:\Users\Point\.codex\config.toml` for this project.

## Validation Asset

The isolated smoke-test asset is:

```text
/Game/AI_MCP_Smoke/BP_LUCID_MCP_Test
```

It exists only to prove MCP can create, compile, and save a Blueprint in LUCID. Do not treat it as gameplay content.

## Persistent Safety Notes

- Do not touch existing LUCID maps, characters, gameplay Blueprints, or levels unless explicitly requested.
- Do not migrate portal assets from `UEAI_MCP_Test` unless explicitly requested.
- Do not stage unrelated external actors.
- Keep the workflow free.
- Never expose API keys.
- If something is missing, ask in Thai: "ต้องการข้อมูลอะไรเพิ่มเติมไหม หรือมีบริบทส่วนไหนที่ยังขาดอยู่?"
