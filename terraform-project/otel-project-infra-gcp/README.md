
## Best way to login to the instance in Private Subnet (Alternatively, we can use ProxyJump option)
### Start the SSH agent
eval $(ssh-agent)

### Add your private key
ssh-add ~/.ssh/id_rsa

### SSH to public instance first
ssh -A venkat@<public-instance-ip>

### From public instance, SSH to private instance
ssh venkat@<private-instance-ip>

## Current Module Structure:
otel-project-infra-gcp/
├── main.tf           # Main configuration
├── variables.tf      # Variable definitions
├── outputs.tf        # Output definitions
├── terraform.tfvars  # Variable values
└── modules/
    ├── vpc/         # Network configuration
    └── virtual_machine/ # VM configuration