#!/bin/sh
# Adapted from https://github.com/shrhdk/bl652-breakout-board/blob/master/build-gerber.sh

# Make ZIP archive for Elecrow from gerber made by KiCad.

# rename gerber files for
perl-rename -f 's/^(.*)-F.Cu.gtl$/$1.gtl/' gerbers/*.gtl
perl-rename -f 's/^(.*)-B.Cu.gbl$/$1.gbl/' gerbers/*.gbl
perl-rename -f 's/^(.*)-F.SilkS.gto$/$1.gto/' gerbers/*.gto
perl-rename -f 's/^(.*)-B.SilkS.gbo$/$1.gbo/' gerbers/*.gbo
perl-rename -f 's/^(.*)-F.Mask.gts$/$1.gts/' gerbers/*.gts
perl-rename -f 's/^(.*)-B.Mask.gbs$/$1.gbs/' gerbers/*.gbs
perl-rename -f 's/^(.*)-Edge.Cuts.gm1$/$1.gml/' gerbers/*.gm1
perl-rename -f 's/^(.*).drl$/$1.txt/' gerbers/*.drl

rm rc2014-ym2149-gerbers.zip

zip -j rc2014-ym2149-gerbers.zip gerbers/*
