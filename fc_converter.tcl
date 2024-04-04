label .l1
label .l2
.l1 configure -text "Celcius" -font "Times 50"
.l2 configure -text "Fahrenheit" -font "Times 50"

variable e1_text
variable e2_text
entry .e1
entry .e2
.e1 configure -textvariable e1_text
.e2 configure -textvariable e2_text 

grid .l1 -row 0 -column 0 -sticky W
grid .e1 -row 0 -column 1 -sticky WE -padx 20 
grid .l2 -row 1 -column 0 -sticky W
grid .e2 -row 1 -column 1 -sticky WE -padx 20

proc handle_input {var x event} {
    variable e1_text
    variable e2_text
    
    if {[string compare $var e1_text] == 0 && [string compare [focus] .e1] == 0} {
	set celcius [.e1 get]
	if {[string is double $celcius] && [string compare $celcius ""] != 0} {
	    set fahrenheit [expr (9.0 / 5.0 * $celcius) + 32]
	    set e2_text [format "%.2f" $fahrenheit]
	} else {
	    set e2_text ""
	}
    } elseif {[string compare $var e2_text] == 0 && [string compare [focus] .e2] == 0} {
	set fahrenheit [.e2 get]
	if {[string is double $fahrenheit] && [string compare $fahrenheit ""] != 0} {
	    set celcius [expr (5.0 / 9.0) * ($fahrenheit - 32)]
	    set e1_text [format "%.2f" $celcius]
	} else {
	    set e1_text ""
	}
    }
}

trace add variable e1_text write handle_input
trace add variable e2_text write handle_input
