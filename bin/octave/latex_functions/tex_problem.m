function [] = tex_problem(M)
  %Takes a matrix in. Prints latex for the matrix, rref matrix
  %and the system of equations the matrix represents.
  
  %I use these functions a bunch on linear algebra labs, so... time
  %saver.

  R = rref(M)

  printf("\n")
  tex_matrix(M)

  printf("\n")
  tex_matrix(R)

  printf("\n")
  make_tex_system(R)