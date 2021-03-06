# Data Freshness in Mixed-Memory Intermittently-Powered Systems

This is the official public repository for the paper [_Data Freshness in Mixed-Memory Intermittently-Powered Systems_](https://arxiv.org/abs/2102.01572) by [James Scott Broadhead](https://jamesbroadhead.com/) and [Przemysław Pawełczak](https://pawelczak.net/). The paper was accepted to [IEEE ISIT 2021](https://2021.ieee-isit.org/) conference. 

## Paper Abstract

Age  of  Information  (AoI)  is  a  key  metric  to  understand  data  freshness  in  Internet  of  Things  (IoT)  devices.  In this  paper  we  analyse  an  intermittently-powered  IoT  sensor with  mixed-memory  (volatile  and  non-volatile)  architecture—that  uses  a  Time-Dependent  Checkpointing  (TDC)  scheme.  We derive the average Peak Age of Information (PAoI) and average AoI  of  the  system,  and  use  these  metrics  to  understand  which device  parameters  most  significantly  influence  performance.  We go  on  to  consider  how  the  average  PAoI  of  a  mixed-memory system  compares  with  entirely  volatile  or  entirely  non-volatile architecture,  and  also  introduce  an  alternative  TDC  strategy to   improve   system   resilience   in   unpredictable   environmental conditions.

## IEEE ISIT 2021 Presentation

The [IEEE ISIT 2021](https://2021.ieee-isit.org/) conference presentation is available [here](Data_freshness_in_mixed_memory_intermittently_powered_systems_James_Broadhead_Slides_28_05_21.pdf) while the recorder videos of the presentation can be found via the following links: [IEEE ISIT 2021 highlights video](https://www.youtube.com/watch?v=rk0C7sjEizo) and [IEEE ISIT 2021 full video](https://www.youtube.com/watch?v=zaflemi3dKQ).

## Code Description

The following code is used in generating numerical results and verifies result of this [paper](#How-to-Cite-This-Work) to which this repository refers to. Specifically:

* [`harvested_energy.m`](Matlab_Scripts_Data_Freshness_IPD/harvested_energy.m): generates Figure 3a (E[h] against Aoi for Scenario RF1 and RF2);
* [`memory_structure.m`](Matlab_Scripts_Data_Freshness_IPD/memory_structure.m): generates Figure 3b (E[f] against Aoi for various memory structures);
* [`checkpointing_strategy.m`](Matlab_Scripts_Data_Freshness_IPD/checkpointing_strategy.m): generates Figure 3c (E[f] against Aoi for single and dual frequency checkpointing);
* [`differentiation.m`](Matlab_Scripts_Data_Freshness_IPD/differentiation.m): solves the differentiation of equation (14) with respect to E[h];
* [`differentiation_average_Aoi_additional.m`](Matlab_Scripts_Data_Freshness_IPD/differentiation_average_Aoi_additional.m): solves the differentiation of equation (19) with respect to E[h].

## How to Cite This Work

The results of this project have been submitted for publication in Feburary 2021 and are available to view on [arXiv](https://arxiv.org/abs/2102.01572).

Authors: [James Scott Broadhead](https://jamesbroadhead.com/) and [Przemysław Pawełczak](https://pawelczak.net/)

Publication title: _Data Freshness in Mixed-Memory Intermittently-Powered Systems_

To cite this publication please use the following BiBTeX entry.

```
@misc{broadhead:intermittent-aoi:2021,
  title = {Data Freshness in Mixed-Memory Intermittently-Powered Systems},
  author = {James Scott {Broadhead} and Przemys\l{}aw {Pawe\l{}czak}},
  year = {2021},
  month = feb,
  eprint = {2102.01572},
  archivePrefix = {arXiv},
  primaryClass = {cs.IT}
}
```

## Acknowledgments

We gratefully acknowledge the partial financial support of project [ENLIGHT'EM](https://enlightem.eu/) (European Training Network in Low-Energy Visible Light IoT Systems, H2020-MSCA-ITN-2018, grant number 814215).

## Copyright

Copyright (C) 2021 TU Delft Embedded and Networked Systems Group/Sustainable Systems Laboratory.

MIT Licence or otherwise specified. See [licence](https://github.com/TUDSSL/intermittency-aoi/blob/main/LICENSE) file for details.
