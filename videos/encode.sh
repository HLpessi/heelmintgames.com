#!/bin/bash
# Encode portfolio masters -> videos/web/*.mp4 (h264/aac, faststart, web-friendly size)
set -e
cd "$(dirname "$0")"
mkdir -p web

encode() {
    src="$1"; out="$2"
    ffmpeg -y -v error -i "$src" \
        -map 0:v:0 -map 0:a? \
        -c:v libx264 -crf 23 -preset medium -maxrate 6M -bufsize 12M \
        -pix_fmt yuv420p \
        -c:a aac -b:a 128k \
        -movflags +faststart \
        "web/$out"
    echo "done: $out ($(du -h "web/$out" | cut -f1))"
}

encode "hypehype app preview 1.mp4"                                  "hypehype-app-preview-1.mp4"
encode "hypehype app preview 2.mp4"                                  "hypehype-app-preview-2.mp4"
encode "App Preview Create Remix English 1080 x 1920 5.5 Inch.mp4"   "hypehype-create-remix.mp4"
encode "Badland party trailer.mp4"                                   "badland-party-trailer.mp4"
encode "UA Play Ad.mp4"                                              "ua-play-ad.mp4"
encode "fake ads into real games.mp4"                                "fake-ads-into-real-games.mp4"
encode "creating agame 1 minute vs 20 minutes.mp4"                   "creating-game-1min-vs-20min.mp4"
encode "UGC video hypehype.MP4"                                      "ugc-video-hypehype.mp4"
encode "whats hypehype video.mp4"                                    "whats-hypehype.mp4"
encode "3 reasons why hypehype.mp4"                                  "3-reasons-why-hypehype.mp4"
encode "ALTEGRO eplainer UA.mp4"                                     "altegro-explainer-ua.mp4"
encode "ALTEGRO try on UA.mp4"                                       "altegro-try-on-ua.mp4"
encode "Battle legion logo animation.mp4"                            "battle-legion-logo-animation.mp4"
encode "hypehype FTUE video.mp4"                                     "hypehype-ftue.mp4"
encode "live stream stinger.mp4"                                     "live-stream-stinger.mp4"
encode "screen idle loop.mp4"                                        "screen-idle-loop.mp4"
encode "UE cinematics 1.mp4"                                         "ue-cinematics-1.mp4"
encode "UE cinematics 2.mp4"                                         "ue-cinematics-2.mp4"

echo "ALL DONE"; du -sh web
