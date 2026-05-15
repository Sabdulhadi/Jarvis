#!/usr/bin/env bash
# JARVIS — voice layer skeleton
#
# Records → transcribes (Whisper) → pipes to Claude Code → speaks (ElevenLabs).
#
# This is a SKELETON. Fill in the marked sections before using.
# See SETUP.md section 3 for context.

set -euo pipefail

JARVIS_HOME="${JARVIS_HOME:-$HOME/jarvis}"
TMP_DIR="$JARVIS_HOME/scripts/.tmp"
mkdir -p "$TMP_DIR"

AUDIO_IN="$TMP_DIR/in_$(date +%s).wav"
TRANSCRIPT="$TMP_DIR/transcript_$(date +%s).txt"
RESPONSE="$TMP_DIR/response_$(date +%s).txt"
AUDIO_OUT="$TMP_DIR/out_$(date +%s).mp3"

# --- 1. Record ---------------------------------------------------------------
# macOS: use `sox` or `rec` (brew install sox)
# Linux: use `arecord` or `ffmpeg`
#
# Example (macOS, sox, 16kHz mono, stop on silence):
#   rec -r 16000 -c 1 "$AUDIO_IN" silence 1 0.1 3% 1 2.0 3%
#
# TODO: replace with your platform's recorder
echo "Recording... (stub — wire your recorder here)"
# rec -r 16000 -c 1 "$AUDIO_IN" silence 1 0.1 3% 1 2.0 3%

# --- 2. Transcribe (Whisper) -------------------------------------------------
# Option A — local whisper.cpp:
#   whisper -m ~/models/ggml-medium.en.bin -f "$AUDIO_IN" -otxt -of "${TRANSCRIPT%.txt}"
#
# Option B — OpenAI API:
#   curl -s -X POST https://api.openai.com/v1/audio/transcriptions \
#     -H "Authorization: Bearer $OPENAI_API_KEY" \
#     -F file=@"$AUDIO_IN" \
#     -F model=whisper-1 \
#     -F response_format=text > "$TRANSCRIPT"
#
# TODO: pick one and uncomment
echo "Transcribing... (stub)"
# echo "your transcribed text" > "$TRANSCRIPT"

# --- 3. Pipe to Claude Code --------------------------------------------------
# Requires the `claude` CLI installed and authenticated.
# `-p` prints the response and exits without entering interactive mode.
#
# claude -p "$(cat "$TRANSCRIPT")" > "$RESPONSE"
echo "Calling Claude... (stub)"
# claude -p "$(cat "$TRANSCRIPT")" > "$RESPONSE"

# --- 4. Speak (ElevenLabs) ---------------------------------------------------
# VOICE_ID: pick a calm, lower-register voice that fits the JARVIS persona.
#
# VOICE_ID="<your-voice-id>"
# curl -s -X POST "https://api.elevenlabs.io/v1/text-to-speech/$VOICE_ID" \
#   -H "xi-api-key: $ELEVENLABS_API_KEY" \
#   -H "Content-Type: application/json" \
#   -d "$(jq -Rn --arg t "$(cat "$RESPONSE")" '{text: $t, model_id: "eleven_turbo_v2_5"}')" \
#   --output "$AUDIO_OUT"
#
# Then play:
#   macOS:  afplay "$AUDIO_OUT"
#   Linux:  mpg123 "$AUDIO_OUT"   (or `paplay`/`ffplay`)
echo "Speaking... (stub)"

# --- 5. Cleanup --------------------------------------------------------------
# Comment this out while debugging.
# rm -f "$AUDIO_IN" "$TRANSCRIPT" "$RESPONSE" "$AUDIO_OUT"

echo "Done. Wire the TODOs in this script before relying on it."
