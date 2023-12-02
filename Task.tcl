set fileName "data.txt"
set fileHandle [open $fileName r]
set sum 0
set count 0

if {$fileHandle eq ""} {
    puts "Error: Couldn't open the file $fileName for reading"
} else {
    while {[gets $fileHandle line] != -1} {
        if {[string is integer $line]} {
            if {[expr {$line % 2 == 0}]} {
                puts "multiplyByTwo: [expr {$line * 2}]"
                set sum [expr {$sum + $line * 2}]
            } else {
                puts "multiplyByThree: [expr {$line * 3}]"
                set sum [expr {$sum + $line * 3}]
            }
        } elseif {[string is double $line]} {
            puts "Float: $line"
        } elseif {[string is word $line]} {
            puts "String: $line"
            incr count
        } else {
            puts "INVALID"
        }
    }
    puts "Sum Integers : $sum"
    puts "Count Strings : $count"
    close $fileHandle
}
