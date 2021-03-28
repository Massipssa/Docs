# EC2

## AMI (Amazon Machine Image)

- Conatains
    - Snapshots, perimissions and block device mapping
    - Best practice: Stop the image before creating the image
- Can be:
    - Private
    - Public
    - We can add account to use the image
- Adavantange of using AMI
    - IAM pre-backing ??
    - Immutable IAM ??
- Used when we need just static provisioning

## Boostrap

- Give an EC2 instance a serie of instructions to do (Customize an instance)
- We can use:
    - Bash (linux) powershell (windows) file
    - Cloudinit file
- Used to dynamically provision an instance

## ENI (Elastic Network Interface), IP, and DNS

- Public instance
    - Has public IP
    - Public IP is changed when an instance is stopped
- Private instance
    - Private IP doesn't change

## Elastic IP

- Allows to allocate IP adress to an instance
