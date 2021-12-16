# -*- coding: utf-8 -*-
"""
Created on Mon Dec 13 15:53:55 2021

@author: yao
"""
#%%
from ts2vg import NaturalVG
from ts2vg import HorizontalVG 
# import networkx as nx
import numpy as np
import matplotlib.pyplot as plt
import os
import pandas as pd
import networkx as nx
# import graph_tool as gt

import matplotlib.pyplot as plt
g = os.walk('/Users/luyaoxu/Desktop/PROJECT3')

total = []
total_info = []
for dirnum, (subdir, dirs, files) in enumerate(g):
    for file in files:
        subject = None
        name=""
        if len(subdir.split("\\")) > 5:   
            subject = subdir.split("\\")[5]
            
            if file.endswith("_chest.csv"):
                name+=subject+"_"+file.split("_")[1]+".png"
                print(name)
               
                data = pd.read_csv(subdir+"/"+file)
            
                # fig = plt.figure(figsize=(12,12))
                # ax = plt.subplot(111)
                # print("NaturalVG begin")
                attr_x_g = NaturalVG(directed=None).build(data['attr_x'].values[1000:2024])
                # print("NaturalVG end")
                attr_y_g = NaturalVG(directed=None).build(data['attr_y'].values[1000:2024])
                attr_z_g = NaturalVG(directed=None).build(data['attr_z'].values[1000:2024])
              
               
                # print("as_networkx begin")
                attr_x_nxg = attr_x_g.as_networkx()
                # print("as_networkx end")
                attr_y_nxg = attr_y_g.as_networkx()
                attr_z_nxg = attr_z_g.as_networkx()
                temp = []
                temp_info = []
                temp.extend([subject,file,"NVG",attr_x_g,attr_y_g,attr_z_g])
                # print("draw begin")
                
                
                average_degree_x = sum(dict(attr_x_nxg.degree()).values() )/float(len(attr_x_nxg))
                network_diameter_x = nx.diameter(attr_x_nxg)
                average_path_length_x = nx.average_shortest_path_length(attr_x_nxg)
                
                average_degree_y = sum(dict(attr_y_nxg.degree()).values() )/float(len(attr_y_nxg))
                network_diameter_y = nx.diameter(attr_y_nxg)
                average_path_length_y = nx.average_shortest_path_length(attr_x_nxg)
                
                average_degree_z = sum(dict(attr_z_nxg.degree()).values() )/float(len(attr_z_nxg))
                network_diameter_z = nx.diameter(attr_z_nxg)
                average_path_length_z = nx.average_shortest_path_length(attr_z_nxg)
                
                total_info.append(["NVG",subject,"x",average_degree_x,network_diameter_x,average_path_length_x,file.split("_")[1]])
                total_info.append(["NVG",subject,"y",average_degree_y,network_diameter_y,average_path_length_y,file.split("_")[1]])
                total_info.append(["NVG",subject,"z",average_degree_z,network_diameter_z,average_path_length_z,file.split("_")[1]])
                
                
            
           
                # plt.show()
                nx.draw(attr_x_nxg,node_size=1)
                plt.savefig("NVG_x_"+name, format="PNG")
                
                nx.draw(attr_y_nxg,node_size=1)
                plt.savefig("NVG_y_"+name, format="PNG")
                
                nx.draw(attr_z_nxg,node_size=1)
                plt.savefig("NVG_z_"+name, format="PNG")
                
          
                
                print(total_info[:-1])
                
                attr_x_g = HorizontalVG(directed=None).build(data['attr_x'].values[1000:2024])
                attr_y_g = HorizontalVG(directed=None).build(data['attr_y'].values[1000:2024])
                attr_z_g = HorizontalVG(directed=None).build(data['attr_z'].values[1000:2024])
                temp_info = []
                average_degree_x = sum(dict(attr_x_nxg.degree()).values() )/float(len(attr_x_nxg))
                network_diameter_x = nx.diameter(attr_x_nxg)
                average_path_length_x = nx.average_shortest_path_length(attr_x_nxg)
                
                average_degree_y = sum(dict(attr_y_nxg.degree()).values() )/float(len(attr_y_nxg))
                network_diameter_y = nx.diameter(attr_y_nxg)
                average_path_length_y = nx.average_shortest_path_length(attr_x_nxg)
                
                average_degree_z = sum(dict(attr_z_nxg.degree()).values() )/float(len(attr_z_nxg))
                network_diameter_z = nx.diameter(attr_z_nxg)
                average_path_length_z = nx.average_shortest_path_length(attr_z_nxg)
                
                
                nx.draw(attr_x_nxg,node_size=1)
                plt.savefig("HVG_x_"+name, format="PNG")
                
                nx.draw(attr_y_nxg,node_size=1)
                plt.savefig("HVG_y_"+name, format="PNG")
                
                nx.draw(attr_z_nxg,node_size=1)
                plt.savefig("HVG_z_"+name, format="PNG")
                
                temp_info.append(["HVG",subject,"x",average_degree_x,network_diameter_x,average_path_length_x,file.split("_")[1]])
                temp_info.append(["HVG",subject,"y",average_degree_y,network_diameter_y,average_path_length_y,file.split("_")[1]])
                temp_info.append(["HVG",subject,"z",average_degree_z,network_diameter_z,average_path_length_z,file.split("_")[1]])
                # nx.draw(attr_x_nxg,node_size=1)
             
                
                print(total_info[:-1])
   
#%%
import matplotlib.pyplot as plt
import numpy as np
data = pd.DataFrame(total_info,columns=["Method","Subject","AcceleroMeterAxis","AverageDegree","NetworkDiameter","AveragePathLength","Activity"])
data.to_csv("total_info.csv",index=True)
#%%
colors = np.random.rand(2)
# area = (30 * np.random.rand(data.shape[1]))**2  # 0 to 15 point radii
# plt.scatter(data["AverageDegree"], data["NetworkDiameter"], alpha=0.5)

groups = data.groupby("Activity")
for name, group in groups:
    if name == "walking" or name == "running":
        plt.plot(group["AverageDegree"], group["NetworkDiameter"], marker="o", linestyle="", label=name)
plt.show()
#%%

for name, group in groups:
    if name == "climbingup" or name == "climbingdown":
        plt.plot(group["AverageDegree"], group["NetworkDiameter"], marker="o", linestyle="", label=name)
plt.show()





    
    
    
    
    
    
    
    