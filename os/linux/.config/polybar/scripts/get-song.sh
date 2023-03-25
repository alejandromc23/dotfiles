#!/bin/bash

if ! playerctl --player=spotify metadata &> /dev/null
then
    echo "Hearing nothing"
    return 1
fi

echo "$(playerctl --player=spotify metadata title) - $(playerctl --player=spotify metadata artist)"
