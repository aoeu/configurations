function job
    if test "$argv[1]" = ""
        fg %(jobs | fzf | cut -f1)
    end
    if string match -qr '^\d+$' $argv[1]
        fg %$argv[1]
    end
end
