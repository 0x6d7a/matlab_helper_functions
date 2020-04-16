import math
import numpy as np

p_arr = []
T_arr = []

N = 24;
Pfa = 1e-6

N_arr = np.arange(N, 0, -1)
k_arr = np.arange(1, N + 1)

for n in N_arr:
    p_arr.append(np.polynomial.Polynomial((n, 1)))

coefs = np.cumprod(p_arr)

for k in k_arr:
    c = coefs[k-1].coef
    r = c[::-1]
    r[-1] = r[-1] - math.factorial(N_arr[0]) / math.factorial(N_arr[0] - k) / Pfa
    T_arr.append(np.roots(r)[-1])

