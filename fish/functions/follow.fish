function follow --description 'Follow files to their destination folder after performing cp, mv, etc.'
    set prevLine (history | head -n 1)
    set targetDir (eval "set -l args $prevLine; echo \$args[-1]")
    test ! -d "$targetDir" && set targetDir (dirname "$targetDir")
    cd $targetDir
end
