# Ollama + Open WebUI

[Ollama](https://ollama.com/) local LLM hosting with [Open WebUI](https://github.com/open-webui/open-webui) chat interface. GPU-accelerated.

## Quick start

```sh
docker compose up -d
```

## Access

- **Chat UI**: `https://chat.abojaber.com` via Traefik (HTTPS, Let's Encrypt)
- **Ollama API**: `https://ollama.abojaber.com` (also `http://<tailscale-ip>:11434`)
- Direct (internal): Open WebUI at `http://<tailscale-ip>:3001`

## Services

| Service | Purpose | Port |
|---|---|---|
| `ollama` | LLM runtime | 11434 |
| `open-webui` | Chat web UI | 3001 → 8080 |

## Configuration

| Setting | Value |
|---|---|
| Ollama models | `.data/` (gitignored) |
| Open WebUI data | named volume `open-webui` |
| OLLAMA_BASE_URL | `http://ollama:11434` |
| GPU | NVIDIA, all devices |

## Ollama tips

```sh
ollama ls          # list models
ollama pull <model>
ollama rm <model>
```

## Notes

- GPU passthrough requires the NVIDIA Container Toolkit. Without it, containers start but inference silently fails.
- Open WebUI first-run admin is set via the registration page on `https://chat.abojaber.com`.
- Default Open WebUI admin credentials are not preconfigured — set at first login.
