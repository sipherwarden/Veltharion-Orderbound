# Optional Online Ladder Stub

## Run
```bash
pip install fastapi uvicorn
uvicorn app:app --reload
```

## Endpoints
- `POST /match` with bearer token `dev-orderbound-token`
- `GET /leaderboard`

Offline mode is still the default in game config.
