#AUTOR: Sandro Valenzuela

# Find order param for the aa of Protein.
proc orderparam-protein {seltext} {

  set file [open s2.dat w]
  set n [molinfo top get numframes]

  set fresid [lindex [lsort -integer -decreasing [[atomselect top "($seltext) and name CA"] get resid]] 0]
  set iresid [expr $fresid - $fresid +1]

  for { set i $iresid } { $i <= $fresid } { incr i } {
	puts "working on resid $i/$fresid"

	    set cp [atomselect top "($seltext) and resid $i and name N"]
	    set hx [atomselect top "($seltext) and resid $i and name H"]
	    if { [$hx num] == 0 } {
	      puts "skipping $i"
	      continue
	    }

	set suma 0.0
	for { set framea 0 } { $framea < $n } { incr framea } {

		    set sum 0.0
		    set vectorAnx 0
		    set vectorAny 0
		    set vectorAnz 0

		    for { set frame 0 } { $frame < $n } { incr frame } {
		      $cp frame $frame
		      $hx frame $frame
		      set cpx [$cp get x]
		      set cpy [$cp get y]
		      set cpz [$cp get z]
		 
		      set vectorNHx [vecsub $cpx [$hx get x]]
		      set vectorNHy [vecsub $cpy [$hx get y]]
		      set vectorNHz [vecsub $cpz [$hx get z]]
		
			set pp [expr $vectorNHx*$vectorAnx + $vectorNHy*$vectorAny + $vectorNHz*$vectorAnz]
			set sum [expr $sum + (3*$pp*$pp-1)/2]

			set vectorAnx $vectorNHx
		    	set vectorAny $vectorNHy
		    	set vectorAnz $vectorNHz
		    }
		set suma [expr $suma + $sum]

	}

	   set tofile [expr {($suma/($n*$n))}]
	    puts $file "$i $tofile"
	}
close $file
} 
