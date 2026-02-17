from pathlib import Path
import sqlite3


def test_unity_port_files_exist() -> None:
    root = Path(__file__).resolve().parents[1]
    required = [
        root / "VeltharionOrderboundUnity/Assets/Scripts/Core/SaveSystem.cs",
        root / "VeltharionOrderboundUnity/Assets/Scripts/Systems/PlayerController.cs",
        root / "VeltharionOrderboundUnity/Assets/Scripts/Systems/RankedSystem.cs",
        root / "VeltharionOrderboundUnity/Docs/README.md",
    ]
    missing = [str(path) for path in required if not path.exists()]
    assert not missing, f"Missing required Unity port files: {missing}"


def test_server_schema_sql_executes() -> None:
    root = Path(__file__).resolve().parents[1]
    schema_path = root / "VeltharionOrderbound/server/schema.sql"
    assert schema_path.exists(), "Expected server schema file to exist"

    schema = schema_path.read_text(encoding="utf-8")
    conn = sqlite3.connect(":memory:")
    try:
        conn.executescript(schema)
        tables = conn.execute(
            "SELECT name FROM sqlite_master WHERE type='table' AND name='matches'"
        ).fetchall()
        assert tables == [("matches",)]
    finally:
        conn.close()
