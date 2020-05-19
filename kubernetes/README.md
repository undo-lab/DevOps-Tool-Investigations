## Helping Kubernetes Deployments
This is meant to help with deploying a barebones kubernetes cluster, based on [this tutorial](https://blog.sourcerer.io/a-kubernetes-quick-start-for-people-who-know-just-enough-about-docker-to-get-by-71c5933b4633#3664).
Simplified Instructions below


### Instructions
#### On Master Node
1. Uncomment the MASTER_IP line in the kubernetes_install_script, and set it to the IP address of the master node, and comment out the WORKER_IP line
2. Enter root mode with `sudo -s`
3. Run `source master_run.sh`
4. Check that the master is up and running with the command `kubectl get nodes`
5. The command in join_cluster.sh has been auto-generated, so commit and push the result so the workers can use it
#### On all worker Nodes
1. Pull the latest version from the repo(or just edit the join_cluster_cmd file appropriately)
2. Comment out the export MASTER_IP line in the kubernetes_install_script, and set it to the IP address of the worker node, and uncomment the WORKER_IP line
3. Enter root mode with `sudo -s`
4. Run the `source worker_run.sh`

At this point connect to the master machine again, and check that the worker was added with the command `kubectl get nodes`

### Things to note
* I got this to work the first time on a VM running Ubuntu Server 16.04, Linux 4.4, I tried using Debian at first but it couldn't find the kubernetes packages
* In order for all of this to work on a cluster of all VM's(including master), they need to be on the same NAT network(configured in virtualbox settings). Necessary IP is the one from the 'enp' interface
* The kubernetes_install_script requires you to comment/uncomment the IP lines depending on whether it is a node or master, and the command join_cluster is unique per cluster. Im just gonna update it whenever I deploy something new
* If any of these didn't work then idk but im not too concerned about it considering that i'm most likely the only person thats ever gonna use this ever
* Also if its not obvious, this is heavily relient on apt, so any distro that doesnt have apt cant use it
