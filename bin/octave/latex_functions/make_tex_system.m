function [] = make_tex_system(M)
  %This function will take in an augmented matrix (there is no
  %practicle way for me to tell if it is actually augmented)
  %and will build a system of equations for use with latex.

  %Note that this does not acount for free variables. This may
  %be fixed in the future, but for now, it is acceptable.
  
  printf("\\begin{align*}\n")

  for k = 1:rows(M)
    for j = 1:(columns(M)-1)

      if M(k, j) != 0
	printf(" ")
	if M(k, j) != 1
	  printf("%g", M(k,j))
	end
	printf("x_%d ", j)
      end

    end

    printf(" =& %g\\\\\n", M(k, columns(M)))

  end

  printf("\\end{align*}\n")

end
