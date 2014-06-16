function [] = tex_matrix(M)
  %Print out latex for the given matrix

  printf("\\[\n")
  if columns(M) >= 10
    printf("\\setcounter{MaxMatrixCols}{%d}\n", columns(M) + 1)
  end
  printf("\\begin{bmatrix}\n")
  for k = 1:rows(M)
    printf("%g", M(k, 1))
    for j = 2:columns(M)
      printf(" & %3g", M(k, j))
    end
    printf("\\\\\n")
  end
  printf("\\end{bmatrix}\n")
  printf("\\]\n")
end
