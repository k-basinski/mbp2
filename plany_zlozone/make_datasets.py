# %%
import numpy as np
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
# %%
# config
means = [10, 20, 10, 20]
N = 30
make_plots = True
reroll_distributions = False # roll new values for each level
f1_name = 'ciastko'
f2_name = 'szoki'
dv_name = 'wynik'

labels_factor1 = ['tak', 'nie']
labels_factor2 = ['tak', 'nie']

fname = 'dane9.csv'
plot_name = '../klasowki/plots/plot_k24_2.png'

# work

if reroll_distributions:
    res = [np.random.normal(m, 1, N) for m in means]
else:
    distr = np.random.normal(0, 1, N)
    res = [distr + m for m in means]

dv = np.concatenate(res)

f1 = np.repeat(labels_factor1, 2*N)
f2 = np.tile(np.repeat(labels_factor2, N), 2)

df = pd.DataFrame({
    f1_name: f1,
    f2_name: f2,
    dv_name: dv
})

if make_plots:
    sns.boxplot(x=f1_name, y=dv_name, hue=f2_name, 
        color='black', data=df)
    plt.savefig(plot_name, dpi=200)
else:
    df.to_csv(fname)

# %%

