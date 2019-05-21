function fish_greeting -d "Greeting message on shell session start up"
    echo ""
    echo -en "        |         \n"
    echo -en "       / \        \n"
    echo -en "      / _ \       " (show_date) "\n"
    echo -en "     |.o '.|      " (show_tty) "\n"
    echo -en "     |'._.'|      " (show_uptime) "\n"
    echo -en "     |     |      \n"
    echo -en "   ,'|  |  |`.    \n"
    echo -en "  /  |  |  |  \   \n"
    echo -en "  |,-'--|--'-.|   \n"
    echo ""
    set_color normal
    fortune
end

function show_date -d "Prints information about date"
    set_color cyan
    echo -en (date)
    set_color normal
end

function show_tty -d "Print information about tty"
    echo -en "on "
    set_color cyan
    echo -en (basename (tty))
    set_color normal
end

function show_uptime -d "Prints information about uptime"
    set --local up_time (uptime | cut -d "," -f1 | cut -d "p" -f2 | sed 's/^ *//g')
    set --local time (echo $up_time | cut -d " " -f2)
    set --local formatted_uptime $time

    switch $time
    case "days" "day"
        set formatted_uptime "$up_time"
    case "min"
        set formatted_uptime $up_time"utes"
    case '*'
        set formatted_uptime "$formatted_uptime hours"
    end

    echo -en "up "
    set_color cyan
    echo -en "$formatted_uptime"
    set_color normal
end
