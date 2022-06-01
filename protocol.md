# NFT Masquerading 1 Host Router - 2 Client

## VMs
- Router
- Client1
- Client2

## Networks

### 10.10.10.0/24
Client1 is connected to this network (10.10.10.1)
Router is also connected (10.10.10.128)


### 10.10.20.0/24
Client2 is connected to this network (10.10.20.1)
Router is also connected (10.10.20.128)

### Public Network DHCP
Router has internet access

# Usage
Start VM: \
```vagrant up``` 

SSH into VM \
```vagrant ssh <vmname>```

## Router Config
See [Router Script](./router_setup.sh)