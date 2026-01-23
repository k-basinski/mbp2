# %%
import numpy as np
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
# %%
means = [30, 20, 20, 20]

def make_plot(means, fname):

    # config
    plot_name = f'../klasowki/plots/{fname}'
    N = 30
    make_plots = True
    reroll_distributions = False # roll new values for each level
    f1_name = 'ciastko'
    f2_name = 'szoki'
    dv_name = 'wynik'

    labels_factor1 = ['tak', 'nie']
    labels_factor2 = ['tak', 'nie']

    output_file = 'dane9.csv'

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
            palette={'tak': 'black', 'nie': 'white'}, data=df)
        plt.savefig(plot_name, dpi=200)
        plt.close()
    else:
        df.to_csv(output_file)

# %%
make_plot([10, 20, 20, 30], 'plot_k2_25_1.png')
make_plot([20, 30, 20, 30], 'plot_k2_25_2.png')
make_plot([10, 30, 20, 10], 'plot_k2_25_3.png')
make_plot([10, 20, 20, 30], 'plot_k2_25_4.png')

make_plot([10, 20, 10, 20], 'plot_k2_25_5.png')
make_plot([40, 20, 40, 30], 'plot_k2_25_6.png')
make_plot([10, 20, 30, 30], 'plot_k2_25_7.png')
make_plot([10, 20, 20, 20], 'plot_k2_25_8.png')
# %%
