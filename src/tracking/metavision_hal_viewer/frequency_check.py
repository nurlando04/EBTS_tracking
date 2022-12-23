import pandas as pd
from pandas.core import groupby
from pandas.core.algorithms import unique;
from matplotlib import pyplot as plt
table=pd.read_csv("/home/nurlando/metavision2.1/sdk/driver/samples/metavision_raw_to_csv/build/cd.csv")

x,y,e,t=table.columns

freqs=table.groupby([x,y]).size().sort_values()
print(type(freqs))
print(table.loc[(table[x]==304) & (table[y]==230)][t])

# plt.plot(table.loc[(table[table.columns[0]]==330) & (table[table.columns[1]]==220)][table.columns[3]],table.loc[(table[table.columns[0]]==330) & (table[table.columns[1]]==220)][table.columns[2]])
# plt.show()

print(table.loc[(table[x]==330) & (table[y]==220)].groupby(e).size())
# print(table.loc[(table['327']==304) & (table['214']==230)]['0'])

#print(freqs.index)


#print(freqs.loc[323,232])
freqs =freqs[(freqs>70000) & (freqs<100000)]
freqs
for xtemp,ytemp in freqs.index:
    print(xtemp,ytemp)
    plt.plot(table.loc[(table[x]==xtemp) & (table[y]==ytemp)][t],table.loc[(table[x]==xtemp) & (table[y]==ytemp)][e])
    plt.show()

print(freqs)


print(table[x].min())
print(table[x].max())
print(table[y].min())
print(table[y].max())


print(table.columns)