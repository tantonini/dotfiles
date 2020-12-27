#!/bin/bash

# 1: laptop only
# 2: hdmi only
# 3: mobile + hdmi left
# 4: mobile + hdmi right

if xrandr | grep 2560x1440; then
    resolution=2560x1440
    offset=2560
else
    resolution=1920x1080
    offset=1920
fi

case $1 in
    1)
        nvidia-settings --assign "CurrentMetaMode=DPY-5: nvidia-auto-select @1920x1080 +0+0 {ViewPortIn=1920x1080, ViewPortOut=1920x1080+0+0, ForceCompositionPipeline=On, ForceFullCompositionPipeline=On}" \
            --assign "XineramaInfoOrder=DFP-5"
        ;;
    2)
        nvidia-settings --assign "CurrentMetaMode=DPY-4: nvidia-auto-select @${resolution} +0+0 {ViewPortIn=${resolution}, ViewPortOut=${viewport}+0+0, ForceCompositionPipeline=On, ForceFullCompositionPipeline=On}" \
            --assign "XineramaInfoOrder=DFP-4"
        ;;
    3)
        nvidia-settings --assign "CurrentMetaMode=DPY-5: nvidia-auto-select @1920x1080 +${offset}+0 {ViewPortIn=1920x1080, ViewPortOut=1920x1080+0+0, ForceCompositionPipeline=On, ForceFullCompositionPipeline=On}, DPY-4: nvidia-auto-select @${resolution} +0+0 {ViewPortIn=${resolution}, ViewPortOut=${resolution}+0+0, ForceCompositionPipeline=On, ForceFullCompositionPipeline=On}" \
            --assign "XineramaInfoOrder=DFP-4"
        ;;
    4)
        nvidia-settings --assign "CurrentMetaMode=DPY-5: nvidia-auto-select @1920x1080 +0+0 {ViewPortIn=1920x1080, ViewPortOut=1920x1080+0+0, ForceCompositionPipeline=On, ForceFullCompositionPipeline=On}, DPY-4: nvidia-auto-select @${resolution} +1920+0 {ViewPortIn=${resolution}, ViewPortOut=${resolution}+0+0, ForceCompositionPipeline=On, ForceFullCompositionPipeline=On}" \
            --assign "XineramaInfoOrder=DFP-4"
        ;;
esac
i3-msg restart
