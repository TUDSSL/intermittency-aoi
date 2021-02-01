# Data Freshness in Mixed-Memory Intermittently-Powered Systems

This is the official public repository for the paper "Data Freshness in Mixed-Memory Intermittently-Powered Systems" by James Scott Broadhead and Przemysław Pawełczak.

# Paper Abstract
Age  of  Information  (AoI)  is  a  key  metric  to  understand  data  freshness  in  Internet  of  Things  (IoT)  devices.  In this  paper  we  analyse  an  intermittently-powered  IoT  sensor with  mixed-memory  (volatile  and  non-volatile)  architecture—that  uses  a  Time-Dependent  Checkpointing  (TDC)  scheme.  We derive the average Peak Age of Information (PAoI) and average AoI  of  the  system,  and  use  these  metrics  to  understand  which device  parameters  most  significantly  influence  performance.  We go  on  to  consider  how  the  average  PAoI  of  a  mixed-memory system  compares  with  entirely  volatile  or  entirely  non-volatile architecture,  and  also  introduce  an  alternative  TDC  strategy to   improve   system   resilience   in   unpredictable   environmental conditions.

# Code Description

* 'harvested_energy.m' generates Figure 3a (E[h] against Aoi for RF1 and RF2) 
* 'memory_structure.m' generates Figure 3b (E[f] against Aoi for various memory structures)
* 'checkpointing_strategy.m' generates Figure 3c (E[f] against Aoi for single and dual frequency checkpointing) 
* 'differentiation.m' solves the differentiation of equation (14) w.r.t E[h]
* 'differentiation_average_Aoi_additional.m' solves the differentiation of equation (19) w.r.t E[h]


# How to Cite This Work
The results of this project have been submitted for publication Feburary 2021. 

Authors: James Scott Broadhead and Przemysław Pawełczak

Publication title: Data Freshness in Mixed-Memory Intermittently-Powered Systems

# Acknowledgments
We gratefully acknowledge the partial financial support of project [ENLIGHT'EM](https://enlightem.eu/)
(European Training Network in Low-Energy Visible Light IoT Systems, H2020-MSCA-ITN-2018, grant number 814215)


# Copyright
Copyright (C) 2020 TU Delft Embedded and Networked Systems Group/Sustainable Systems Laboratory.

MIT Licence or otherwise specified. See [licence](https://github.com/TUDSSL/intermittency-aoi/blob/main/LICENSE) file for details



