#!/bin/bash
# Author: thorgeir sigurdsson <thorgeirsigurd@gmail.com>
# Example: bash tgrid.sh 4
#
# Split tmux window into x given panes.
#  --- --- 
# |   |   |
#  --- --- 
# |   |   |
#  --- --- 

num_panes=${1}; shift

function create_grid_pane () {
    local num_panes=${1}; shift

    #tmux new-window

    for i in $(seq 2 ${num_panes}); do
        tmux split-window -h
        tmux select-layout even-horizontal
    done

    tmux select-layout tiled # Move panes into equalized grid system.
}

create_grid_pane ${num_panes}
