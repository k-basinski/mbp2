# %%
import numpy as np
import pandas as pd


# %%
# config
means = [1, 7, 7, 1]
N = 30

f1_name = 'pobudzenie'
f2_name = 'walencja'
dv_name = 'wynik'

labels_factor1 = ['niski', 'wysoki']
labels_factor2 = ['pozytywny', 'negatywny']

fname = 'dane6.csv'

# work
res = [np.random.normal(m, 1, N) for m in means]
dv = np.concatenate(res)

f1 = np.repeat(labels_factor1, 2*N)
f2 = np.tile(np.repeat(labels_factor2, N), 2)

df = pd.DataFrame({
    f1_name: f1,
    f2_name: f2,
    dv_name: dv
})

df.to_csv(fname)
