# AGENTS.md - RAINBOWGATE / LUCID

## Project Identity

- Project folder: `C:\WORK\RAINBOWGATE`
- Unreal project: `C:\WORK\RAINBOWGATE\LUCID.uproject`
- Target Unreal version: UE 5.8
- Primary automation bridge: Epic official experimental `ModelContextProtocol` with `AllToolsets`

## Required MCP Setup

This project is already configured for Codex project-scoped Unreal MCP.

- Codex config: `C:\WORK\RAINBOWGATE\.codex\config.toml`
- MCP server label: `unreal`
- MCP endpoint: `http://127.0.0.1:8010/mcp`
- Keep port `8010` for LUCID.
- Keep port `8000` available for the disposable `UEAI_MCP_Test` project.
- Do not edit `C:\Users\Point\.codex\config.toml` for this project unless the user explicitly asks.

Launch LUCID with MCP enabled:

```powershell
& "C:\Program Files\Epic Games\UE_5.8\Engine\Binaries\Win64\UnrealEditor.exe" "C:\WORK\RAINBOWGATE\LUCID.uproject" -ModelContextProtocolStartServer -ModelContextProtocolPort=8010
```

Before doing Unreal work, verify the connection:

```powershell
Test-NetConnection 127.0.0.1 -Port 8010
```

Then verify MCP `initialize`, `tools/list`, and `list_toolsets` before writing assets.
Expected toolsets include:

- `editor_toolset.toolsets.blueprint.BlueprintTools`
- `editor_toolset.toolsets.scene.SceneTools`
- `editor_toolset.toolsets.object.ObjectTools`
- `editor_toolset.toolsets.asset.AssetTools`

## Safety Rules

- Inspect current git status before editing.
- Do not touch unrelated user changes.
- Do not migrate assets from `C:\WORK\UEAI\UEAI_MCP_Test` into LUCID unless the user explicitly asks.
- Do not edit existing maps, characters, gameplay Blueprints, or production assets for setup validation.
- For validation writes, use isolated folders such as `/Game/AI_MCP_Smoke` first.
- Do not stage unrelated `Content/__ExternalActors__` files unless they are explicitly part of the requested change.
- Keep all changes free: no billing, paid plugins, subscriptions, or paid API fallback.
- Never print, store, screenshot, or commit API keys.
- If context or required info is missing, ask in Thai: "ต้องการข้อมูลอะไรเพิ่มเติมไหม หรือมีบริบทส่วนไหนที่ยังขาดอยู่?"

## Current Validation Record

Validated on 2026-10-05:

- `LUCID.uproject` enables `ModelContextProtocol` and `AllToolsets`.
- LUCID launches with Unreal MCP on `http://127.0.0.1:8010/mcp`.
- MCP `initialize`, `tools/list`, and `list_toolsets` passed.
- Required editor toolsets were visible.
- Smoke Blueprint was created and saved at `/Game/AI_MCP_Smoke/BP_LUCID_MCP_Test`.
- Smoke Blueprint variable `MCP_Smoke_Message` was added, compiled, and saved.
- Log check found no `Blueprint Runtime Error`, `Accessed None`, Blueprint/script errors, or MCP errors for the validation pattern.

## Git Rules

- Commit only intended project files for each task.
- For MCP setup changes, expected files are usually:
  - `LUCID.uproject`
  - `.codex/config.toml`
  - isolated smoke assets under `Content/AI_MCP_Smoke/`
- Do not include generated or unrelated project content by accident.
