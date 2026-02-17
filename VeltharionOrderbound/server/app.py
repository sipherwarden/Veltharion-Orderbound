from datetime import datetime
import sqlite3
from fastapi import FastAPI, Header, HTTPException
from pydantic import BaseModel

DB = "orderbound.db"
TOKEN = "dev-orderbound-token"
app = FastAPI(title="Veltharion Orderbound Ladder API")

class MatchIn(BaseModel):
    player_name: str
    won: bool
    old_elo: int
    new_elo: int
    signature: str


def conn():
    c = sqlite3.connect(DB)
    c.execute("""CREATE TABLE IF NOT EXISTS matches (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        player_name TEXT NOT NULL,
        won INTEGER NOT NULL,
        old_elo INTEGER NOT NULL,
        new_elo INTEGER NOT NULL,
        signature TEXT NOT NULL,
        created_at TEXT NOT NULL
    )""")
    return c


@app.post("/match")
def submit_match(payload: MatchIn, authorization: str = Header(default="")):
    if authorization.replace("Bearer ", "") != TOKEN:
        raise HTTPException(status_code=401, detail="Invalid token")
    with conn() as c:
        c.execute(
            "INSERT INTO matches(player_name, won, old_elo, new_elo, signature, created_at) VALUES (?, ?, ?, ?, ?, ?)",
            (payload.player_name, int(payload.won), payload.old_elo, payload.new_elo, payload.signature, datetime.utcnow().isoformat()),
        )
    return {"ok": True}


@app.get("/leaderboard")
def leaderboard(limit: int = 50):
    with conn() as c:
        rows = c.execute(
            "SELECT player_name, MAX(new_elo) AS elo, SUM(won) AS wins FROM matches GROUP BY player_name ORDER BY elo DESC LIMIT ?",
            (limit,),
        ).fetchall()
    return [{"name": r[0], "elo": r[1], "wins": r[2]} for r in rows]
