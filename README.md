# zenity-docker-nu
You can define your docker processid and it will get the netmask for the same so that you can connect to those instances easily. I coded this for the slurm and pbs cluster previosuly so that i dont have to remember the host ids.  This time implemented the nu shell programming for a table approach. see the images. 

![process_add](https://github.com/sablokgaurav/zenity_docker_app/blob/main/docker_ip_address.png)
![docker_conf](https://github.com/sablokgaurav/zenity_docker_app/blob/main/docker_configuration_address.png)
![docker_detail](https://github.com/sablokgaurav/zenity_docker_app/blob/main/docker_detail.png)

```
#!/usr/bin/env bash
# -*- coding:  utf-8 -*-
# Author: Gaurav Sablok
# date: 2023-10-18
# MIT License
docker_address=$(zenity --forms --width=300 --height=100 \
                                                --title "docker subnet address search" \
                                                                --add-entry="docker_address")
if [[ $docker_address = "" ]] 
then
        nu config.getter.nu
        nu config.table.nu
        nu config.getter.nu >> single_node_cluster.txt
else 
   docker_cluster=$docker_address
   echo "do {ifconfig | grep "inet" | awk  '{print $1"\t"$2 }'} | save -f config.txt | 
              open config.txt | split row "\t" | find "127.0.0.1" do {ifconfig | grep "inet" | awk  
                      '{print $1"\t"$2 }'} | save -f config.txt | open config.txt | 
                                      split row "\t"" >> ${docker_cluster}.config.setter.nu
  nu ${docker_cluster}.config.setter.nu
  nu ${docker_cluster}.table.nu
  nu ${docker_cluster}.config.setter.nu >> "${docker_cluster}".config.txt
fi
# configuration for config.getter.nu
nu_getter -> do {ifconfig | grep "inet" | awk  '{print $1"\t"$2 }'} | \
            save -f config.txt | open config.txt | split row "\t" | \
                                find "127.0.0.1" do {ifconfig | grep "inet" | \
                                      awk  '{print $1"\t"$2 }'} | save -f config.txt | \
                                                          open config.txt | split row "\t"
```
Gaurav \
Academic Staff Member \
Bioinformatics \
Institute for Biochemistry and Biology \
University of Potsdam \
Potsdam,Germany 

