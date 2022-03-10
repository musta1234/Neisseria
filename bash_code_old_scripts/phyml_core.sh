#!/bin/sh

phyml -i ST11v4_core200.phy -b 200 -m GTR -f m -v e -a e --print_site_lnl &

phyml -i ST11v4_core.phy -b 200 -m GTR -f m -v e -a e --print_site_lnl &
