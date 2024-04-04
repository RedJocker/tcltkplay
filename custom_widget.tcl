proc my_entry_frame {w label_text} {
    frame $w

    variable $w.textvariable
    label $w.label -text $label_text
    entry $w.entry -textvariable $w.textvariable

    grid $w.label -in $w -row 0 -column 0
    grid $w.entry -in $w -row 0 -column 1
    return $w
}


my_entry_frame .my_entry {Hello There}

pack .my_entry

.my_entry.label config -font {Arial 50}
set .my_entry.textvariable {What is up?}
focus .my_entry.entry
