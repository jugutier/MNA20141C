function ret = wind(t, v0, f0)
    ret = [ v0 * cos( 2*pi*f0*t ), v0 * sin( 2*pi*f0*t ) ];
endfunction