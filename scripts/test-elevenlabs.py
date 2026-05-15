#!/usr/bin/env python3
"""Quick sanity check for the ElevenLabs setup.

Reads the API key from $ELEVENLABS_API_KEY. Synthesises one short line,
plays it through the system audio (mpv or ffplay must be installed).

Usage:
    source .venv/bin/activate
    python scripts/test-elevenlabs.py
    python scripts/test-elevenlabs.py "custom line to speak"
"""

import os
import subprocess
import sys
from pathlib import Path

from elevenlabs.client import ElevenLabs

API_KEY = os.environ.get("ELEVENLABS_API_KEY")
if not API_KEY:
    sys.exit("ELEVENLABS_API_KEY not set. Add it to ~/.bashrc and `source` it.")

VOICE_ID = os.environ.get("JARVIS_VOICE_ID", "JBFqnCBsd6RMkjVDRZzb")

text = sys.argv[1] if len(sys.argv) > 1 else "The first move is what sets everything in motion."

client = ElevenLabs(api_key=API_KEY)

audio = client.text_to_speech.convert(
    text=text,
    voice_id=VOICE_ID,
    model_id="eleven_multilingual_v2",
    output_format="mp3_44100_128",
)

out = Path("/tmp/jarvis-test.mp3")
out.write_bytes(b"".join(audio))
print(f"Saved: {out}")

for player in (["mpv", "--really-quiet", str(out)],
               ["ffplay", "-nodisp", "-autoexit", "-loglevel", "quiet", str(out)],
               ["paplay", str(out)]):
    try:
        subprocess.run(player, check=True)
        break
    except FileNotFoundError:
        continue
else:
    print("No audio player found. Install one:  sudo apt install -y mpv")
    print(f"Or open the file manually from Windows:  \\\\wsl$\\Ubuntu{out}")
